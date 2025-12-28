-- ~/.config/nvim/lua/user/none-ls.lua
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- ========================================
    -- RUBY / RAILS
    -- ========================================
    -- Linter/formatter para Ruby (usa RuboCop via bundle exec se Gemfile existir)
    null_ls.builtins.diagnostics.rubocop.with({
      command = "bundle",
      args = { "exec", "rubocop", "--format", "json", "--force-exclusion", "--stdin", "$FILENAME" },
      condition = function(utils)
        return utils.root_has_file("Gemfile")
      end,
    }),
    null_ls.builtins.formatting.rubocop.with({
      command = "bundle",
      args = { "exec", "rubocop", "--auto-correct", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
      condition = function(utils)
        return utils.root_has_file("Gemfile")
      end,
    }),

    -- ========================================
    -- JAVASCRIPT / TYPESCRIPT / REACT
    -- ========================================
    -- ESLint removido: none-ls não tem mais builtins para eslint
    -- Use o LSP ts_ls para linting de JavaScript/TypeScript
    -- Ou instale nvim-lint separadamente se precisar de eslint

    -- ========================================
    -- FORMATADORES GERAIS
    -- ========================================
    -- Prettier para formatação (HTML, CSS, JS, TS, JSON, YAML, Markdown)
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "yaml",
        "markdown",
      },
      condition = function(utils)
        return utils.root_has_file({
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.js",
          "prettier.config.js",
          "package.json",
        })
      end,
    }),

    -- ========================================
    -- TERRAFORM / HCL
    -- ========================================
    -- Formatter para Terraform
    null_ls.builtins.formatting.terraform_fmt,

    -- ========================================
    -- BASH / SHELL
    -- ========================================
    -- Linter para Shell scripts
    null_ls.builtins.diagnostics.shellcheck,
    -- Formatter para Shell scripts
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "2", "-ci" }, -- 2 espaços de indentação, indent case
    }),

    -- ========================================
    -- MARKDOWN
    -- ========================================
    -- Linter para Markdown
    null_ls.builtins.diagnostics.markdownlint.with({
      condition = function(utils)
        return utils.root_has_file({
          ".markdownlint.json",
          ".markdownlintrc",
        })
      end,
    }),
  },

  -- Auto format on save DESABILITADO (pode causar problemas em código legado)
  -- Para formatar manualmente, use: ,lf (no modo Normal)
})
