# Running the Pytest benchmarking tool
<!-- 

The steps are explained clearly, would be nice if you gave some more info about what the python benchmark does (what measures it takes a.s.o), I know that there is a link, but a short inline explanation would be nice. 
**Added a section about benchmarking and what it outputs**

Also suggest you add a note what the functions do and why you chose them (it is fairly obvious if you know python, but not everyone does). 
**Fixed by adding comments explaning the purpose of the functions in the benchmarking.py script.**

-->
To run the pytest benchmarking tool, we first need some functions to test/benchmark on. To make life easy we will just name it `benchmark.py` and put it in our source folder.
 
 `touch src/benchmarking.py`{{execute}}


We then insert the following code into 'benchmarking.py' in the IDE:

The explanation for the code can be found in the comments. 

<pre class="file" 
data-target = "clipboard">

import pytest

# Here are some example functions to run, can of course be replaced by your own to test things out

# Task: Create a list of N numbers in string format, then add all of these to one long string 
def turtle(n=1000000):
    """
    Regular for loops
    This is an example of a slow running code, we start of by running a regular for loop, 
    which is ok but not best practice in python for doing these simple tasks. 
    To then create the string we run another for loop, which is inefficient since python has
    several built in functions to handle this. 
    """
    x = [] 
    for i in range(n,0,-1):
        x.append(str(i))
    
    s= ""
    for i in x:
        s+= i

def cheetah(n=1000000):
    """
    Faster with list comprehenssion and join
    Here we utilize pythons list comprehenssion to perform the same task but faster.
    "".join() is a python function that operates on lists and directly inserts all elements.
    The separator will be whatever we put in the "" (in this case none), but you could separate them
    by space " ".join(x) or comma ",".join(x)
    """

    x = [str(i) for i in range(n,0,-1)]
    s = "".join(x)

# This is where pytest gets called   
def test_turtle(benchmark):
    result = benchmark(turtle)

def test_cheetah(benchmark):
    result = benchmark(cheetah)
</pre>

## About pytest-benchmarking
This Python script contains two functions that can be used for the performance test. The important addition is to pass the `benchmark` fixture to the test functions. <em>This fixture is a callable object that will benchmark any function passed to it.</em> So, when then calling `benchmark()` pytest will run `benchmark(test_function)` on the `test_function`. 

Pytest will execute 5 <em>rounds</em> on each function. A round is a set of runs that are averaged together. By default a round will run your function as many times as needed to fit a <em>10*TIMER_RESOLUTION</em> period, which can be set by `--benchmark-min-time` and `--benchmark-calibration-precision`.

The default that you're doing will measure in miliseconds:
* Min: The average **minimum** between the runs
* Max: The average **maximum** between the runs
* Mean: Normal average between runs
* StdDev: The average standard deviation between the runs
* Median: The average median between the runs
* IQR : InterQuertile Range. Different way to measure variance
* Outliers: How many runs falling outside the 95% confidence interval
* OPS: Operations per second 


For more info go to their [documentation](https://pypi.org/project/pytest-benchmark/)

## Adding pytest to the workflow

Now we have our testing functions. Then it's time to add it to the workflow!🛠

Add the following line to the `python.yml` file, continuing right below the installation of the requirements
``` pytest src/benchmarking.py --benchmark-json output.json ```{{copy}}.

If you just want to run on one function you can comment out either `turtle_test` or `cheetah_test`, but this would require you to make some adjustments in the GitHub pages, so just run both of them in this tutorial. 

Then we specify to get the output as a JSON file with `--benchmark-json output.json`.

**Note** you can compare previous benchmark files using `--benchmark-compare`, but to simplify this tutorial we're not saving the old benchmarks (some results will be stored in the GitHub pages). But to add features read the [documentation](https://pypi.org/project/pytest-benchmark/). 



Your '.github/workflows/python.yml' file should now look like this:

<pre class="file" 
data-target = "clipboard">
name: Python benchmarking using pytest
on: push
jobs:
        benchmark:
                name: pytest-benchmarking
                runs-on: ubuntu-latest
                steps:
                        - uses: actions/checkout@v2
                          with:
                                persist-credentials: false
                                fetch-depth: 0 
                        - uses: actions/setup-python@v1
                        - name: Installing and running pytest
                          run: |
                                pwd
                                python -m pip install --upgrade pip
                                if [ -f requirements.txt ]; 
                                then pip install -r requirements.txt; fi
                                python src/test.py
                                pytest src/benchmarking.py --benchmark-json output.json
</pre>

This will run the benchmark and the result will be stored in our output.json file.

Commit and push these changes to Github again and watch your test run! Going back to the same place as before you should now be able to see the result of your test, where you can compare the two functions:

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/first_pytest.PNG?raw=true" />


