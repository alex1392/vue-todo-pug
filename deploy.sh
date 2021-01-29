#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git add -A # stage all changes
git commit -m 'deploy' # commit local changes

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push :gh-pages

cd -