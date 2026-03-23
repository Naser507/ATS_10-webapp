#!/bin/bash
# github_sync.sh
# Reconnects local ATS_10_webapp folder to GitHub and pushes current state

# Move to project root
cd ~/projects_series/ATS_10_webapp || exit

# Initialize git if not already
if [ ! -d ".git" ]; then
    git init
fi

# Remove existing origin (in case it exists)
git remote remove origin 2>/dev/null

# Add your GitHub repository
git remote add origin https://github.com/Naser507/ATS_10-webapp.git

# Fetch remote to avoid surprises
git fetch origin

# Stage all current files (empty structure)
git add .

# Commit changes
git commit -m "Reset local project structure"

# Force push to overwrite GitHub with current state
git push origin main --force

echo "✅ GitHub sync complete. Repo now reflects local clean structure."
