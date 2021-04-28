# Running the GitHub Action
<!-- FEEDBACK
Very clear images showing what to do, a nice addition would be to explain the steps shown in the log (how they relate to the steps in the workflow file) making it more intuitive why that subsection should be selected.
NEEDS TO BE ADDED

  -->
We will then go to our remote repository at`https://github.com/INSERT_GITHUB_USERNAME/Benchmark_Tutorial `{{copy}}using any preferred web browser (Note: Insert your GitHub username into the URL).

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/github-action-bar.png?raw=true" />

In our GitHub repository, we can find the executed action in the Actions tab in the navigation bar as seen above. Enter the Actions page by clicking the Action tab.


<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/demo-action-screen.png?raw=true" />

We should be able to see a workflow with a green checkmark and the commit message we used under 'All workflows' as seen above. If there is a yellow circle instead of a green checkmark, the action is still running. There should be a green checkmark if you wait a moment and refresh the page.

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/clicked-demo.png?raw=true" />

Click the workflow to get more details regarding its execution. We should be able to see information such as status and total duration like the image above.

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/demo-action-result.png?raw=true" />

Click 'pytest-benchmarking' to get more detailed information on each step in the workflow as seen in the image above.

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/demo-action-result-clicked.png?raw=true" />

Click the 'Installing and running pytest' step to get the workflow output in the GitHub workflow terminal as seen in the image above. Some of the steps seen above, such as "Set up job" and "Complete job", are generated automatically by GitHub. The rest of the steps seen above are defined as steps in our workflow. The workflow has succeeded if you can see 

`"Hello you're running the action on a commit, seeing this message means that everything until now seems to work!"`

in the output. In the image above, you can find the message on line 42.
