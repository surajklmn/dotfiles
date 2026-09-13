# Dotfiles Installation & Setup Guide

Reference guide for restoring this rice on CachyOS / Arch Linux.

---

## 1. Install Required Packages

Run the following command to install the required compositor, shell, utilities, and fonts:

```bash
# Core window manager, shell, and session
sudo pacman -S --needed \
    hyprland \
    xdg-desktop-portal-hyprland \
    noctalia \
    uwsm \
    satty \
    hyprpicker \
    jq

# Terminal, file manager, and browser
sudo pacman -S --needed \
    alacritty \
    kitty \
    dolphin \
    firefox

# Fonts and cursor theme
sudo pacman -S --needed \
    ttf-cascadia-mono-nerd \
    ttf-space-mono-nerd \
    bibata-cursor-theme \
    papirus-icon-theme
```

---

## 2. Clone the Repository

Clone this repository to your preferred location (e.g. `~/dotfiles` or `~/Projects/dotfiles`):

```bash
git clone git@github.com:surajklmn/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

---

## 3. Link Configurations

Create symlinks from the repository into `~/.config/`:

```bash
mkdir -p ~/.config

# Symlink configs
ln -sf ~/dotfiles/hypr ~/.config/
ln -sf ~/dotfiles/noctalia ~/.config/
ln -sf ~/dotfiles/alacritty ~/.config/
ln -sf ~/dotfiles/satty ~/.config/
ln -sf ~/dotfiles/uwsm ~/.config/

# Ensure helper scripts have executable permissions
chmod +x ~/.config/hypr/scripts/*
```

> **Note**: If you already have existing configs in `~/.config/`, backup or remove them first before linking.

---

## 4. Hardware & Machine Adjustments

Depending on the machine (PC vs. Laptop):

1. **Monitors**:
   - Check your display name with `hyprctl monitors`.
   - Update monitor settings in [`~/.config/hypr/config/variables.lua`](file:///home/zef/.config/hypr/config/variables.lua) or [`~/.config/hypr/config/monitors.lua`](file:///home/zef/.config/hypr/config/monitors.lua).

2. **Default Terminal**:
   - Switch between `kitty` and `alacritty` by setting `TERMINAL = "alacritty"` or `TERMINAL = "kitty"` in [`~/.config/hypr/config/variables.lua`](file:///home/zef/.config/hypr/config/variables.lua).
   - If using Kitty on PC, link `kitty/` to `~/.config/kitty/`.

3. **NVIDIA GPUs** (if applicable):
   - In [`~/.config/uwsm/env`](file:///home/zef/.config/uwsm/env), uncomment the NVIDIA environment variables (`GBM_BACKEND=nvidia-drm`, `LIBVA_DRIVER_NAME=nvidia`, etc.).

---

## 5. Start Hyprland

Log in via your display manager or run:

```bash
uwsm start hyprland.desktop
```
*(or launch `Hyprland` directly)*
