# Running the GitHub Action

<!-- We will now test the GitHub action by making a push request to our remote GitHub repository. Make a trivial change to one of the files in the repository(such as adding a space in the README). Then push the change to the remote repository by running the following commands in the terminal: 

`git add .`{{execute}}

`git commit -m 'Made trivial change to the code'`{{execute}}

`git push`{{execute}} -->

We will then go to our remote repo at`https://github.com/INSERT_GITHUB_USERNAME/Benchmark_Tutorial `using our preferred web browser (Note: Insert your GitHub username into the url).

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/github-action-bar.png?raw=true" />

In our GitHub repository, we can find the executed action in the Actions tab in the navigation bar as seen above. Enter the Actions page by clicking the Action tab.


<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/demo-action-screen.png?raw=true" />

We should be able to see a workflow with a green checkmark and the commit message we used under 'All workflows' as seen above. If there is a yellow circle instead of a green checkmark, the action is still running. There should be a green checkmark if you wait a moment and refresh the page.

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/clicked-demo.png?raw=true" />

Click the workflow to get more details regarding its execution. We should be able to see information such as status and total duration like the image above.

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/demo-action-result.png?raw=true" />

Click 'pytest-benchmarking' to get more detailed information of each step in the workflow as seen in the image above.

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/demo-action-result-clicked.png?raw=true" />

Click the 'Installing and running pytest' step to get the workflow output in the GitHub workflow terminal as seen in the image above. The workflow has succeeded if you can see 

`"Hello you're running the action on a commit, seeing this message means that everything until now seems to work!"`

in the output. In the image above, you can find the message on line 42.


