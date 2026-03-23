#!/bin/bash
# scripts/git_update.sh
# Sync local ATS_10_webapp with GitHub using SSH and prompt for commit message

cd ~/projects_series/ATS_10_webapp || exit

# Start ssh-agent and add ATS_10 key (if not already)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_ats10

# Initialize git if not already
if [ ! -d ".git" ]; then
    git init
fi

# Ensure SSH remote is set
git remote remove origin 2>/dev/null
git remote add origin git@github.com:Naser507/ATS_10-webapp.git

# Fetch remote branch
git fetch origin

# Stage all changes
git add .

# Prompt for commit message
read -rp "Enter commit message: " commit_msg

# Commit changes
git commit -m "$commit_msg" 2>/dev/null || echo "No changes to commit"

# Push to GitHub
git push origin main --force

echo "✅ GitHub sync complete using SSH."