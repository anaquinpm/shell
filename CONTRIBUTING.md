# Workspace Conventions

## 1. Naming
- Notes and folders: lowercase `snake_case`.
- Folder numbers: Double-digit prefix `NN_` for reading order.

## 2. Organization
- Keep `.md` files strictly conceptual.
- Save runnable scripts in the local `examples/` directory under each topic.
- Sandbox and practice projects go under `hands-on/`.

## 3. Metadata
Every `.md` note file must include a YAML frontmatter block at the top:

```yaml
---
title: Topic Title
tags: [tag1, tag2]
status: draft            # draft | in-progress | complete
source: Reference URL / Book name
last_updated: YYYY-MM-DD
---
```

## 4. Links
- Link to companion scripts: `[Run Code](examples/script.sh)`
- Link to another note: `[Setup Guide](../01_setup/environment.md)`

## 5. Managing Hands-On Projects
If you clone an external repository into `hands-on/`:
*   **Option A (Ignore):** Add `hands-on/repo-name/` to `.gitignore`.
*   **Option B (Submodule):**
    ```bash
    git submodule add <repo_url> hands-on/repo-name
    ```

## 6. Git Workflow
- Use `git mv` to move files to preserve history.
- Commit notes and scripts separately from structural changes.
- Keep commit messages descriptive and in Spanish or English consistently.
