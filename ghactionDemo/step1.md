# Setting up your GitHub repository

Since GitHub actions are executed on a repository, we will need to create a repository on GitHub. Fortunately we are able do most of the work from the Katacoda terminal (The Katacoda terminal will be referred to as terminal in this tutorial since we won't use a local terminal on our system).

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
Then enter your credentials.

