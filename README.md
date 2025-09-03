# A guide to NVIM configuration

This repository mainly contains two branches:

- `main`: This branch contains the NVIM files for my MacBook AIR.
- `Lab-version`: This branch contains the NVIM files for my UBUNTU Lab computer, where we mainly keep the python, bash files.

Here is the guide to set up NVIM on your machine.

### Neovim Version

For `main` branch, the version information of NVIM is as follows:

```
NVIM v0.11.3
Build type: Release
LuaJIT 2.1.1753364724
Run "nvim -V1 -v" for more info
```

For `Lab-version` branch, the version information of NVIM is as follows:

```
NVIM v0.9.4
Build type: Release
LuaJIT 2.1.1692716794

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/__w/neovim/neovim/build/nvim.AppDir/usr/share/nvim"

Run :checkhealth for more info
```

For installation, you can refer to the official Neovim installation guide: [Neovim Installation](https://neovim.io), or use package managers like `brew` for Mac or `apt` for Ubuntu. If you don't have the sudo permission, you can also download from the github releases page: [Neovim Releases](https://github.com/neovim/neovim/releases).

There are some extra tools that you may need to install, but we will not cover them in this guide, which are easy to find on the internet.

### NVIM Configuration

You need to clone the repository under the `~/.config/nvim` directory. You can do this by running the following commands in your terminal:

```bash
git clone git@github.com:JingqiSunn/nvim.git
```

This will clone the repository into the `nvim` directory under `~/.config`. If you already have a `nvim` directory, you may want to back it up or remove it before cloning.

If you want to use the `Lab-version` branch, you can switch to that branch after cloning:

```bash
git fetch origin
```

```bash
git checkout Lab-version
```

```
git pull origin Lab-version
```

The automatic installation should be available when you open NVIM for the first time. If you encounter any issues, please raise them in the issues section of the repository.