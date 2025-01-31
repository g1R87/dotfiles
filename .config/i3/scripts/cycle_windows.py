#!/usr/bin/env python3

import i3ipc

# Create a connection to i3
i3 = i3ipc.Connection()

# Get the current workspace
workspace = i3.get_tree().find_focused().workspace()

# Get all windows in the current workspace
windows = [w for w in workspace.leaves()]

if len(windows) > 1:
    # Find the currently focused window
    focused = workspace.find_focused()

    # Get the index of the next window to focus
    next_index = (windows.index(focused) + 1) % len(windows)

    # Focus the next window
    i3.command(f"[con_id={windows[next_index].id}] focus")
