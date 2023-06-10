# nvim-bullseye

![demo](https://github.com/jt-ziolo/nvim-bullseye/assets/14256313/ec42333f-5766-422b-8660-abd89a7b81c5)

nvim-bullseye is a Lua Neovim plugin that provides convenient keybindings for editing and pasting text in Neovim. It allows you to perform actions such as editing in insert or append mode before/after the current word and pasting from the default register. 

> __Note__  
> This is a new project. New features or changes to current functionality are likely (keeping disruptive changes like changes to existing function names to a minimum). Suggestions for how to improve the plugin and pull requests are welcome.

## Installation

Follow your plugin manager's instructions for installing lua plugins from GitHub.

**init.lua**:
```lua
-- packer
use { "jt-ziolo/nvim-bullseye" }

-- lazy.nvim
{ "jt-ziolo/nvim-bullseye" },
```

### Keybindings

The following keybindings are available for the plugin, but they are not initially set. You can customize them to your liking:

```lua
vim.keymap.set({"n"}, "<leader>a", "<cmd>lua require('nvim-bullseye').startAppendAfterWord()<CR>", { desc = "BullseyeStartAppendAfterWord" })
vim.keymap.set({"n"}, "<leader>i", "<cmd>lua require('nvim-bullseye').startInsertBeforeWord()<CR>", { desc = "BullseyeStartInsertBeforeWord" })
vim.keymap.set({"n"}, "<leader>P", "<cmd>lua require('nvim-bullseye').pasteBeforeN()<CR>", { desc = "BullseyePasteBeforeN" })
vim.keymap.set({"n"}, "<leader>p", "<cmd>lua require('nvim-bullseye').pasteAfterN()<CR>", { desc = "BullseyePasteAfterN" })
```

## Functionality

The plugin provides the following functionality:

1. **Begin editing in insert mode before the current word:** This action allows you to start editing in insert mode before the word that your cursor is currently over. A space is automatically added between the word you started on and where you begin editing from.

2. **Begin editing in append mode after the current word:** This action lets you start editing in append mode after the word that your cursor is currently over. A space is automatically added between the word you started on and where you being editing from.

3. **Paste from the default register before the current word:** This action allows you to paste the contents of the default register (usually the most recent yank or delete) before the current word. A space is automatically added after the pasted text. Additionally, you can specify the number of times to paste the register contents by providing a count before the command (#<cmd>).

4. **Paste from the default register after the current word:** This action enables you to paste the contents of the default register after the current word. A space is automatically added before the pasted text. You can also specify the number of times to paste the register contents.
  
## Contributing

Please see the CONTRIBUTING.md file for information on how to contribute to this project.
  
## License

This project is licensed under the Apache License. See the LICENSE file for more information.
