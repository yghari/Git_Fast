#!/bin/bash

# Git Automation Script

#-Clone a repository
function clone_repository() {
  echo "Enter the URL of the Git repository you want to clone:"
  read repo_url
  git clone $repo_url
  echo "Repository cloned successfully."
}

# Add files to Git
function add_files() {
  echo "Enter the path of the file(s) you want to add to Git (e.g. /path/to/file or /path/to/folder):"
  read path
  git add $path
  echo "File(s) added to Git."
}

# Create a branch
function create_branch() {
  echo "Enter the name of the new branch:"
  read branch_name
  git branch $branch_name
  echo "New branch $branch_name created."
}

#- Create a new branch and switch to it
function create_new_branch() {
  echo "Enter the new branch name:"
  read new_branch_name
  git checkout -b $new_branch_name
  echo "New branch $new_branch_name created and switched to successfully."
}

#- View the status of the current branch
function show_branch_status() {
  git status
}

#- View the commit history of the current branch
function view_commit_history() {
  git log --oneline --decorate --graph --all
}

#- Delete a specific branch in the repository
function delete_branch() {
  echo "Enter the branch name:"
  read branch_name
  git branch -d $branch_name
  echo "Branch $branch_name deleted successfully."
}

#- List all branches in the repository
function list_branches() {
  git branch
}

#-Push changes to the remote repository
function push_changes() {
  echo "Enter the name of the remote repository:"
  read remote_name
  git push $remote_name $(git branch --show-current)
  echo "Changes pushed to the remote repository."
}

#-Pull changes from the current branch
function pull_changes() {
  git pull origin $(git branch --show-current)
  echo "Changes pulled from the remote repository."
}



#- Revert a specific commit in the current branch
function revert_commit() {
  echo "Enter the commit hash:"
  read commit_hash
  git revert $commit_hash
  echo "Commit $commit_hash reverted successfully."
}

# Switch to a branch
function switch_branch() {
  echo "Enter the name of the branch you want to switch to:"
  read branch_name
  git checkout $branch_name
  echo "Switched to branch $branch_name."
}

#- List all remote repositories in the repository
function list_remote_repositories() {
  git remote -v
}

#- View the changes between two commits
function show_commit_changes() {
  echo "Enter the first commit hash:"
  read commit1
  echo "Enter the second commit hash:"
  read commit2
  git diff $commit1 $commit2
}


# Merge branches
function merge_branches() {
  echo "Enter the name of the branch you want to merge into:"
  read target_branch
  echo "Enter the name of the branch you want to merge:"
  read source_branch
  git merge $source_branch $target_branch
  echo "Branch $source_branch merged into $target_branch."
}

# Commit changes
function commit_changes() {
  echo "Enter a commit message:"
  read commit_message
  git commit -m "$commit_message"
  echo "Changes committed to Git."
}

# Generate a report of all branches and their last commit message
function generate_report() {
  git branch -v | awk '{ print $1,$2 }' | while read branch ref
  do
    echo "$branch: $(git log -1 --pretty=%B $ref)"
  done
}

# Main menu
while true; do
  echo "Git Automation Script"
  echo "1. Add files to Git"
  echo "2. Create a branch"
  echo "3. Switch to a branch"
  echo "4. Merge branches"
  echo "5. Commit changes"
  echo "6. Generate report"
  echo "7. Clone a Repository"
  echo "8. Create a new branch and switch to it"
  echo "9. View the status of the current branch"
  echo "10. View the commit history of the current branch"
  echo "11. Delete a specific branch in the repository"
  echo "12. List all branches in the repository"
  echo "13. Push changes to the remote repository"
  echo "14. Pull changes from the current branch"
  echo "15. Revert a specific commit in the current branch"
  echo "16. List all remote repositories in the repository"
  echo "17. View the changes between two commits"
  echo "18. Exit"
  read -p "Enter your choice (1-19): " choice

  case $choice in
    1)
      add_files
      ;;
    2)
      create_branch
      ;;
    3)
      switch_branch
      ;;
    4)
      merge_branches
      ;;
    5)
      commit_changes
      ;;
    6)
      generate_report
      ;;
    7)
      clone_repository	    
      ;;
    8)
      create_new_branch
      ;;
    9)
      show_branch_status
      ;;
    10)
      view_commit_history
      ;;
    11)
      delete_branch
      ;;
    12)
      list_branches
      ;;
    13)
      push_changes
      ;;
    14)
      pull_changes
      ;;
    15)
      revert_commit
      ;;
    16)
      list_remote_repositories
      ;;
    17)
      show_commit_changes
      ;;
    18)
      exit 0
      ;;
    *)
      echo "Invalid choice. Please enter a number between 1 and 19."
      ;;
  esac
done

