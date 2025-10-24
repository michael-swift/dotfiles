#!/bin/bash

# Installation script for macOS rice dotfiles

set -e

echo "🚀 Installing macOS rice dotfiles..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${BLUE}Dotfiles directory: $DOTFILES_DIR${NC}"

# Create config directories if they don't exist
echo -e "${BLUE}Creating config directories...${NC}"
mkdir -p ~/.config/aerospace
mkdir -p ~/.config/sketchybar

# Backup existing configs
if [ -f ~/.config/aerospace/aerospace.toml ]; then
    echo -e "${BLUE}Backing up existing Aerospace config...${NC}"
    mv ~/.config/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml.backup
fi

if [ -f ~/.config/sketchybar/sketchybarrc ]; then
    echo -e "${BLUE}Backing up existing SketchyBar config...${NC}"
    mv ~/.config/sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc.backup
fi

if [ -d ~/.config/sketchybar/plugins ]; then
    echo -e "${BLUE}Backing up existing SketchyBar plugins...${NC}"
    mv ~/.config/sketchybar/plugins ~/.config/sketchybar/plugins.backup
fi

# Symlink Aerospace config
echo -e "${BLUE}Symlinking Aerospace config...${NC}"
ln -sf "$DOTFILES_DIR/aerospace/aerospace.toml" ~/.config/aerospace/aerospace.toml

# Symlink SketchyBar config
echo -e "${BLUE}Symlinking SketchyBar config...${NC}"
ln -sf "$DOTFILES_DIR/sketchybar/sketchybarrc" ~/.config/sketchybar/sketchybarrc
ln -sf "$DOTFILES_DIR/sketchybar/plugins" ~/.config/sketchybar/plugins

# Make plugins executable
echo -e "${BLUE}Making SketchyBar plugins executable...${NC}"
chmod +x "$DOTFILES_DIR/sketchybar/plugins/"*

echo -e "${GREEN}✅ Dotfiles installed successfully!${NC}"
echo ""
echo "Next steps:"
echo "1. Hide the macOS menu bar (System Settings → Control Center)"
echo "2. Configure Raycast hotkey"
echo "3. Start services:"
echo "   brew services start sketchybar"
echo "   open -a AeroSpace"
echo "   open -a Raycast"
echo ""
echo "Reload configs:"
echo "   aerospace reload-config"
echo "   brew services restart sketchybar"
