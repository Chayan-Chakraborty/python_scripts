import os

EXCLUDED_NAMES = {
    # Git
    ".git", ".gitignore", ".gitattributes", ".gitmodules", ".github",

    # Python dependencies / environments
    "venv", ".venv", "env", "__pycache__", ".pytest_cache",
    "site-packages", "pip-wheel-metadata",

    # Node dependencies
    "node_modules", "package-lock.json", "yarn.lock", "pnpm-lock.yaml",

    # Build / dist
    "build", "dist", ".mypy_cache", ".tox", ".idea", ".vscode",

    # OS junk
    ".DS_Store", "Thumbs.db"
}           

def print_tree(startpath, prefix=""):
    try:
        items = sorted(os.listdir(startpath))
    except PermissionError:
        return

    # Filter excluded items
    items = [item for item in items if item not in EXCLUDED_NAMES]

    for idx, item in enumerate(items):
        path = os.path.join(startpath, item)
        connector = "├── " if idx < len(items) - 1 else "└── "
        print(prefix + connector + item)

        if os.path.isdir(path):
            extension = "│   " if idx < len(items) - 1 else "    "
            print_tree(path, prefix + extension)

if __name__ == "__main__":
    print_tree("voice-text-search-platform-prod")
