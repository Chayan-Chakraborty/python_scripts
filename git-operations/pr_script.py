import requests

# Configuration
GITHUB_API_URL = "https://api.github.com"
REPO_OWNER = "eclipse-tech"          # Replace with your GitHub username
SOURCE_BRANCH = "stage-release"      # Source branch to create PR from
TARGET_BRANCH = "production-release"                # Target branch to merge into
PR_TITLE = f"{SOURCE_BRANCH} to {TARGET_BRANCH} Merge"          # PR title
PR_BODY = f"This for {SOURCE_BRANCH} to {TARGET_BRANCH} merge."  # PR description
import os
GITHUB_TOKEN = os.environ.get("GITHUB_TOKEN", "")  # Set via environment variable
if not GITHUB_TOKEN:
    raise SystemExit("GITHUB_TOKEN environment variable is required")

# List of repositories (format: "repo-name")
REPOSITORIES = [ "eclipse-datatypes", "eclipse-clients", "shield", "magneto", "brahma", "mudra", "indra", "sanchar", "accounting", "suchi", "kuber","vishanti", "zeus", "garuda", "cms"]  # Add your repositories here

# Headers for GitHub API
headers = {
    "Authorization": f"token {GITHUB_TOKEN}",
    "Accept": "application/vnd.github.v3+json"
}

# Function to check and create PR
def check_and_create_pr(repo_name):
    search_url = f"{GITHUB_API_URL}/repos/{REPO_OWNER}/{repo_name}/pulls"
    params = {
        "head": f"{REPO_OWNER}:{SOURCE_BRANCH}",
        "base": TARGET_BRANCH,
        "state": "open"  # Only check open PRs
    }

    response = requests.get(search_url, headers=headers, params=params)

    if response.status_code == 200:
        existing_prs = response.json()
        if existing_prs:
            pr = existing_prs[0]
            print(f"✅ Existing PR found in '{repo_name}': {pr['html_url']}")
        else:
            payload = {
                "title": PR_TITLE,
                "head": SOURCE_BRANCH,
                "base": TARGET_BRANCH,
                "body": PR_BODY
            }
            create_response = requests.post(search_url, headers=headers, json=payload)
            if create_response.status_code == 201:
                pr = create_response.json()
                print(f"🚀 PR created in '{repo_name}': {pr['html_url']}")

    else:
        print(f"⚠️ Failed to check PRs in '{repo_name}': {response.status_code}")
        print(response.json())

# Loop through each repository
for repo in REPOSITORIES:
    check_and_create_pr(repo)
