#!/bin/bash

for remote in `git branch -r | grep -v '\->'`; do (git branch --track ${remote#origin/} $remote; git checkout ${remote#origin/}; git pull ); done; git checkout master; git pull --all
