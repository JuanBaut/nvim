## My Neovim Config (Reaper)

https://github.com/JuanBaut/nvim/assets/90160941/e5d12e9e-4ef4-4fbe-b392-e2148e1602e5

- This neovim config never stops changing but I enjoy that.
- I use it on osx and nixos, although it seems the main branch works in both.
- I am trying grapple but I might go back to harpoon.
- My remaps are not very conventional, but they are documented in whichkey.

### Nixos details

- Need to install tooling manually (lsps, formatters and linters).
- DISABLE mason-tool-installer.nvim, Mason itself won't conflict with already installed packages from nixos, but if there is anything autoinstalled it will override the system packages and cause issues. Please refer to _autoinstall.lua_.
- As long as the tools you need (or the ones listed in _autoinstall.lua_) are installed manually and set up in _lsp-config.lua_, _linting.lua_ and _formatting.lua_, it's all good.

_folke is the goat_
