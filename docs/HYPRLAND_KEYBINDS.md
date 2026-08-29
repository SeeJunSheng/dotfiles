# Hyprland Keybindings

This document lists only the keybindings managed by the Hyprland configuration in this dotfiles repository.

It does **not** include application-specific shortcuts, Fcitx5 shortcuts, terminal shortcuts, Neovim shortcuts, or other program defaults.

The primary modifier is `Super`, as defined in `hypr/.config/hypr/config.lua`.

The Hyprland Lua configuration files remain the source of truth. Each `hl.bind()` should keep a useful `description` so the binding is documented next to its implementation.

## Applications

| Binding | Action |
| --- | --- |
| `Super + Return` | Open terminal |
| `Super + D` | Open application launcher |

## Workspaces

| Binding | Action |
| --- | --- |
| `Super + N` | Open next empty workspace on current monitor |
| `Super + Tab` | Focus next workspace on current monitor |

## Windows

| Binding | Action |
| --- | --- |
| `Super + Q` | Close active window |
| `Super + F` | Toggle fullscreen |
| `Super + M` | Toggle maximized |

## Utilities

| Binding | Action |
| --- | --- |
| `Super + V` | Open clipboard history |
| `Print` | Screenshot region to clipboard |

## Session

| Binding | Action |
| --- | --- |
| `Super + L` | Lock session |
| `Super + Shift + E` | Exit Hyprland |

## Configuration Files

The bindings above are currently defined across these Hyprland modules:

- `hypr/.config/hypr/terminal.lua`
- `hypr/.config/hypr/rofi.lua`
- `hypr/.config/hypr/workspace.lua`
- `hypr/.config/hypr/window.lua`
- `hypr/.config/hypr/clipboard.lua`
- `hypr/.config/hypr/screenshot.lua`
- `hypr/.config/hypr/lock.lua`

When adding or changing a Hyprland binding, update this document and keep the corresponding `description` in the Lua configuration accurate.
