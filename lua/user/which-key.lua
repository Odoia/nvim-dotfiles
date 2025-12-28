-- ~/.config/nvim/lua/user/which-key.lua

local wk = require("which-key")

-- Configuração global: escolha o idioma aqui
-- Global configuration: choose language here
-- Options: "en" (English) or "pt" (Português)
-- To change: :WhichKeyLanguage pt (or :WhichKeyLanguage en)
local LANGUAGE = "en"

-- Traduções
local translations = {
  en = {
    -- Telescope
    find_files = "Find Files",
    live_grep = "Live Grep (Search Text)",
    find_buffers = "Find Buffers",
    help_tags = "Help Tags",
    find_model = "Find Model (Rails)",
    find_controller = "Find Controller (Rails)",
    find_service = "Find Service (Rails)",
    find_test = "Find Test (Rails)",
    find_migration = "Find Migration (Rails)",

    -- LSP
    format = "Format Code",
    diagnostics = "Show Diagnostics",
    code_actions = "Code Actions (Fix)",
    rename = "Rename Symbol",
    goto_def = "Go to Definition",
    hover = "Show Documentation",
    references = "List References",
    next_diagnostic = "Next Error/Warning",
    prev_diagnostic = "Previous Error/Warning",

    -- NvimTree
    toggle_tree = "Toggle File Explorer",
    find_file = "Find File in Explorer",
    collapse = "Collapse Explorer",
    refresh = "Refresh Explorer",

    -- File operations
    make_file = "Create File/Directory",
    rename_file = "Rename File/Directory",
    delete_file = "Delete File/Directory",

    -- Groups
    telescope = "Telescope (Search)",
    lsp = "LSP (Language Server)",
    nvimtree = "File Explorer",
    files = "File Operations",
  },
  pt = {
    -- Telescope
    find_files = "Buscar Arquivos",
    live_grep = "Buscar Texto (Live Grep)",
    find_buffers = "Buffers Abertos",
    help_tags = "Ajuda",
    find_model = "Buscar Model (Rails)",
    find_controller = "Buscar Controller (Rails)",
    find_service = "Buscar Service (Rails)",
    find_test = "Buscar Test (Rails)",
    find_migration = "Buscar Migration (Rails)",

    -- LSP
    format = "Formatar Código",
    diagnostics = "Mostrar Diagnósticos",
    code_actions = "Ações de Código (Corrigir)",
    rename = "Renomear Símbolo",
    goto_def = "Ir para Definição",
    hover = "Mostrar Documentação",
    references = "Listar Referências",
    next_diagnostic = "Próximo Erro/Aviso",
    prev_diagnostic = "Erro/Aviso Anterior",

    -- NvimTree
    toggle_tree = "Abrir/Fechar Explorador",
    find_file = "Encontrar Arquivo no Explorador",
    collapse = "Colapsar Explorador",
    refresh = "Atualizar Explorador",

    -- File operations
    make_file = "Criar Arquivo/Diretório",
    rename_file = "Renomear Arquivo/Diretório",
    delete_file = "Deletar Arquivo/Diretório",

    -- Groups
    telescope = "Telescope (Busca)",
    lsp = "LSP (Servidor de Linguagem)",
    nvimtree = "Explorador de Arquivos",
    files = "Operações de Arquivo",
  },
}

-- Pega tradução atual
local function t(key)
  return translations[LANGUAGE][key] or key
end

-- Setup do which-key
wk.setup({
  preset = "classic", -- usar preset clássico que mostra as teclas melhor
  delay = 300, -- Delay antes de mostrar o popup (ms)

  -- Configurar como as teclas são mostradas
  keys = {
    scroll_down = "<c-d>", -- binding para scroll down
    scroll_up = "<c-u>",   -- binding para scroll up
  },

  icons = {
    breadcrumb = "»",
    separator = "→", -- usar seta mais visível
    group = "󰹕 ", -- ícone para grupos
    ellipsis = "…",
    -- Mostrar teclas especiais de forma clara
    keys = {
      Up = "󰁝 ",
      Down = "󰁅 ",
      Left = "󰁍 ",
      Right = "󰁔 ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },
  },

  win = {
    border = "rounded",
    padding = { 2, 2 }, -- mais padding para melhor legibilidade
    title = true,
    title_pos = "center",
    wo = {
      winblend = 0, -- sem transparência
    },
  },

  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 5, -- mais espaço entre colunas para clareza
    align = "left",
  },

  -- Mostrar informação extra
  show_help = true, -- mostrar dica de ajuda no topo
  show_keys = true, -- IMPORTANTE: mostrar as teclas
})

-- Registrar atalhos com descrições
wk.add({
  -- ========================================
  -- LEADER KEY
  -- ========================================
  { "<leader>", group = "LEADER KEY (,)", mode = { "n", "v" } },

  -- ========================================
  -- TELESCOPE (Leader + f)
  -- ========================================
  { "<leader>f", group = "󰍉 " .. t("telescope") },
  { "<leader>ff", desc = "[,ff] " .. t("find_files") },
  { "<leader>fg", desc = "[,fg] " .. t("live_grep") },
  { "<leader>fb", desc = "[,fb] " .. t("find_buffers") },
  { "<leader>fh", desc = "[,fh] " .. t("help_tags") },
  { "<leader>fm", desc = "[,fm] " .. t("find_model") },
  { "<leader>fc", desc = "[,fc] " .. t("find_controller") },
  { "<leader>fs", desc = "[,fs] " .. t("find_service") },
  { "<leader>ft", desc = "[,ft] " .. t("find_test") },
  { "<leader>fd", group = "󰆼 Database (Rails)" },
  { "<leader>fdb", desc = "[,fdb] " .. t("find_migration") },

  -- ========================================
  -- LSP (Leader + l)
  -- ========================================
  { "<leader>l", group = " " .. t("lsp") },
  { "<leader>lf", desc = "[,lf] " .. t("format") },
  { "<leader>ld", desc = "[,ld] " .. t("diagnostics") },
  { "<leader>la", desc = "[,la] " .. t("code_actions") },
  { "<leader>lr", desc = "[,lr] " .. t("rename") },

  -- ========================================
  -- NVIMTREE (Leader + e)
  -- ========================================
  { "<leader>e", group = " " .. t("nvimtree") },
  { "<leader>ee", desc = "[,ee] " .. t("toggle_tree") },
  { "<leader>ef", desc = "[,ef] " .. t("find_file") },
  { "<leader>ec", desc = "[,ec] " .. t("collapse") },
  { "<leader>er", desc = "[,er] " .. t("refresh") },

  -- ========================================
  -- FILE OPERATIONS (Leader + m)
  -- ========================================
  { "<leader>m", group = " " .. t("files") },
  { "<leader>ma", desc = "[,ma] " .. t("make_file") },
  { "<leader>mr", desc = "[,mr] " .. t("rename_file") },
  { "<leader>md", desc = "[,md] " .. t("delete_file") },

  -- ========================================
  -- HELP
  -- ========================================
  { "<leader>h", group = " Help / Ajuda" },
  { "<leader>hh", desc = "[,hh] Open Keybindings Guide" },
  { "<leader>?", desc = "[,?] Show All Keybindings (Popup)" },

  -- ========================================
  -- LSP sem leader (tecla g)
  -- ========================================
  { "g", group = "󰊕 Go/LSP Actions" },
  { "gd", desc = "[gd] " .. t("goto_def") },
  { "gr", desc = "[gr] " .. t("references") },
  { "K", desc = "[K] " .. t("hover") },

  -- ========================================
  -- DIAGNOSTICS (teclas [ e ])
  -- ========================================
  { "]", group = "󰮰 Next" },
  { "]d", desc = "[d] " .. t("next_diagnostic") },
  { "[", group = "󰮲 Previous" },
  { "[d", desc = "[[d] " .. t("prev_diagnostic") },

  -- ========================================
  -- COMMENTS (tecla g)
  -- ========================================
  { "gc", group = " Toggle Comment", mode = { "n", "v" } },
  { "gb", group = " Toggle Block Comment", mode = { "n", "v" } },
  { "gcc", desc = "[gcc] Comment Line" },
  { "gbc", desc = "[gbc] Block Comment Line" },

  -- ========================================
  -- WINDOW NAVIGATION (Ctrl)
  -- ========================================
  { "<C-h>", desc = "[Ctrl+h] ← Left Window" },
  { "<C-j>", desc = "[Ctrl+j] ↓ Bottom Window" },
  { "<C-k>", desc = "[Ctrl+k] ↑ Top Window" },
  { "<C-l>", desc = "[Ctrl+l] → Right Window" },
})

-- Adicionar comando para trocar idioma
vim.api.nvim_create_user_command("WhichKeyLanguage", function(opts)
  local lang = opts.args
  if lang == "en" or lang == "pt" then
    LANGUAGE = lang
    -- Recarregar configuração
    package.loaded["user.which-key"] = nil
    require("user.which-key")
    vim.notify("Which-Key language changed to: " .. lang, vim.log.levels.INFO)
  else
    vim.notify("Invalid language. Use 'en' or 'pt'", vim.log.levels.ERROR)
  end
end, {
  nargs = 1,
  complete = function()
    return { "en", "pt" }
  end,
})
