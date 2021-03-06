#!/bin/bash

set -e

needsCommit () {
  echo '\n\n\x1B[37mPlease commit all changes before deploying!\x1B[0m e.g.\n\ngit add --force --all build && git commit -m "[build] Update build."\n\n'
  git status
  exit 1
}

git diff-index --quiet HEAD -- || needsCommit
git branch -D master
git subtree split --prefix build -b master
git push -f origin master:master
