vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.cmd [[set mouse=a]]
-- otherwise vim replaces the content of current buffer with the new file you
-- open. Or maybe deletes the current buffer and creates a new one. Either way,
-- it makes swithcing between open files quickly a pain in the ass.
-- If i set the hidden option, i lose the line numbers for some reason. Not
-- for every file though. If i open this file, everything's fine. If i open
-- a directory and then open a js file. Boom!
vim.o.hidden = true
vim.cmd [[set report=2]]


-- so that vim-closetag works for jsx inside javascript files
vim.cmd [[
let g:closetag_filetypes = 'html,xhtml,jsx,javascript,typescript.tsx'
]]

-- Appearance
------------------------------------------------------------------------
-- relative line numbering, yo
-- number and relativenumber are window options. So doing vim.o.relativenumber = true
-- will not work
vim.wo.relativenumber = true
-- but we don't want pure relative line numbering. The line where the cursor is
-- should show absolute line number
vim.wo.number = true
-- show a bar on column 120. Going beyond 120 chars per line gets hard to read.
-- I have a linting rule in most of my projects to keep line limit to 120 chars.
-- I had no idea that colorcolumn is a window option
-- Tip: One way to find whether an option is global or window or buffer
-- try vim.o.<option_name> = 'blah' and run ex command :luafile %
-- It will tell you what the real type of the option_name should be
vim.wo.colorcolumn = "120"

-- maintain undo history between sessions
vim.cmd([[
set undofile
]])

-- Editing
-----------------------
-- doing vim.o.tabstop does not work. tabstop only works as a buffer option when trying to set with meta accessors
-- ideally, i guess they should be set per buffer depending on the type of file
-- vim.cmd [[set tabstop=4]]
-- vim.cmd [[set shiftwidth=4]]
-- vim.cmd [[set smarttab]]
-- vim.cmd [[autocmd FileType javascript setlocal ts=4 sts=4 sw=4]]
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
-- don't want case sensitive searches
vim.o.ignorecase = true
-- but still want search to be smart. If i type a upper case thing, do a case
-- sensitive search
vim.o.smartcase = true

-- Use system clipboard
-- I don't know why this is not the default option.
vim.api.nvim_set_option("clipboard","unnamed")

--vim.o.clipboard = "unnamed"
