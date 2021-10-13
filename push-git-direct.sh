#! /bin/bash

# Adding commits done to github ...
git add --all

echo "(Comment)  What have you done? " 
read -p ">> " comment
git commit -m "$comment"
echo

read -p "(Username)  Your GitHub Username: " username
read -p "(Repository)  Present Working Repository: " repo
read -p "(GitHub Token)  Your Personal Access Token: " token

echo 
if [ -z "$repo" ]; then
	echo "Please generate your GitHub Personal Access Token."
	echo "Steps to generate a new GitHub Personal Access Token ..."
	echo 
	echo " → Login GitHub <https://github.com/login>"
	echo " → Use My Account"
	echo " → Settings"
	echo " → Developer settings"
	echo " → Personal access tokens"
	echo " → Generate new token"
	echo " → Come back & Relaunch the script"
else
	git remote set-url origin https://$token@github.com/$username/$repo
	git push
fi
