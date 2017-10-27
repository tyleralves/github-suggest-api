#!/bin/bash
echo 'testscript'
mkdir temp_clone && cd temp_clone
git clone --bare --depth 10 https://github.com/tyleralves/volunteerApp.git
cd volunteerApp.git
git blame master -- app.js
exit 2
