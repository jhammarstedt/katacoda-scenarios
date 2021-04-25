# CI: Benchmarking Python scripts using Github Actions, Pytest and Github Pages
## Overview
In this tutorial you will learn how to create and run a [Github Action](https://github.com/features/actions) that will let you run continuous benchmarking tests and compare new versions of your python scripts using [Pytest](https://docs.pytest.org/en/6.2.x/). This will help developers easily compare benchmark results and alert on worse performance when making a new push.

This tutorial will also introduce [Github Pages](https://pages.github.com/) which lets you host your repository as a webpage directly from Github!

## Learning outcomes
At the completion of this tutorial you'll be able to:

1. Create simple Github Action that will let you test and compare python scripts on pushes to your GitHub repository
    * With a few modifications you can also implement them for other tasks to enable CI/CD in your other projects! (Pretty cool right!)
    * You can also use this action with similar performance tools for other programming languages.
2. Create your first Github Page that will display the results from your testing

## Overview of the framework
Below is an image of what you'll create today.

<img src="https://github.com/jhammarstedt/katacoda-scenarios/blob/main/ghactionDemo/images/framework.PNG?raw=true" width="700" height="500" />

Don't worry if this seems hard to understand now, we'll break it down step by step!
## Requirements and prerequisits 
1. A GitHub account
2. Basic knowledge of Git and Python. 
3. Bonus: For visuals in GitHub pages we'll use HTML and CSS but since this is not the object of the tutorial you can just get a prebuilt table that we will provide. 

## So now we're ready, let's get coding!
(This tutorial might require a **shovel** )


<img src="https://media.giphy.com/media/sSmxfWnEVxtWU/giphy.gif" width="300" height="300" />
