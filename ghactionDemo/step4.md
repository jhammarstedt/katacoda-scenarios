# Running the Pytest benchmarking tool

To run the pytest benchmarking tool, we need a Python script to benchmark. We create a Python script by running the following commands in the terminal:

``` 
touch benchmarking.py

```   

We then insert the following code into 'benchmarking.py' using a text editor:

``` 
import pytest
import time


def turtle(n=1000000):
    """Regular for loop"""
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
    
def test_case(benchmark):
    benchmark(turtle)
``` 


```   
                pytest benchmarking.py --benchmark-json output.json
                python data/generate_output.py

```   




```
                        - uses: actions/setup-python@v1
                        - name: Installing and running pytest
                          run: |
                                pwd
                                python -m pip install --upgrade pip
                                if [ -f requirements.txt ]; 
                                then pip install -r requirements.txt; fi
                                python test.py
                                pytest benchmarking.py --benchmark-json output.json
                                python data/generate_output.py
```




                                
Your file should look like this:

```   
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
                                python test.py
                                pytest benchmarking.py --benchmark-json output.json
                                python data/generate_output.py
``` 

