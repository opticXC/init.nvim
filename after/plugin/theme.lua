require("tokyonight").setup({
    disable_background=true
})

function ThemeMyScreen(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    -- Uncomment for transparent backround
    --- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ThemeMyScreen()
