# Setting up your Github repo

Since everything will be in a Github Repository you need to create a github repo, luckily we can do most of it from the Katacoda terminal (will just be refered to terminal in this tutorial since we won't use the local one).

We'll start by creating a new folder to have our Repo in here.
1. Run the following commands to create a github repository called tutorial:

` mkdir tutorial`

` cd tutorial`

` git init`

` cat <<EOM> README.md Testing out CI with github actions EOM`

` git add .`

` git commit -m 'first commit' ` 

2. Log into your [Github Account](https://github.com/) and create a new <ins>public</ins> repository named "Benchmark_Tutorial".

3. In the terminal run (insert your own gh user name first)

`git add remote origin https://github.com/INSERT_GITHUB_USERNAME/Benchmark_Tutorial.git `
`git push`
Then enter your credentials.

