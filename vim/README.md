# Neovim Lua配置

## 目录
* [插件](#插件)
* [目录结构](#目录结构)
* [配置文件](#配置文件)
* [快捷键](#快捷键)
* [安装](#安装)
* [LSP配置](#LSP配置)
* [配色方案](#配色方案)
* [外观配置](#外观配置)

## 插件

[packer.nvim](https://github.com/wbthomason/packer.nvim) -  Neovim的包管理器

[feline.nvim](https://github.com/Famiu/feline.nvim) - A minimal, stylish and customizable statusline for Neovim written in Lua

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of common configurations for Neovim's built-in language server client

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Auto completion plugin

[LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua

[nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - A File Explorer written In Lua

[indentBlankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Adds indentation guides to all lines (including empty lines)

[nvim-autopairs](https://github.com/windwp/nvim-autopairs) - A super powerful autopairs for Neovim

[Tagbar](https://github.com/preservim/tagbar) - A class outline viewer for Vim

[gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Super fast git decorations implemented purely in lua/teal

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

[alpha-nvim](https://github.com/goolord/alpha-nvim) - A fast and highly customizable greeter for neovim.

[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - A Lua fork of vim-devicons

[vim-surround](https://github.com/tpope/vim-surround) 添加vim本身缺失的motion（ds、cs、ys），用于处理成对的符号（引号、标签等）  

[vim-repeat](https://github.com/tpope/vim-repeat) 使得 surround插件提供的motion拥有.操作重复的功能

[trouble](https://github.com/folke/trouble.nvim) 用来辅助显示和定位LSP的问题，参考等
## 目录结构

`${HOME}/.config/nvim`

```
.
├── ginit.vim
├── init.lua
├── lua
│   ├── filetype.lua
│   ├── global.lua
│   ├── keymaps.lua
│   ├── options.lua
│   ├── pack.lua
│   ├── plugins
│   │   ├── autopair.lua
│   │   ├── blankline.lua
│   │   ├── bufferline.lua
│   │   ├── compe.lua
│   │   ├── dashboard.lua
│   │   ├── icons.lua
│   │   ├── lspconfig.lua
│   │   ├── lspkind.lua
│   │   ├── lspsaga.lua
│   │   ├── lualine.lua
│   │   ├── neoformat.lua
│   │   ├── nvim-cmp.lua
│   │   ├── nvimtree.lua
│   │   ├── qf_helper.lua
│   │   ├── telescope.lua
│   │   ├── theme.lua
│   │   ├── treesitter.lua
│   │   └── trouble.lua
│   └── plugins.lua
```
## 快捷键
<details>
 <summary markdown="span">LSP相关</summary>
 
 | 快捷键       | 描述        |
 | ----------- | ----------- |
 | gD          | go to declaration       |
 | gd          | go to definition        |
 | K           | hover                   |
 | gi          | list implementation     |
 | gr          | list reference          |
 | \<space\> f | formatting              |
</details>

<details>
 <summary markdown="span">代码补全相关</summary>
 
 | 快捷键       | 描述        |
 | ----------- | ----------- |
 | \<C-p\>       | pre item    |
 | \<C-n\>       | next item   |
 | \<C-d\>       | scroll down |
 | \<C-f\>       | scroll up   |
 | \<C-Space\>   | complete    |
 | \<C-e\>       | close       |
 | \<CR\>        | confirm     |
 
</details>
## 配置文件

`/nvim`

* [init.lua](nvim/init.lua): Main configuration file that call `lua` modules

* [lua](nvim/lua): Folder of `lua` modules, here reside all the Lua modules that needed. These modules are called from `init.lua` file (see below).

See: https://github.com/nanotee/nvim-lua-guide#where-to-put-lua-files

`/nvim/lua`

* [packer_init.lua](nvim/lua/packer_init.lua): Load plugins

`/nvim/lua/core`

* [colors.lua](nvim/lua/core/colors.lua): Define Neovim and plugins color scheme

* [keymaps.lua](nvim/lua/core/keymaps.lua): Keymaps configuration file, vim/neovim and plugins keymaps

* [settings.lua](nvim/lua/core/settings.lua): General Neovim settings and configuration

* [statusline.lua](nvim/lua/core/statusline.lua): Statusline configuration file

`/nvim/lua/plugins`

* [packer.lua](nvim/lua/plugins/packer.lua): Plugin manager settings

* [alpha-nvim.lua](nvim/lua/plugins/alpha-nvim.lua): Dashboard

* [indent-blankline.lua](nvim/lua/plugins/indent-blankline.lua): Indent line

* [nvim-cmp.lua](nvim/lua/plugins/nvim-cmp.lua): Autocompletion settings

* [nvim-lspconfig.lua](nvim/lua/plugins/nvim-lspconfig.lua): LSP configuration (language servers, keybinding)

* [nvim-tree.lua](nvim/lua/plugins/nvim-tree.lua): File manager settings

* [nvim-treesitter](nvim/lua/plugins/nvim-treesitter): Treesitter interface configuration

## 安装

1. Install [Neovim v0.7.x](https://github.com/neovim/neovim/releases/latest).

2. Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads), (for the font of the screenshots install [Cozette Font](https://github.com/slavfox/Cozette)).

3. Install [npm](https://github.com/npm/cli) for download packages of LSP language servers, see: [LSP Configuration](#lsp-configuration).

4. Make a backup of your current `nvim` folder if necessary:

```term
mv ~/.config/nvim ~/.config/nvim.backup
```

5. Download neovim-lua with `git` and copy the `nvim` folder in the `${HOME}/.config` directory:

```term
git clone https://github.com/brainfucksec/neovim-lua.git
cd neovim-lua/
cp -Rv nvim ~/.config/
```

6. Install [packer.nvim](https://github.com/wbthomason/packer.nvim) for install and manage the plugins:

```term
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

7. Run Neovim with `PackerSync` command:

```term
nvim +PackerSync
```

## LSP配置

1. Install LSP language servers with `npm`

```term
sudo npm install -g bash-language-server pyright vscode-langservers-extracted typescript typescript-language-server
```

2. Install additional packages for plugins support:

**C, C++:**

* [clang](https://clangd.llvm.org/installation.html) for use LSP with [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd).

* [ctags](https://github.com/universal-ctags/ctags) to view tags with [Tagbar](https://github.com/preservim/tagbar).

**Python:**

* [pynvim](https://github.com/neovim/pynvim)

3. Open a source file of one of the supported languages with Neovim, and run command [:LspInfo](https://github.com/neovim/nvim-lspconfig#built-in-commands) for testing the LSP support.

### Languages Currently Supported

Lua - [builtin](https://neovim.io/doc/user/lua.html)

Bash - [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)

Python - [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright)

C, C++ - [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd)

HTML, CSS, JSON - [vscode-html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)

JavaScript, TypeScript - [tsserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver)

See: [nvim-lspconfig #doc/server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

## 配色方案

The color scheme is defined in the following files (default: OneDark):

* Neovim UI - [nvim/lua/core/settings.lua](nvim/lua/core/settings.lua):

```lua
-- Load nvim color scheme:
...color_scheme = pcall(require, 'onedark')
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
```

* Statusline - [nvim/lua/plugins/feline.lua](nvim/lua/plugins/feline.lua):

```lua
-- Set colorscheme (from core/colors.lua/colorscheme_name)
local colors = require('core/colors').onedark_dark
```

See: [Appearance](#appearance)

## 外观配置

### Colorschemes

* [OneDark](https://github.com/navarasu/onedark.nvim)

* [Neovim Monokai](https://github.com/tanvirtin/monokai.nvim)

* [Rose Pine](https://github.com/rose-pine/neovim)

**Fonts:** [Cozette](https://github.com/slavfox/Cozette)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)


## Guides and resources

* https://neovim.io/doc/user/lua.html

* https://github.com/nanotee/nvim-lua-guide

* https://dev.to/vonheikemen/everything-you-need-to-know-to-configure-neovim-using-lua-3h58

* https://www.old.reddit.com/r/neovim/

## Lua resources

* Lua in Y minutes - https://learnxinyminutes.com/docs/lua/

* Lua Quick Guide - https://github.com/medwatt/Notes/blob/main/Lua/Lua_Quick_Guide.ipynb

* Lua 5.4 Reference Manual - https://www.lua.org/manual/5.4/

