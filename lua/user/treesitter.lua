require("nvim-treesitter.configs").setup({
  -- Instalar parsers para todas as linguagens solicitadas
  ensure_installed = {
    "lua",
    "ruby",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "yaml",
    "bash",
    "markdown",
    "markdown_inline",
    "terraform",
    "hcl",
    "vim",
    "vimdoc",
  },

  -- Instalar parsers automaticamente quando abrir um arquivo
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  -- Configurar nvim-ts-autotag para auto-close de tags HTML/JSX
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "xml",
    },
  },
})
