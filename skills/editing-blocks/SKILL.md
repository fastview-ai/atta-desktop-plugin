---
name: editing-blocks
description: Edit or refine an existing block on the Atta Desktop canvas — charts, data apps, text, notes, and SVG. Use when the user asks to change, fix, or adjust something already on the canvas rather than create something new.
---

# Edit existing blocks on the Atta canvas

First resolve what the user means: call `get_selected_blocks` (a selected block is almost always the target) or `get_blocks` to find the block `id` and its `files`.

**Charts and data apps** — code lives on disk under `blocks/{id}/`:

1. Read/edit the files with `bash` (paths from `get_block`, e.g. `blocks/{id}/javascriptCode.js`, `blocks/{id}/pythonCode.py`, `blocks/{id}/App.jsx`).
2. Apply with `preview_block { id }` — this validates and hot-reloads in place (position and size preserved). On validation failure the canvas is unchanged.

Load `atta://skill/desktop/editing-blocks.md` via MCP **resources/read** for the full shell details.

**Text, notes, SVG** — edit in place with the dedicated tools, not `bash`:

- `edit_text_block { id, text }` — plain-text blocks.
- `edit_sticky_note { id, markdown?, backgroundColor?, foregroundColor?, size? }` — markdown notes.
- `edit_svg_block { id, svg?, size? }` — SVG diagrams.

## The `bash` tool is *just-bash*, not macOS Terminal

- **cwd = canvas bundle root** — you are already inside the active canvas bundle (`blocks/`, `workspace/`, `canvas.json`). Use bundle-relative paths (`blocks/{id}/…`); do not `cd` to an absolute path.
- **`sed -i` is GNU-style**: `sed -i 's/old/new/' file`. Do **not** use BSD/macOS `sed -i ''`.
- **Disabled**: `python`, `python3`, `curl`, `node` (use `run_python` / `preview_block` instead).
- Each `bash` call is a fresh shell; the filesystem persists between calls.

Don't recreate a block to change it — editing preserves its id, position, and version history.
