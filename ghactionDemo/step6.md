# Committing and Pushing Changes to GitHub Repository
<!--

Same thing with the copying of code messing with the indentation, other than that the content is good. 
- ADD: MOVE THEM TO ONE FILE?

This is where I had an issue with a merge conflict though. Previous steps seems to have produced files that i had to pull before i could push it. Not sure if that was supposed to happen, if not, look into it. If it is on purpose, then I suggest you add a note about it.
- ADD: SHOULD WE ADRESS THIS


 -->
The format of the output file is json and it will be stored in the workflow, in order to later display it on our github page we need to actually push it from the workflow to our github repository. This can be done by first commiting the files in the workflow and then using another github action to push them.

## Commit
Begin by commiting the output file:
<pre class="file" 
data-target = "clipboard">
- name: Commit files
  run: |
        git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
        git config --local user.name "github-actions[bot]"
        git add .
        git commit -m "Add new data" -a

</pre>

This code adds all the changed files from the benchmarking script and commits them using the message "Add new data". We configure our GitHub so that a bot makes the commit using the commands. 

`git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"`

`git config --local user.name "github-actions[bot]"`

## Push
We need to push the committed changes to the remote repository. We do that by inserting the following code directly after the code we used for committing:
<pre class="file" 
data-target = "clipboard">
- name: Push changes
  uses: ad-m/github-push-action@master
  with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        branch: ${{ github.ref }} 
</pre>

`uses: ad-m/github-push-action@master` This is another GitHub action for pushing local changes to a GitHub repository using GitHub token.

`github_token: ${{ secrets.GITHUB_TOKEN }}` This is the GitHub token needed to authenticate the push.

`branch: ${{ github.ref }}` This specifies the destination branch that we are pushing our changes to, which will be the current branch we're on.


Our '.github/workflows/python.yml' file should now look like this:


<details> 
  <summary>The current python.yml file is available here</summary>
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
</pre>
</details> 
If you do another commit and push you should be able to see the output.json file in your repository after the Action has executed successfully. 

(A tip could be to change the benchmark function to `benchmark(cheetah)` instead and see the performance on the faster code)

