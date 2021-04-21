# testing



```

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
```
