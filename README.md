# My .dotfiles configuration

This repository contains my personal configuration files (dotfiles).

## How to use

1. Clone this repository to `~/.dotfiles`.
3. Install `stow`:

    ```bash
    sudo apt install stow
    ```

2. Run `stow` to create symlinks for all configuration files:

   ```bash
   cd ~/.dotfiles
   stow -v .
   ```

## Further setup

1. Install [rustup](https://rustup.rs/)
2. Install tree-sitter cli with:

```bash
cargo install --locked tree-sitter-cli
```
3. Install node and npm

```bash
sudo apt install nodejs npm
```
4. Install pip and pynvim

```bash
sudo apt install python3-pip python3-pynvim
```

If this does not work, fix the python3 version and install it directly with

```bash
python3 -m pip install pynvim --break-system-packages
```

## Things I use

- [Kitty](https://sw.kovidgoyal.net/kitty/) - Terminal
- [Starship](https://starship.rs/) - Shell Prompt
- [Gruvbox](https://github.com/morhetz/gruvbox) - Color Scheme
- [Neovim](https://neovim.io/) - Text Editor
- [Vim-plug](https://github.com/junegunn/vim-plug) - Neovim Plugin Manager

## Quick fixes

- To fix headset microphone not working, edit or create `/etc/modprobe.d/hda-model.conf`:

```
options snd-hda-intel model=dell-headset-multi
```
