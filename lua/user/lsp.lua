-- Safe requires
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then return end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then return end

local lspconfig = require("lspconfig")

-- Setup mason
mason.setup()

-- Setup mason-lspconfig with correct LSP server names
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "solargraph",
    "html",
    "cssls",
  },
})

-- Set capabilities for autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Use setup_handlers if available, fallback otherwise
if mason_lspconfig.setup_handlers then
  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end,
  })
else
  -- fallback for older versions
  for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    lspconfig[server].setup({
      capabilities = capabilities,
    })
  end
end
