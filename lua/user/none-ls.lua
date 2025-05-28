-- ~/.config/nvim/lua/user/none-ls.lua
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- RUBY
    null_ls.builtins.diagnostics.rubocop.with({
      command = "bundle",
      args = { "exec", "rubocop", "--format", "json", "--force-exclusion", "--stdin", "$FILENAME" },
      condition = function(utils)
        return utils.root_has_file("Gemfile")
      end,
    }),

    -- JS / TS
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,

    -- FORMATADORES
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "css", "scss", "javascript", "typescript", "json", "yaml", "markdown" },
    }),
    null_ls.builtins.formatting.rubocop,
  },

  -- Auto format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = "Format", buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
