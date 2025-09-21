vim.lsp.enable({
    "tailwindcss",
    "vue_ls",
    "vtsls",
    "lua_ls",
})

vim.diagnostic.config({
    virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#36A3D9", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#BF616A", bold = true })

vim.api.nvim_set_hl(0, "DiagnosticLineNrError", { bg = "#51202A", fg = "#BF616A", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticLineNrWarn", { bg = "#51412A", fg = "#FFA500", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticLineNrInfo", { bg = "#1E535D", fg = "#00FFFF", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticLineNrHint", { bg = "#1E205D", fg = "#0000FF", bold = true })
