# Setting up an initial action to test the workflow
<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/tut_part1.PNG?raw=true" height="400" />

## Initial Set Up

** Note ** most of these steps can also be performed in the IDE but we will use the terminal for most part. Feel free to choose the approach you like the best.

For our initial setup, we are gonna create a simple "Hello World" action. 
We accomplish this by creating a Python file by running the following commands in the terminal:

Create a src folder

```mkdir src```{{execute}}

Then write a simple Python file:

```
cat <<EOM> src/test.py
print("Hello you're running the action on a commit, seeing this message means that everything until now seems to work!")
EOM ```{{execute}}

## Prepare Github Action

To execute GitHub Actions, a '.github/workflows' directory is required in the repository to execute the action. We create the '.github/workflows' directory in our repository running the following commands in the terminal:

``` 
mkdir .github 
mkdir .github/workflows 
```{{execute}}

**Note** that this directory is hidden, but we can still navigate through it and display it by running `ls -a`{{execute}} or watch it in VSCode (recommended)

The actions are executed from a YML file in 'workflows/' directory. We therefore need to create our own workflow file by running:

``` touch .github/workflows/python.yml```{{execute}}

Then edit the '.github/workflows/python.yml' file in the IDE, to start of we will give the workflow a name, and add a job:
(if you don't see the file right away, try to press the small `refresh explorer` button in the IDE)

<pre class="github/workflows/python.yml" data-target = "clipboard">
name: Python benchmarking using pytest
on: push
jobs:
        benchmark:
                name: pytest-benchmarking
                runs-on: ubuntu-latest
                steps:
</pre>

### Jobs

`name` is the name of our workflow which is displayed in the actions page on GitHub

`on` is the name of the GitHub event that triggers the workflow. In our case, the workflow will be triggered on a <ins>push</ins> to the repository.

`jobs` A workflow run is made up of jobs, but in the action only one is required so we won't need to distinguish between having multiple. We then specify the name of the job as `pytest-benchmarking`. 

`runs-on` is the type of machine to run the job on, which in this case will be the latest version of Ubuntu.

The full documentation for workflow syntax is available [here](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)


