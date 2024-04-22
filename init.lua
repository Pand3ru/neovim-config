local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    {
        "AstroNvim/AstroNvim",
        version = "^4",
        import = "astronvim.plugins"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("neo-tree").setup({
                -- Minimal default setup
                close_if_last_window = true, -- close neo-tree if it is the last window
                filesystem = {
                    filtered_items = {
                        visible = false, -- set hidden files to not show by default
                    },
                },
            })
        end
    }
})
vim.api.nvim_set_keymap('n', '<A-r>', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-e>', '<C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-q>', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-f>', 'za', { noremap = true, silent = true })
