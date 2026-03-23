#!/bin/bash

# Add all changes
git add .

# Ask for commit message
read -p "Commit message: " msg

# Commit and push
git commit -m "$msg"
git push
