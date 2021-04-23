
# Adding Steps to GitHub Action

`steps` is the sequence of tasks the job will run, which we will define now. Under steps write the following lines:
<pre class="file" data-filename=".github/workflows/python.yml" data-target="append">
<code class="yml">
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
</code>
</pre>

#### Step 1: Check-out GitHub repository

`uses: actions/checkout@v2` is an action that checks-out our repository under $GITHUB_WORKSPACE, so our workflow can access it.

`persist-credentials: false` We need a GitHub auth token to enable our scripts to run authenticated git commands. This auth token is removed during post-job clean up by default. This command allows us to opt-out of this so that our auth token is persistent.

`fetch-depth: 0` By default, only a single commit is fetched. This command allows us to fetch all history for all branches and tags.

The documentation for the checkout action is available [here](https://github.com/actions/checkout)

#### Step 2: Set up Python environment and run test script

`uses: actions/setup-python@v1` is an action that sets up a Python environment that we can use for our action. It gives us the ability to download, install and set up Python packages.

`pwd` Prints the current working directory

`python -m pip install --upgrade pip` Updates pip to the latest version in our environment. Pip is a package installer for Python.

`
 if [ -f requirements.txt ]; 
 then pip install -r requirements.txt; fi
`
These commands install the dependencies we need for our action using pip. The dependencies are defined in the requirements.txt file which we have already created.

`python test.py` This command will run the simple test.py script that prints out a message.

The documentation for the setup python action is available [here](https://github.com/actions/setup-python)

### Workflow file

The '.github/workflows/python.yml' file should look like this, if you want to make sure the formating is right you can just run this code to get the correct file:
<pre class="file" data-filename=".github/workflows/python.yml" data-target="append">
<code class="yml">
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
</code>
</pre> 

## Push Changes to GitHub Repository

We can now push all the changes we have made in the local repository to the remote on github by running the following in the terminal:

```   
git add .
git commit -m 'Add initial GitHub action'
git push
```   


