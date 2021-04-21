# Setting up an initial action to test the workflow
<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/tut_part1.PNG?raw=true" width="600" height="400" />
We're gonna start with a "Hello World" action to get set up, create a python file by running:

`cat <<EOM> test.py`

> `print("Hello you're running your first action on a commit!")`
 
>`EOM`

Github Actions are excecuted in the .github/workflows of our repo folder so first off we we need to create these:

`mkdir .github`

`mkdir .github/workflows`

The actions are executed from a YML file in workflows/ directory. Therefore we will create our workflow file:

``` touch .github/workflows/python.yml```

Then open your favorite text editor and start writing the file:
```
name: Python benchmarking using pytest
on: push
jobs:
        benchmark:
                name: pytest-benchmarking
                runs-on: ubuntu-latest
                steps:
```
`name` is the name of our workflows which is displayed in the actions page on github

`on` is the name of the Github event that triggers the workflow, in our case on a <ins>push</ins>.

`jobs` A workflow run is made up of jobs, but in the action only one is required so we won't need to distinguish between having multiple. We then specify the name of the job as `pytest-benchmarking`. 

`runs-on` is the type of machine to run the job on, which in this case will be ubuntu.

`steps` is the sequence of tasks the job will run, which we will define now. Under steps write the following lines:

```
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
Uses...... (continue here)


The full file will look like this:
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
                        - name: Commit files
                          run: |
                               git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
                               git config --local user.name "github-actions[bot]"
                               git add .
                               git commit -m "Add new data" -a
                        - name: Push changes
                          uses: ad-m/github-push-action@master
                          with:
                                github_token: ${{ secrets.GITHUB_TOKEN }}
                                branch: ${{ github.ref }} 
```

The full documentation is available [here](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)