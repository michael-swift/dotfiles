# macOS Rice Dotfiles

Minimal, keyboard-driven macOS setup inspired by Arch Linux i3wm environments.

![Screenshot](screenshot.png)

## Features

- **Aerospace** - i3-like tiling window manager
- **SketchyBar** - Minimal custom menu bar
- **Raycast** - Keyboard-driven app launcher
- **Gruvbox** color scheme throughout

## Quick Start

### 1. Install Dependencies

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install all components
brew install --cask nikitabobko/tap/aerospace
brew tap FelixKratz/formulae && brew install sketchybar
brew install --cask raycast
```

### 2. Install Dotfiles

```bash
# Clone this repo
git clone https://github.com/michael-swift/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run install script
./install.sh
```

### 3. Post-Install Setup

**Hide macOS Menu Bar:**
- System Settings → Control Center (or Desktop & Dock)
- Set "Automatically hide and show the menu bar" to **Always**

**Configure Raycast:**
- Open Raycast
- Grant accessibility permissions when prompted
- Set hotkey (recommended: Cmd+Space or Option+Space)

**Start Services:**
```bash
brew services start sketchybar
open -a AeroSpace
open -a Raycast
```

## Keybindings

### Window Management
- `Cmd+H/J/K/L` - Focus window (left/down/up/right)
- `Cmd+Shift+J/K/L/;` - Move window
- `Cmd+Shift+Q` - Close window
- `Cmd+Q` - Quit application

### Workspaces
- `Cmd+1-9` - Switch to workspace
- `Cmd+Shift+1-9` - Move window to workspace

### Layouts
- `Cmd+Shift+H` - Join with left window
- `Cmd+Shift+V` - Join with window below
- `Cmd+E` - Toggle split orientation
- `Cmd+S` - Stacking layout
- `Cmd+W` - Tabbed layout
- `Cmd+F` - Toggle fullscreen
- `Cmd+Shift+Space` - Toggle floating

### Other
- `Cmd+Enter` - Open new terminal
- `Cmd+R` - Enter resize mode (H/J/K/L to resize, Esc to exit)
- `Cmd+Shift+C` - Reload Aerospace config

## File Structure

```
dotfiles/
├── aerospace/
│   └── aerospace.toml       # Aerospace window manager config
├── sketchybar/
│   ├── sketchybarrc         # SketchyBar main config
│   └── plugins/             # SketchyBar plugin scripts
├── install.sh               # Installation script
└── README.md
```

## Customization

### Change Colors

Edit `sketchybar/sketchybarrc` to change color scheme:

```bash
# Colors (Gruvbox Dark)
BAR_COLOR=0xff282828
ITEM_BG_COLOR=0xff3c3836
ACCENT_COLOR=0xfffabd2f
TEXT_COLOR=0xffebdbb2
ICON_COLOR=0xfffbf1c7
```

### Add Window Gaps

Edit `aerospace/aerospace.toml`:

```toml
[gaps]
inner.horizontal = 8
inner.vertical = 8
outer.left = 8
outer.right = 8
outer.top = 8
outer.bottom = 8
```

### Modify Keybindings

Edit `aerospace/aerospace.toml` under `[mode.main.binding]` section.

## Uninstall

```bash
# Remove symlinks
rm ~/.config/aerospace/aerospace.toml
rm ~/.config/sketchybar/sketchybarrc
rm -rf ~/.config/sketchybar/plugins

# Stop services
brew services stop sketchybar

# Uninstall packages (optional)
brew uninstall --cask aerospace raycast
brew uninstall sketchybar
```

## Resources

- [Aerospace Documentation](https://nikitabobko.github.io/AeroSpace/guide)
- [SketchyBar Documentation](https://felixkratz.github.io/SketchyBar/)
- [Raycast](https://www.raycast.com/)

## Credits

- Config based on [Aerospace i3-like example](https://nikitabobko.github.io/AeroSpace/goodies#i3-like-config)
- Color scheme: [Gruvbox](https://github.com/morhetz/gruvbox)
