#!/bin/bash
echo "about to deploy..."
git config user.name "Travis CI"
git config user.email "noone@noone.com"
git config push.default simple
git branch --all #which branch are we on?
#git checkout master
mv class-pins.topojson class-pins
echo "I found new files, combining and pushing now!"
geojson-merge *.topojson class-pins > class-pins.topojson
rm class-pins
mv class-pins.topojson class-pins
rm *.topojson
mv class-pins class-pins.topojson
git add -A
git commit -m "[skip ci] clean up class files"
git remote set-url origin git@github.com:hectorsector/new-travel.git
git push # -u origin master
echo "All done. Please go create the PR and merge if tests are passing!"