local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- save, exit, exit without saving file
map("n", "<C-s>", ":w<cr>")
map("n", "<C-x>", ":x<cr>")
map("n", "<C-q>", ":q!<cr>")

-- source config
map("n", "<F4>", ":lua package.loaded.main = nil <cr>:source ~/.config/nvim/init.lua <cr>")
-- nnoremap <leader>cb <cmd>lua require("main").curr_buf() <cr>

-- Telescope bindings
map("n", "<leader>cd", ":Telescope find_files<CR>")

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Vim Rest console 
-- let g:vrc_set_default_mapping = 0
map("n","<leader>mr", ":call VrcQuery()<CR>")

-- let g:vrc_curl_opts = {
--       \ '-s':'',
--       \ '-i':'',
--     \}

-- Git fugitive
map("n", "<C-g>", ":G<CR>")

-- Go to tab by number
map("n", "<leader>1", "1gt")
map("n", "<leader>2", "2gt")
map("n", "<leader>3", "3gt")
map("n", "<leader>4", "4gt")
map("n", "<leader>5", "5gt")
map("n", "<leader>6", "5gt")
map("n", "<leader>7", "7gt")
map("n", "<leader>9", "8gt")
map("n", "<leader>0", ":tablast<cr>")
map("n", "<leader>tt", ":tabnew<cr>")
