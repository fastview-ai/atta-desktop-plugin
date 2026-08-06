---
name: create-data-app
description: Create an interactive data app (a React app with a Python backend) on the Atta Desktop canvas. Use when the user wants interactivity — filters, inputs, controls, drill-downs — not just a static chart.
---

# Create a data app on the Atta canvas

Data apps are `data-app` blocks — an interactive React app in an iframe, backed by local Python.

**Before calling `create_data_app`, load the full data-app guide** via MCP **resources/read**:

```
atta://skill/desktop/create-data-app.md
```

Data apps are **not** like charts: there is no automatic `fn()` → `function(data)` pipe. `/App.jsx` must `fetch('/api/compute/v1/<func>')` for each named Python function in `/pythonCode.py`. The guide explains the full fetch contract, file scaffold, available imports, layouts, and a minimal working example — apps built without it usually render blank or fail on first interaction.

Contract (pass complete `sourceCode` so the block renders immediately):

- `/pythonCode.py` — named functions, e.g. `def get_prices(**kwargs):`, each returning JSON-serializable data.
- `/App.jsx` — root React component; `import React from 'react'`; `@/` absolute imports; fetches the compute endpoints.
- `/Loading.jsx` — skeleton shown while data loads.

Unlike charts, a data app's `size` is yours to set — match the layout (832 wide for a sidebar layout, otherwise ~724).

**To change an existing data app, edit its files with `bash` + `preview_block`** — see the `editing-blocks` skill. Don't call `create_data_app` again.
