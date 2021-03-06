
# Adding Steps to GitHub Action
<!--
Good explanations and nice with links pointing to additional material. However, noticed that the content of the workflow file on top is different from the one at the bottom.  I didn't notice this until the workflow failed when I pushed it, please fix that (missing "src/" prefixed in the python command). FIXED

-->


`steps` is the sequence of tasks the job will run, which we will define now. Add the lines underneath steps or replace the code with the following lines:
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
</pre>

#### Step 1: Check-out GitHub repository

`uses: actions/checkout@v2` is an action that checks out our repository under $GITHUB_WORKSPACE, so our workflow can access it.

`persist-credentials: false` We need a GitHub auth token to enable our scripts to run authenticated git commands. This auth token is removed during post-job clean-up by default. This command allows us to opt out of this so that our auth token is persistent.

`fetch-depth: 0` By default, only a single commit is fetched. This command allows us to fetch all history for all branches and tags.

The documentation for the checkout action is available [here](https://github.com/actions/checkout).

#### Step 2: Set up Python environment and run test script

`uses: actions/setup-python@v1` is an action that sets up a Python environment that we can use for our action. It gives us the ability to download, install and set up Python packages.

`pwd` Prints the current working directory for reference 

`python -m pip install --upgrade pip` Updates pip to the latest version in our environment. Pip is a package installer for Python.

`
 if [ -f requirements.txt ]; 
 then pip install -r requirements.txt; fi
`

These commands install the dependencies we need for our action using pip. The dependencies are defined in the requirements.txt file which we have already created.

`python test.py`  will run the simple test.py script that prints out a message.

The documentation for the setup python action is available [here](https://github.com/actions/setup-python).

## Push Changes to GitHub Repository

We can now push all the changes we have made in the local repository to the remote on GitHub by running the following in the terminal:

` git add .`{{execute}}

` git commit -m 'Add initial GitHub action'`{{execute}} 

` git push`{{execute}}
 
 This will trigger the action right away. In the next step, you'll learn where to find it!
