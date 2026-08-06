---
name: ensure-desktop-running
description: Read before using any Atta Desktop MCP tool. Ensures the Atta Desktop app is running with a canvas open so the local MCP server is reachable, and explains what to do when a tool call cannot connect.
---

# Ensure Atta Desktop is running

The Atta Desktop MCP server is **embedded in the Atta Desktop app** and served over the loopback interface. It only exists while the app is open — there is no separate process to launch and **no headless / file mode**.

Before calling any `atta-desktop` tool:

1. Make sure the **Atta Desktop app is running** with at least one canvas open. Opening a canvas starts the MCP server in the background.
2. The server listens on `http://127.0.0.1:17340/mcp` by default. If several Atta instances are open, the port may shift within `17340`–`17349`; the exact URL is shown in **Settings → Connect AI agent (MCP)**.

If a tool call fails to connect:

- Ask the user to **open Atta Desktop** ([download](https://atta.app)) and open or create a canvas, then retry.
- If it is already open, have them confirm the URL in **Settings → Connect AI agent (MCP)** matches the configured server URL, then restart the agent session so it re-establishes the connection.

Tools act on the **active canvas**. When several canvas windows are open, call `list_open_canvases` and pass the returned `tabId` to target a specific one. Use `create_canvas` to open a fresh workspace when none is open.
