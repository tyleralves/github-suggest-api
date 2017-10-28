#!/bin/bash
mkdir temp_clone
cd temp_clone
# Just for testing, REMOVE!
rm -rf volunteerApp.git
# When user makes their first annotation
git clone --bare --depth 30 https://github.com/tyleralves/volunteerApp.git &> /dev/null
git pull &> /dev/null
cd volunteerApp.git
startCommit=$(git log --pretty=format:%H | tail -1)
git blame -L 1,4 -n --reverse $startCommit -- app.js
# BEGIN removing past history
git fetch --depth 1
git reflog expire --expire-unreachable=now --all
git gc --aggressive --prune=all
# END remove past history
# Local history only contains HEAD
exit 2


# TODO: Extract blame line number and
