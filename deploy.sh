#!/bin/bash

# master
git checkout master
git add .
git commit -a -m 'Commit before deployment (must have forgot something)...'
git push

# Build Jekyll
jekyll build

# gh-pages
git checkout gh-pages
mv CNAME _site/
mv .git _site/
find . -maxdepth 1 -not -name '_site' | xargs rm -rf
mv _site/* .
mv _site/.git .
rm -rf ./_site
rm -rf deploy.sh
git add .
git commit -a -m "Deployment $(date +"%Y-%m-%d %T")"
git push

# back to master
git checkout master