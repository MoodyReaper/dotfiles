## Intro

Welcome to my dotfiles!  
_Note: this repository contains only user files (system files are not presented)._

## Software

| Type                     | Name                                                                                      | Notes                                                  |
| :----------------------- | :---------------------------------------------------------------------------------------- | :----------------------------------------------------- |
| Linux Distribution       | [Arch Linux](https://archlinux.org)                                                       | My favorite distro ever!                               |
| System / Service Manager | [systemd](https://systemd.io)                                                             | Yes. Sorry.                                            |
| Login Manager            | [Ly](https://github.com/fairyglade/ly)                                                    | -                                                      |
| Audio Server             | [Pipewire](https://pipewire.org)                                                          | No to PulseAudio, yes to old new bugs. Psh-psh (:      |
| Display Server           | [Wayland](https://wayland.freedesktop.org)                                                | -                                                      |
| Window Manager           | [Sway](https://swaywm.org)                                                                | -                                                      |
| App Launcher             | [sway-launcher-desktop](https://github.com/Biont/sway-launcher-desktop)                   | -                                                      |
| Taskbar / Statusbar      | [Waybar](https://github.com/Alexays/Waybar)                                               | -                                                      |
| Notification Manager     | [Dunst](https://dunst-project.org)                                                        | -                                                      |
| Screen Lock              | [swaylock-effects](https://github.com/jirutka/swaylock-effects)                           | Fork of [swaylock](https://github.com/swaywm/swaylock) |
| Shell                    | [Fish](https://fishshell.com)                                                             | -                                                      |
| Shell Prompt             | [Starship](https://starship.rs)                                                           | -                                                      |
| Terminal                 | [Alacritty](https://alacritty.org)                                                        | -                                                      |
| GUI File Manager         | [Thunar](https://docs.xfce.org/xfce/thunar)                                               | -                                                      |
| TUI File Manager         | [nnn](https://github.com/jarun/nnn)                                                       | -                                                      |
| GUI Text Editor          | [VS Code OSS](https://github.com/microsoft/vscode)                                        | -                                                      |
| TUI Text Editor          | [neovim](https://neovim.io) + [neovide](https://neovide.dev)                              | -                                                      |
| Config Manager           | [Dotbot](https://github.com/anishathalye/dotbot)                                          | -                                                      |
| Theme Manager            | [Flavours](https://github.com/Misterio77/flavours)                                        | -                                                      |
| Color Schemes            | [Base16](https://github.com/chriskempson/base16)                                          | -                                                      |
| Fonts / glyphs           | [Fira Code](https://github.com/tonsky/FiraCode) + [Nerd Fonts](https://www.nerdfonts.com) | -                                                      |
| Icons                    | [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)                   | SVG icon theme                                         |
| VCS                      | [Git](https://git-scm.com) + [lazygit](https://github.com/jesseduffield/lazygit)          | -                                                      |

### Additional software (dependencies)

| Configured in | Package                                                       | Description                            |
| :------------ | :------------------------------------------------------------ | :------------------------------------- |
| `Fish`        | [pyenv](https://github.com/pyenv/pyenv)                       | Python version management              |
| `Fish`        | [Gnome Keyring](https://wiki.gnome.org/Projects/GnomeKeyring) | Security storage                       |
| `Flavours`    | [fzf](https://github.com/junegunn/fzf)                        | Fuzzy search                           |
| `Sway`        | [wl-clipboard](https://github.com/bugaevc/wl-clipboard)       | Clipboard                              |
| `Sway`        | [slurp](https://github.com/emersion/slurp)                    | Screen capture - region selector       |
| `Sway`        | [wf-recorder](https://github.com/ammen99/wf-recorder)         | Screen recording                       |
| `Sway`        | [grim](https://github.com/emersion/grim)                      | Screenshots - image grabber            |
| `Sway`        | [Swappy](https://github.com/jtheoof/swappy)                   | Screenshots - snapshot and editor tool |

- _Check `fish` config and `sway` autostart config_
- _Please, notify me if I forgot something important_

## Hardware

| Device     | Name                             | Notes for config users                                                              |
| :--------- | :------------------------------- | :---------------------------------------------------------------------------------- |
| CPU        | `AMD Ryzen 7 5800X`              | Check CPU related stuff in `waybar`                                                 |
| GPU        | `AMD Radeon RX 6900 XT (AsRock)` | Check GPU related stuff in `waybar`. Check settings in `hardware_acceleration.fish` |
| Monitor    | `Mi Curved Gaming Monitor 34`    | Configs (ex. Waybar) are optimized for 3440x1440 resolution (UW-QHD)                |
| Sound card | `Solid State Logic SSL 2+`       | Worked out of the box, other devices might require special configuration            |
| Keyboard   | `Keychron K8`                    | MacOS mode is used. Some keybindings might not work due to different keyboard       |

![neofetch](https://user-images.githubusercontent.com/16370497/188314845-544f3077-984f-4455-936c-c474eaacd11f.png)

## P.S.

If you found it useful, please, let me know!  
I'd be very grateful for any improvements or suggestions (:  
Contacts: [moodyreaper.space](https://moodyreaper.space)
