# My .dotfiles configuration

This repository contains my personal configuration files (dotfiles).

## How to use

1. Clone this repository to `~/.dotfiles`.
2. Install `stow`:

    ```bash
    sudo apt install stow
    ```

3. Run `stow` to create symlinks for all configuration files:

   ```bash
   cd ~/.dotfiles
   stow -v .
   ```

## Package managers

```bash
# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.41.0/install.sh | bash
nvm install --lts
```

## Terminal tools

```bash
sudo apt install libclang-dev
cargo install --locked zoxide tree-sitter-cli typst-cli
brew install fzf
curl -sS https://starship.rs/install.sh | sh
```

## Apps in `/opt`

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

- [Zotero](https://www.zotero.org/download/): extract the tarball to `/opt/zotero`

```bash
sudo tar -xf Zotero-*.tar.* -C /opt
sudo mv /opt/Zotero_linux-x86_64 /opt/zotero
sudo chown -R $USER /opt/zotero
cd /opt/zotero
./set_launcher_icon
ln -sf /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
```

## Kitty and font

```bash
# Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/local/bin/
cp ~/.local/kitty.app/share/applications/kitty*.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop

# CaskaydiaCove Nerd Font
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip
unzip CascadiaCode.zip -d ~/.local/share/fonts/CaskaydiaCove
fc-cache -f
```

Remember to set Kitty as the default terminal in PopOS!'s configurations.

## LaTeX

```bash
sudo apt install texlive-base texlive-bibtex-extra texlive-fonts-extra \
texlive-latex-recommended texlive-publishers texlive-science \
texlive-xetex biber zathura xdotool
```


## Shell

Add to the end of `~/.bashrc`:

```bash
[ -f ~/.bash_extras ] && . ~/.bash_extras
```

## Things I use

- [Kitty](https://sw.kovidgoyal.net/kitty/) - Terminal
- [Starship](https://starship.rs/) - Shell Prompt
- [Gruvbox](https://github.com/morhetz/gruvbox) - Color Scheme
- [Neovim](https://neovim.io/) - Text Editor
- [lazy.nvim](https://lazy.folke.io/) - lazy.nvim Plugin Manager
- [Zoxide](https://github.com/ajeetdsouza/zoxide) - Better `cd` command
- [fzf](https://github.com/junegunn/fzf) - CLI fuzzy finder

## Quick fixes

- To fix headset microphone not working, edit or create `/etc/modprobe.d/hda-model.conf`:

```
options snd-hda-intel model=dell-headset-multi
```

- To use neovim as the git editor:

```bash
git config --global core.editor "nvim"
```
