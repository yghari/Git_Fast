#!/bin/bash

# This script helps to add, commit, push, pull, and merge changes in a git repository

# Navigate to your Git repository folder
cd /path/to/your/git/repository

echo "Choose an action to perform:"
echo "1. Add changes"
echo "2. Commit changes"
echo "3. Push changes"
echo "4. Pull changes"
echo "5. Merge changes"
read -p "Enter the number of the action to perform: " choice

case $choice in
  1) # Add all changes to the staging area
     git add .
     ;;
  2) # Commit the changes with a message
     read -p "Enter commit message: " commit_message
     git commit -m "$commit_message"
     ;;
  3) # Push the changes to the remote repository
     git push origin main
     ;;
  4) # Pull the changes from the remote repository
     git pull origin main
     ;;
  5) # Merge changes from a specific branch to the current branch
     read -p "Enter branch name to merge: " branch_name
     git merge $branch_name
     ;;
  *) # Invalid choice
     echo "Invalid choice. Please choose a number between 1 and 5."
     exit 1
     ;;
esac
