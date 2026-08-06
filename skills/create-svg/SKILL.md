---
name: create-svg
description: Add an SVG diagram to the Atta Desktop canvas — frames, arrows, flowcharts, metric trees, and other drawn structure. Use whenever the canvas needs spatial or relational structure rather than prose.
---

# Add an SVG diagram to the Atta canvas

SVG blocks are transparent overlays for **drawn structure**, not text. Reach for `create_svg_block` (and suggest it when it would help) for:

- **Frames** — rounded rects / bands that visually group related charts or notes.
- **Metric trees / KPI breakdowns** — a parent metric branching into children with connectors (e.g. Revenue → volume × price).
- **Flowcharts & process maps** — boxes and arrows for pipelines, funnels, decision paths.
- **Arrows & connectors** — linking blocks ("this drives that"), or callouts pointing at a region.
- **Simple diagram shapes** — hierarchies, timelines, Venn-style overlays, small icons beside a finding.

Prefer SVG over sticky notes when the idea is spatial or relational; stickies are for short written takeaways.

Contract:

- `svg` — complete SVG markup including the root `<svg>` element (prefer a `viewBox`). Use light strokes/fills that read on the canvas.
- `size` — `{ width, height }` in board px (default 600×400); match the diagram.

Prefer one composed SVG per diagram; use separate blocks when pieces should move independently. Layer SVG with charts and text so frames sit behind groups and arrows land cleanly between blocks.

**To change an existing SVG block, use `edit_svg_block`** (don't recreate it).
