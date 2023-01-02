## Introduction

Welcome to my dotfiles!  
_Note: this repository contains user files only (system files are not presented)_

![desktop-example-0](https://user-images.githubusercontent.com/16370497/188315613-907149c8-1397-4a80-880f-8ae73754b091.png)

## Installation

1. Clone repository, rename if you want to, `cd` into cloned repository:
   - _I use `.dotfiles` inside of `~/`_
2. Manage wallpapers:
   - Create `wallpapers/` directory and copy wallpapers into it
     - _Filenames are hardcoded: `FHD.png` and `UW-QHD.png` are set in `Dotbot` (`install.conf.yaml`) and `Sway` (`output`), change configs if needed_
3. Manage `git` settings:
   - Create `git/gitconfig-personal` file, move personal global git settings inside it (for example, username and email)
     - _Check `git/gitconfig` as well_
4. Manage `Sway` output settings (monitor, resolution, etc.):
   - _Edit `sway/config.d/output` if needed_
5. Manage shell settings:
   - _I use `Fish` shell so everything is configured for it (`fish` is the default shell for my user)_
     - _Check `fish_variables`, remove hardcoded user_
6. Check `fish` and `sway` autostart configs
7. Install dependencies (read sections below)
8. Run `dotbot` script: `./install`
   - _Read console output, some configs may not be applied_
   - _By default, `GTK` theme `FlatColor` does not have color scheme defined so it's important to apply a theme (next step)_
9. Apply any desired theme using `Flavours` base16 theme manager:
   - _For example, `flavours apply tender`_
10. Relogin

## Software

| Type                     | Name                                                                                  | Notes                                               |
| :----------------------- | :------------------------------------------------------------------------------------ | :-------------------------------------------------- |
| Linux Distribution       | [Arch Linux](https://archlinux.org)                                                   | My favorite distro ever!                            |
| System / Service Manager | [systemd](https://systemd.io)                                                         | Yes. Sorry.                                         |
| Login Manager            | [Ly](https://github.com/fairyglade/ly)                                                | -                                                   |
| Audio Server             | [Pipewire](https://pipewire.org)                                                      | No to PulseAudio, yes to old new bugs. Psh-psh (:   |
| Display Server           | [Wayland](https://wayland.freedesktop.org)                                            | -                                                   |
| Window Manager           | [Sway](https://swaywm.org)                                                            | -                                                   |
| App Launcher             | [sway-launcher-desktop](https://github.com/Biont/sway-launcher-desktop)               | -                                                   |
| Taskbar / Statusbar      | [Waybar](https://github.com/Alexays/Waybar)                                           | -                                                   |
| Notification Manager     | [Dunst](https://dunst-project.org)                                                    | -                                                   |
| Screen Lock              | [swaylock-effects](https://github.com/jirutka/swaylock-effects)                       | [swaylock](https://github.com/swaywm/swaylock) fork |
| Shell                    | [Fish](https://fishshell.com)                                                         | -                                                   |
| Shell Prompt             | [Starship](https://starship.rs)                                                       | -                                                   |
| Terminal                 | [Alacritty](https://alacritty.org)                                                    | -                                                   |
| GUI File Manager         | [Thunar](https://docs.xfce.org/xfce/thunar)                                           | -                                                   |
| TUI File Manager         | [nnn](https://github.com/jarun/nnn)                                                   | -                                                   |
| GUI Text Editor          | [VS Code OSS](https://github.com/microsoft/vscode)                                    | -                                                   |
| TUI Text Editor          | [neovim](https://neovim.io) + [neovide](https://neovide.dev)                          | -                                                   |
| Config Manager           | [Dotbot](https://github.com/anishathalye/dotbot)                                      | -                                                   |
| Theme Manager            | [Flavours](https://github.com/Misterio77/flavours)                                    | -                                                   |
| Color Schemes            | [Base16](https://github.com/chriskempson/base16)                                      | -                                                   |
| Fonts / Glyphs           | [Fira Code](https://github.com/tonsky/FiraCode) + [Nerd Fonts](https://nerdfonts.com) | -                                                   |
| Icons                    | [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)               | -                                                   |
| VCS                      | [Git](https://git-scm.com) + [lazygit](https://github.com/jesseduffield/lazygit)      | -                                                   |

### Additional software (dependencies)

| Configured in | Name                                                          | Notes                                  |
| :------------ | :------------------------------------------------------------ | :------------------------------------- |
| `bin/`        | [fzf](https://github.com/junegunn/fzf)                        | Fuzzy search                           |
| `Fish`        | [Gnome Keyring](https://wiki.gnome.org/Projects/GnomeKeyring) | Secrets storage                        |
| `Fish`        | [pyenv](https://github.com/pyenv/pyenv)                       | Python version management              |
| `Sway`        | [grim](https://github.com/emersion/grim)                      | Screenshots - image grabber            |
| `Sway`        | [slurp](https://github.com/emersion/slurp)                    | Screen capture - region selector       |
| `Sway`        | [Swappy](https://github.com/jtheoof/swappy)                   | Screenshots - snapshot and editor tool |
| `Sway`        | [wf-recorder](https://github.com/ammen99/wf-recorder)         | Screen recording                       |
| `Sway`        | [wl-clipboard](https://github.com/bugaevc/wl-clipboard)       | Clipboard                              |

- _Please, notify me if I forgot something important_

## Hardware

| Type       | Name                             | Notes                                                                               |
| :--------- | :------------------------------- | :---------------------------------------------------------------------------------- |
| CPU        | `AMD Ryzen 7 5800X`              | Check CPU related stuff in `waybar`                                                 |
| GPU        | `AMD Radeon RX 6900 XT (AsRock)` | Check GPU related stuff in `waybar`. Check settings in `hardware_acceleration.fish` |
| Monitor    | `Mi Curved Gaming Monitor 34`    | Configs (eg. `waybar`) are optimized for 3440x1440 resolution (UW-QHD)              |
| Sound card | `Solid State Logic SSL 2+`       | Worked out of the box, other devices might require special configuration            |
| Keyboard   | `Keychron K8`                    | Windows mode is used. Some keybindings might not work due to a different keyboard   |

![neofetch](https://user-images.githubusercontent.com/16370497/188314845-544f3077-984f-4455-936c-c474eaacd11f.png)

## P.S.

If you found it useful, please, let me know!  
I'd be very grateful for any improvements or suggestions (:  
Contacts: [moodyreaper.space](https://moodyreaper.space)
