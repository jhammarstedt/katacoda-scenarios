# Setting up your GitHub repository

To start of we're going to clone the project repository. Copy paste or press the button next to the code to execute it

`git clone https://github.com/jhammarstedt/Benchmarking-DevOps.git`{{execute}}

Enter the directory ```cd Benchmarking-DevOps```{{execute}}

To give permission for all scripts we need run:
`chmod +x scripts/clear_tutorial.sh scripts/clear_table.sh`{{execute}}

This tutorial can then be done in two ways
1. By having all the code and just follow the reading
2. Code along. 

If you wish to go for 2. then delete the relevant scripts by runnig:

`./scripts/clear_tutorial.sh`{{execute}}

The docs filder contains the css and html files for the github page. Since we took the table from a prebuilt template we won't cover how to write one in html, but if you wish to still do it by yourself you can run

`rm -rf docs`

In the scripts folder we have a script for cleaning the table which is mostly for conviniece.

Next to the terminal you have access to the original repository if you need.

We now need to upload our changes to github to be able to watch the workflow later.
Add you personal info: 
``` git config --global user.email "you@example.com" git config --global user.name "Tutorial bot```{{execute}}

1. Add the changes to your local repository: ``` git add . ```{{execute}}
2. Commit them ``` git commit -m 'first commit' ```{{execute}}
3. Go into Github (you can use the link provided next to the terminal).
4. Go back to your own profile and create a new repository, for simplicity name it: ```ghactions_katacoda```{{copy}}
5. Make it public
6. Ignore to create readme gitignore for now and just create it
7. Copy the HTTPS link
8. Add it to your personal remote by running: 
```git remote add personal https://github.com/YOUR_USERNAME/ghactions_katacoda.git```

9. To push: In normal cases you could use your SSH key but in katacoda it's easier to take your `personal access token`, if you're not familiar how to get one just follow the steps [here](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token).
10. Use the copied personal access token and push
    * ``` git push -u personal```{{execute}}
    * enter your username and then paste in your access token as password


So finally everything is set up and we're ready, let's get into the fun stuff!🎈

<!--Since GitHub actions are executed on a repository, we will need to create a repository on GitHub. Fortunately we are able do most of the work from the Katacoda terminal (The Katacoda terminal will be referred to as terminal in this tutorial since we won't use a local terminal on our system).

We will start by creating a new folder which will contain our GitHub repository.
1. Run the following commands in the terminal to create a GitHub repository called tutorial:

` mkdir tutorial`

` cd tutorial`

` git init`

` cat <<EOM> README.md Testing out CI with github actions EOM`

` git add .`

` git commit -m 'first commit' ` 

2. Log into your [GitHub Account](https://github.com/) and create a new <ins>public</ins> repository named "Benchmark_Tutorial".

3. In the terminal run (insert your own GitHub username first)

`git add remote origin https://github.com/INSERT_GITHUB_USERNAME/Benchmark_Tutorial.git `
`git push`
Then enter your credentials. -->


