# Ready to put it all together!
Now we have everything we need to both run the continuous benchmarking and display it on our page. 

So add, commit and push your changes!
```
git add .
git commit -m 'full CI benchmarking with GH pages'
git push
```{{execute}}

You should now be able to see how the workflow runs and shortly after the commit should be visible in the table on the page (it might take up to one minute after the workflow runs before the page updates). To clean and reset the table you can just run:

`./scripts/clear_table.sh`{{execute}}

Some scripts might require an **item** to run, a reminder is to be found in the outro.

And then push the change to the repository. 
