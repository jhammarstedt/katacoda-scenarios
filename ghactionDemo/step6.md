# Committing and Pushing Changes to GitHub Repository

In the previous slide, we stored the benchmarking results locally in the 'index.html' file. We want to store the results in the remote GitHub repository so that the benchmarking results are persistent and available to other repository contributers. Using a text editor, open the '.github/workflows/python.yml' file and insert the following at the botom of the steps section:

<pre class="file" data-filename=".github/workflows/python.yml" data-target="append">
<code class="yml">
                        - name: Commit files
                          run: |
                               git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
                               git config --local user.name "github-actions[bot]"
                               git add .
                               git commit -m "Add new data" -a
</code>
</pre>


This code adds all the changed files from the benchmarking script and commits them using the message "Add new data". We configure our GitHub so that a bot makes the commit using the commands 
``` 
git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config --local user.name "github-actions[bot]"
```{{copy}}.


We need to push the committed changes to the remote repository. We do that by inserting the following code directly after the code we used for committing:

<pre class="file" data-filename=".github/workflows/python.yml" data-target="append">
<code class="yml">
                        - name: Push changes
                          uses: ad-m/github-push-action@master
                          with:
                                github_token: ${{ secrets.GITHUB_TOKEN }}
                                branch: ${{ github.ref }} 
</code>
</pre>


`uses: ad-m/github-push-action@master` This is a GitHub action for pushing local changes to a GitHub repository using GitHub token.

`github_token: ${{ secrets.GITHUB_TOKEN }}` This is the GitHub token used for pushing. The token can be passed as  ${{ secrets.GITHUB_TOKEN }}.

`branch: ${{ github.ref }}` This specifies the destination branch that we are pushing our changes to.


Our '.github/workflows/python.yml' file should now look like this:

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
</code>
</pre>

