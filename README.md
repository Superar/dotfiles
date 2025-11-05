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

## Things I use

- [Kitty](https://sw.kovidgoyal.net/kitty/) - Terminal
- [Starship](https://starship.rs/) - Shell Prompt
- [Gruvbox](https://github.com/morhetz/gruvbox) - Color Scheme
- [Neovim](https://neovim.io/) - Text Editor
