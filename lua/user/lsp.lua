-- Safe requires
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then return end

-- Desabilitar log excessivo do LSP
vim.lsp.set_log_level("OFF") -- Options: OFF, ERROR, WARN, INFO, DEBUG, TRACE

-- Configurar diagnostics melhorados (Neovim 0.10+)
vim.diagnostic.config({
  virtual_text = false, -- Desabilitar texto inline dos erros
  float = {
    source = "always",
    border = "rounded",
  },
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Mostrar diagnóstico automaticamente ao passar o cursor na linha com erro
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- Diminuir o tempo de espera para mostrar o erro (padrão é 1000ms)
vim.opt.updatetime = 300

-- Customizar símbolos de diagnóstico
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Setup mason-lspconfig com todos os LSPs necessários
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",           -- Lua
    "ts_ls",            -- TypeScript/JavaScript
    "solargraph",       -- Ruby
    "html",             -- HTML
    "cssls",            -- CSS
    "bashls",           -- Bash
    "terraformls",      -- Terraform
    "yamlls",           -- YAML
    "jsonls",           -- JSON
  },
  automatic_installation = true,
})

-- Set capabilities for autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Função on_attach para configurar keybindings e inlay hints
local on_attach = function(client, bufnr)
  -- Habilitar inlay hints se o servidor suportar (Neovim 0.10+)
  if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

-- Configurações específicas por servidor usando a nova API vim.lsp.config (Neovim 0.11+)
local server_configs = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
        hint = {
          enable = true,
        },
      },
    },
  },
  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          kubernetes = "*.yaml",
          ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
          ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
          ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
          ["http://json.schemastore.org/docker-compose"] = "docker-compose.{yml,yaml}",
        },
      },
    },
  },
  terraformls = {
    filetypes = { "terraform", "tf", "hcl" },
  },
}

-- Configurar cada servidor LSP usando vim.lsp.config (Neovim 0.11+)
for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
  local config = server_configs[server_name] or {}
  config.capabilities = capabilities
  config.on_attach = on_attach

  -- Usar vim.lsp.config em vez de lspconfig (Neovim 0.11+)
  vim.lsp.config(server_name, config)
end

-- Também configurar automaticamente servidores quando instalados
vim.api.nvim_create_autocmd("User", {
  pattern = "MasonLspInstalled",
  callback = function(event)
    local server_name = event.data
    local config = server_configs[server_name] or {}
    config.capabilities = capabilities
    config.on_attach = on_attach
    vim.lsp.config(server_name, config)
  end,
})
