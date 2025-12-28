vim.g.mapleader = ","

local keymap = vim.keymap

-- Which-key: Mostrar todos os atalhos
keymap.set("n", "<leader>?", "<cmd>WhichKey<CR>", { desc = "Show All Keybindings" })

-- Help: Abrir arquivos de atalhos com seleção de idioma
keymap.set("n", "<leader>hh", function()
  vim.ui.select(
    { "English", "Português" },
    {
      prompt = "Choose language / Escolha o idioma:",
      format_item = function(item)
        if item == "English" then
          return "📘 English (KEYBINDINGS.md)"
        else
          return "📗 Português (ATALHOS.md)"
        end
      end,
    },
    function(choice)
      if choice == "English" then
        -- Verificar se glow está disponível
        if vim.fn.executable("glow") == 1 then
          vim.cmd("Glow ~/.config/nvim/KEYBINDINGS.md")
        else
          -- Fallback: abrir em modo de leitura
          vim.cmd("edit ~/.config/nvim/KEYBINDINGS.md")
          vim.cmd("setlocal readonly nomodifiable")
          vim.notify("Tip: Install 'glow' for better Markdown rendering (brew install glow)", vim.log.levels.INFO)
        end
      elseif choice == "Português" then
        -- Verificar se glow está disponível
        if vim.fn.executable("glow") == 1 then
          vim.cmd("Glow ~/.config/nvim/ATALHOS.md")
        else
          -- Fallback: abrir em modo de leitura
          vim.cmd("edit ~/.config/nvim/ATALHOS.md")
          vim.cmd("setlocal readonly nomodifiable")
          vim.notify("Dica: Instale 'glow' para melhor renderização (brew install glow)", vim.log.levels.INFO)
        end
      end
    end
  )
end, { desc = "Open Keybindings Guide" })

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })

-- Telescope: Rails-specific file search
keymap.set("n", "<leader>fm", function()
  require("telescope.builtin").find_files({ cwd = "app/models", prompt_title = "Find Model File" })
end, { desc = "Find Model File" })

keymap.set("n", "<leader>fc", function()
  require("telescope.builtin").find_files({ cwd = "app/controllers", prompt_title = "Find Controller File" })
end, { desc = "Find Controller File" })

keymap.set("n", "<leader>fs", function()
  require("telescope.builtin").find_files({ cwd = "app/services", prompt_title = "Find Service File" })
end, { desc = "Find Service File" })

keymap.set("n", "<leader>ft", function()
  local test_dir = vim.fn.isdirectory("spec") == 1 and "spec" or "test"
  require("telescope.builtin").find_files({ cwd = test_dir, prompt_title = "Find Test File" })
end, { desc = "Find Test File" })

keymap.set("n", "<leader>fdb", function()
  require("telescope.builtin").find_files({ cwd = "db/migrate", prompt_title = "Find Migration File" })
end, { desc = "Find Migration File" })

-- LSP
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Hover" })
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "List References" })

-- LSP Extra
keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format Document" })
keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Actions (Fix)" })
keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- Navegação entre erros/avisos
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window navigation in terminal mode
keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal: Move to left window" })
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal: Move to bottom window" })
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal: Move to top window" })
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal: Move to right window" })

-- NvimTree file operations
keymap.set("n", "<leader>ma", "<cmd>NvimTreeOpen<CR><cmd>lua require('nvim-tree.api').fs.create()<CR>", {
  desc = "Add new file/directory",
})

keymap.set("n", "<leader>mr", "<cmd>NvimTreeOpen<CR><cmd>lua require('nvim-tree.api').fs.rename()<CR>", {
  desc = "Rename file/directory",
})

keymap.set("n", "<leader>md", "<cmd>NvimTreeOpen<CR><cmd>lua require('nvim-tree.api').fs.remove()<CR>", {
  desc = "Delete file/directory",
})
