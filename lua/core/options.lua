local opt = vim.opt
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

vim.keymap.set("n", "<Space>", "<Nop>")
vim.g.mapleader = " " -- set mapleader with <space>

vim.opt.undodir = { prefix .. "/nvim/.undo//" }

opt.encoding = "utf-8" -- Format text
opt.number = true -- Make line numbers default
opt.showcmd = true -- Show (partial) command in status line.
opt.showmatch = true -- highlight matching brackets
opt.relativenumber = true -- Make relative number default
opt.ruler = true -- Font line number
opt.cursorline = true -- show cursor line
-- opt.cursorcolumn = true -- show cursor column
opt.clipboard = "unnamed" -- Access system clipboard
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.
opt.swapfile = false -- Don't create swapfiles
opt.nuw = 2 --Space line number
opt.expandtab = true -- use space instead of tab by default
opt.sw = 2 --Indent space
opt.tabstop = 2 --Space equals Tabs
opt.showtabline = 0 --2 Show tabas ever
opt.undofile = true -- Save undo history
opt.splitright = true --Split open rigth
opt.splitbelow = true --Split open bottom
-- opt.paste = true
-- opt.nopaste = true
opt.cmdheight = 1
opt.completeopt = "menu,menuone,noselect" --LSP autocomplete menu
opt.autoread = true --Refresh file with is external modify
opt.incsearch = true --Highline with typing search
-- opt.hlsearch = true        -- Set highlight on search
opt.wildmenu = true --Show autocomplete cmd commands
opt.diffopt = "vertical"
opt.laststatus = 3 --Hidden inactive panels status
opt.mouse = "a" -- Enable mouse mode
opt.hidden = true
opt.errorbells = false

opt.termguicolors = true -- Enable colors in terminal
opt.breakindent = true -- Enable break indent
-- opt.ignorecase = true      -- Case insensitive searching unless /C or capital in search
-- opt.smartcase = true       -- Smart case
-- opt.updatetime = 250       -- Decrease update time
-- opt.signcolumn = "yes--    -- Always show sign column
-- opt.joinspaces = false     -- No double spaces with join after a dot
-- opt.list = true            -- show space and tabs chars
-- opt.spelllang = "en_us"
opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

opt.timeoutlen = 1000 -- Time in milliseconds to wait for a mapped sequence to complete. default is 1000
opt.ttimeoutlen = 0 --Time in milliseconds to wait for a key code sequence to complete.
