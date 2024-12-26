#!/bin/bash
##################################################################
# Author      : Sachin Das
# Date 	      : 26-12-2024	
# Version     : v1
# Description : To contact git via API and get the users who have access to the repo 
##################################################################

#set -x
set -e
set -o pipefail

function helper() {
    expected_args=2
    if [[ $# -ne $expected_args ]]; then
        echo "Please Enter the required arguments"
        return 1
    fi
}

helper "$@"
if [[ $? -ne 0 ]]; then
    exit 1  # Exit if the number of arguments is incorrect
fi

# GitHub API URL
API_URL="https://api.github.com/"

# GitHub Username & token
USER_NAME="$username"
TOKEN="$token"

# Organization & Repo Details
REPO_OWNER="$1"
REPO_NAME="$2"

# Function to make a GET request to GitHub API
function list_users_with_read_access() {
    Endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
    URL="${API_URL}${Endpoint}"
    collaborator=$(curl -s -u "${USER_NAME}:${TOKEN}" "${URL}" | jq -r '.[] | select(.permissions.pull==true) | .login')
    
    if [[ -z "$collaborator" ]]; then
        echo "No user found with read access"
    else 
        echo "Users with read access are:"
        echo "${collaborator}"
    fi
}

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access


