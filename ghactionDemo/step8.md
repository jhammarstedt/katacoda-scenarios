# Ready to put it all together!
Now we have everything we need to both run the continious benchmarking and display it in our page. 

So add, commit and push your changes!
```
git add .
git commit -m 'full CI benchmarking with gh pages'
git push
```{{execute}}

You should now be able to see how the workflow runs and shortly after the commit should be visible in the table on the page (it might take up to one minute after the workflow run before the page updates). To clean and reset the table you can just run:

`./scripts/clear_table.sh`{{execute}}

And then push the change it to the repository again.
