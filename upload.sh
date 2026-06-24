#!/bin/bash

# Check if inside a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not a git repository. Please run git init first."
    exit 1
fi

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)

# If branch is master, main, or merged, we should ask for their personal branch name
if [[ "$CURRENT_BRANCH" == "master" || "$CURRENT_BRANCH" == "main" || "$CURRENT_BRANCH" == "merged" || -z "$CURRENT_BRANCH" ]]; then
    read -p "Enter your personal branch name (e.g. Mvk): " branch_name
    if [ -z "$branch_name" ]; then
        echo "Branch name cannot be empty."
        exit 1
    fi
    # Try to checkout existing, otherwise create new
    git checkout "$branch_name" 2>/dev/null || git checkout -b "$branch_name"
    CURRENT_BRANCH=$(git branch --show-current)
fi

# Count number of .zip files
PACK_COUNT=$(ls -1 *.zip 2>/dev/null | wc -l)

# Git operations
echo "Staging files..."
git add .

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    echo "No changes to commit!"
    exit 0
fi

echo "Committing..."
git commit -m "Updated $PACK_COUNT packs"

echo "Pushing to branch: $CURRENT_BRANCH..."
git push origin "$CURRENT_BRANCH"

echo "Done! GitHub is now merging your new packs."
