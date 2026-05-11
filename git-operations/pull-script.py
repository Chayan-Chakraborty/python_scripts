import os
import subprocess

# Configuration
BASE_DIR = "/Users/chayanchakraborty/project"  # Root folder where all repos exist
TARGET_BRANCH = "dev-release"

REPOSITORIES = [
    "eclipse-datatypes", "eclipse-clients", "shield",
    "brahma","sanchar","vishanti", "zeus","cms"
]

def run_command(command, cwd):
    result = subprocess.run(command, cwd=cwd, shell=True, capture_output=True, text=True)
    return result.stdout, result.stderr

def pull_target_branch(repo_name):
    repo_path = os.path.join(BASE_DIR, repo_name)

    if not os.path.exists(repo_path):
        print(f"❌ Repo not found: {repo_name}")
        return

    print(f"\n🔄 Processing {repo_name}...")

    # Checkout target branch
    out, err = run_command(f"git checkout {TARGET_BRANCH}", repo_path)
    print(out if out else err)

    # Pull latest
    out, err = run_command("git pull origin " + TARGET_BRANCH, repo_path)
    print(out if out else err)

for repo in REPOSITORIES:
    pull_target_branch(repo)