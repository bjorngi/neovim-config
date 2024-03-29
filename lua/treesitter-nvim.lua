local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "typescript",
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        "tsx"
        -- "rust",
        -- "go"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    indent = {
      enable = true
    }
}
