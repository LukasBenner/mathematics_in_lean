#!/usr/bin/env bash
set -e

# Build
mdbook build


# 3. Deploy
rm -rf deploy
mkdir deploy
cd deploy
git init
cp -r ../html/* .
git add -A
git commit -m "Update `date`"
git push git@github.com:LukasBenner/mathematics_in_lean.git +HEAD:gh-pages
cd ..
rm -rf deploy
