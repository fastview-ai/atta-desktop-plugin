---
name: create-chart
description: Create a chart (ECharts visualization) on the Atta Desktop canvas. Use when the user asks for a chart, graph, plot, or any quantitative visualization of data.
---

# Create a chart on the Atta canvas

Charts are `atta-chart` blocks — an ECharts v5 visualization driven by local Python.

**Before calling `create_chart`, load the full chart-creation guide** via the MCP **resources/read** capability (not `read_file`, not `bash cat`):

```
atta://skill/desktop/create-chart.md
```

List available guides with MCP **resources/list**. That guide is Atta's complete data-viz reference — supported chart types, color palette, formatters, and optimizer rules. Charts built without it usually fail validation or render incorrectly.

Contract:

- `pythonCode` — Python defining `def fn():` that returns JSON-serializable data (dict/list). The local kernel runs `fn()` to produce the chart data. Include all imports; never hard-code values when real data is available.
- `javascriptCode` — `function(data) { return echartsOption; }` returning a complete ECharts v5 option object (must start with `function(data)`, not an arrow function).

Validation runs before the block is committed. On failure **no block is created** — fix the code and retry.

Every create response includes committed `left`, `top`, and `size` — use those to place the next block with a gutter. Add blocks **one at a time** (sequential calls), since chart size is decided by the optimizer.

**To change an existing chart, do not call `create_chart` again** (that adds a second chart). Edit its files with `bash` and apply with `preview_block` — see the `editing-blocks` skill.
