# Running the Pytest benchmarking tool

To run the pytest benchmarking tool, we first need some functions to test/benchmark on. To make life easy we will just name it `benchmark.py` and put it in our source folder.
 
 `touch src/benchmarking.py`{{execute}}


We then insert the following code into 'benchmarking.py' in the IDE:

<pre class="file" 
data-target = "clipboard">
import pytest

# Here are some example functions to run, can of course be replaced by your own to test things out
def turtle(n=1000000):
    """Regular for loops"""
    x = [] 
    for i in range(n,0,-1):
        x.append(str(i))
    
    s= ""
    for i in x:
        s+= i

def cheetah(n=1000000):
    """Faster with list comprehenssion and join"""
    x = [str(i) for i in range(n,0,-1)]
    s = "".join(x)

# This is where pytest gets called   
def test_case(benchmark):
    benchmark(turtle)
</pre>

This Python script contains two functions that can be used for the performance test. The important addition is to actually pass the `benchmark` fixture to the test_case function. When then calling `benchmark()` pytest will run `benchmark(test_function)` on any function passed to it. For more info go [here](https://pypi.org/project/pytest-benchmark/)

Now we have our testing functions. Then it's time to add it to the workflow!🛠

Add the following line to the `python.yml` file, continuing right below the requirements installation
``` pytest src/benchmarking.py --benchmark-json output.json ```{{copy}}
                             
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

Commit and push these changes to Github again and watch you test run! Going back to the same place as before you should now be able to see the result of your test:

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/first_pytest.PNG?raw=true" />


