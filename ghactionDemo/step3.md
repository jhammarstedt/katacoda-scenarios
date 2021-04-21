# testing

```   
                pytest benchmarking.py --benchmark-json output.json
                python data/generate_output.py

```   


```   
                        - uses: actions/checkout@v2
                          with:
                                persist-credentials: false
                                fetch-depth: 0 
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
