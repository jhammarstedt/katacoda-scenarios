# Your workspace
<!--
Step one is clear and fairly concise.

A minor annoyance was that the config of email was set to a katacoda execute field, making execute with the wrong email, suggest that you change it into a copy-paste only, since there is no real point in executing that. 
NEED TO FIX?

The permission script (chmod) seems more like a chore that has to be done, it does not really feel very relevant to the tutorial. if possible put in in a script that is executed when the step starts automatically instead. 
**Fixed by running the clone and permissions as a script beforehand.**

I also tried the other option, to not write any code manually, however this caused problems, since all the files were committed the first time, making the outputs of the action a bit confusing since they were not what was said. 
**Fixed by adding a disclaimer that the option 2 would not allow to run the partial workflow**


**EXTRA FIX: Got an extra question from another student about the possibility to benchmark the two functions simuntaniously so modified the tutorial, scipts and benchmarks to compare both of them in the same workflow **
-->
At the top, you can see three folders that you have access to during the tutorial
*  A bash terminal
* Visual Studio Code IDE editor
* Link to the original GitHub repository

# Setting up your GitHub repository
We have started by just cloning our repository, giving access to the relevant scripts, and give you git credentials (you don't need to have the original email)


This tutorial can then be done in two ways
1. Code along (<ins>Recommended option!</ins>)
2. Having all the code and just follow the reading 
    * **Note**, since you then have all the code, you will not be able to run partial actions as explained in the tutorial, so if you choose this option just follow the reading and try to push your changes in the end.

If you wish to go for 1. then delete the relevant scripts by running:

`./scripts/clear_tutorial.sh`{{execute}}

The docs folder contains the CSS and HTML files for the GitHub page. Since we took the table from a prebuilt template we will not cover how to write one in HTML. 

In the scripts folder, we have a script for cleaning the table which is mostly for convenience.

<!-- We now need to upload our changes to GitHub to be able to watch the workflow later. 
Enter some credentials:
``` git config --global user.email "you@example.com"```{{execute}} 

``` git config --global user.name "Tutorial bot"```{{execute}} -->

1. Add the changes to your local repository: ``` git add . ```{{execute}}
2. Commit them ``` git commit -m 'first commit' ```{{execute}}
3. Go into GitHub (you can use the link provided next to the terminal).
4. Go back to your profile and create a new repository, for simplicity name it: ```Benchmark_Tutorial```{{copy}}
5. Make it public
6. Skip creating a readme and a gitignore for now and just create the repository
7. Copy the HTTPS link
8. Add it to your personal remote by running: 
```git remote add personal https://github.com/YOUR_USERNAME/Benchmark_Tutorial.git ```{{copy}}

9. To push: In normal cases, you could use your SSH key but in Katacoda it is easier to take your `personal access token`, if you are not familiar with how to get one just follow the steps [here](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token). When selecting scopes for your `personal access token`, enable repo and workflow. (Save the token since you'll need it to push things further on)
10. Use the copied personal access token and push
    * ``` git push -u personal```{{execute}}
    * Enter your username and then paste in your access token as the password
    * Note that the password will not be visible when you paste it


So finally everything is set up and we are ready, let us get into the fun stuff!🎈

<!--Since GitHub actions are executed on a repository, we will need to create a repository on GitHub. Fortunately, we can do most of the work from the Katacoda terminal (The Katacoda terminal will be referred to as the terminal in this tutorial since we won't use a local terminal on our system).

We will start by creating a new folder that will contain our GitHub repository.
1. Run the following commands in the terminal to create a GitHub repository called tutorial:

` mkdir tutorial`

` cd tutorial`

` git init`

` cat <<EOM> README.md Testing out CI with GitHub actions EOM`

` git add .`

` git commit -m 'first commit' ` 

2. Log into your [GitHub Account](https://github.com/) and create a new <ins>public</ins> repository named "Benchmark_Tutorial".

3. In the terminal run (insert your own GitHub username first)

`git add remote origin https://github.com/INSERT_GITHUB_USERNAME/Benchmark_Tutorial.git `
`git push`
Then enter your credentials. -->


