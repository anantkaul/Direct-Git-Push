#! /bin/bash

# --------------------------------------------------------------------------------
# MIT License

# Copyright (c) 2021 Anant Kaul

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# --------------------------------------------------------------------------------

# Adding commits done to github ...
git add --all

echo " (Comment)  What have you done? " 
read -p "  >> " comment
git commit -m "$comment"
echo

read -p " (Username)  Your GitHub Username: " username
read -p " (Repository)  Present Working Repository: " repo
read -p " (GitHub Token)  Your Personal Access Token: " token

echo 
if [ -z "$repo" ]; then
	echo " Please generate your GitHub Personal Access Token."
	echo " Steps to generate a new GitHub Personal Access Token ..."
	echo 
	echo "  → Login GitHub <https://github.com/login>"
	echo "  → Use My Account"
	echo "  → Settings"
	echo "  → Developer settings"
	echo "  → Personal access tokens"
	echo "  → Generate new token"
	echo "  → Come back & Relaunch the script"
else
	git remote set-url origin https://$token@github.com/$username/$repo
	git push
fi
