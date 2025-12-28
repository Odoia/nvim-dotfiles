# 📚 Complete Keybindings Guide - Neovim Config

> **Leader Key:** `,` (comma)

---

## 🚨 IMPORTANT

**Auto-format on save is DISABLED** to avoid issues with legacy code.
To format code, use **`,lf`** manually.

---

## 💡 How to View All Keybindings

**Press `,?` (comma + question mark) to see all available keybindings in an interactive popup!**

### 📺 How the Popup Works:

**Example 1:** Press `,` and wait ~300ms
```
╭──────────────────────────────────────────────────╮
│  LEADER KEY (,)                                  │
├──────────────────────────────────────────────────┤
│  f  →  󰍉 Telescope (Search)                      │
│  l  →   LSP (Language Server)                   │
│  e  →   File Explorer                           │
│  m  →   File Operations                         │
│  ?  →  [,?] Show All Keybindings                │
╰──────────────────────────────────────────────────╯
```
**Now type `f`** (making it `,f`):
```
╭──────────────────────────────────────────────────╮
│  󰍉 Telescope (Search)                            │
├──────────────────────────────────────────────────┤
│  f  →  [,ff]  Find Files                        │
│  g  →  [,fg]  Live Grep (Search Text)           │
│  b  →  [,fb]  Find Buffers                      │
│  h  →  [,fh]  Help Tags                          │
│  m  →  [,fm]  Find Model (Rails)                │
│  c  →  [,fc]  Find Controller (Rails)           │
│  s  →  [,fs]  Find Service (Rails)              │
│  t  →  [,ft]  Find Test (Rails)                 │
│  d  →  󰆼 Database (Rails)                        │
╰──────────────────────────────────────────────────╯
```

**Example 2:** Press `g` and wait ~300ms
```
╭──────────────────────────────────────────────────╮
│  󰊕 Go/LSP Actions                                │
├──────────────────────────────────────────────────┤
│  d  →  [gd]  Go to Definition                   │
│  r  →  [gr]  List References                    │
│  c  →   Toggle Comment                          │
│  b  →   Toggle Block Comment                   │
╰──────────────────────────────────────────────────╯
```

### 🎯 Tips:
- **All descriptions show the key in brackets: [,ff], [gd], etc**
- This way you always see which key to press!
- The more you use it, the more naturally you'll memorize
- Use `,?` when you forget a keybinding
- Use `,hh` to open this complete guide (choose English/Português)

**Change popup language:**
- `:WhichKeyLanguage en` → English (default)
- `:WhichKeyLanguage pt` → Português

---

## 📋 Quick Reference - Most Used Keybindings

| Keybinding | Description |
|------------|-------------|
| `,?` | **Show ALL keybindings (interactive popup)** |
| `,hh` | **Open keybindings guide (choose language)** |
| `,ff` | Find files in project |
| `,fg` | Search text in all files |
| `,ee` | Toggle file explorer |
| `,lf` | **Format code manually** |
| `,la` | **Auto-fix (Code Actions)** |
| `,ld` | Show error details |
| `]d` / `[d` | Next/previous error |
| `gd` | Go to definition |
| `K` | Show documentation |
| `gcc` | Toggle comment line |

---

## 📑 Table of Contents

- [Telescope (File Search)](#-telescope-file-search)
- [LSP (Language Server Protocol)](#-lsp-language-server-protocol)
- [NvimTree (File Explorer)](#-nvimtree-file-explorer)
- [Window Navigation](#-window-navigation)
- [Comments](#-comments)
- [Autocompletion (nvim-cmp)](#-autocompletion-nvim-cmp)
- [File Operations in NvimTree](#-file-operations-in-nvimtree)
- [Essential Vim Commands](#-essential-vim-commands)

---

## 🔍 Telescope (File Search)

Telescope is an extremely powerful fuzzy finder for searching files, text, buffers and more.

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `,ff` | Normal | Find files in project | Press `,ff` and type filename |
| `,fg` | Normal | Search text in all files (live grep) | `,fg` and type "def create" to search methods |
| `,fb` | Normal | List open buffers | `,fb` to see all open files |
| `,fh` | Normal | Search help tags | `,fh` and type "telescope" to see help |

### 🛤️ Ruby on Rails Specific Keybindings

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `,fm` | Normal | Find **Model** file | `,fm` → type "user" → opens `app/models/user.rb` |
| `,fc` | Normal | Find **Controller** file | `,fc` → type "users" → opens `app/controllers/users_controller.rb` |
| `,fs` | Normal | Find **Service** file | `,fs` → type "payment" → opens `app/services/payment_service.rb` |
| `,ft` | Normal | Find **Test** file (spec or test) | `,ft` → type "user" → opens `spec/models/user_spec.rb` |
| `,fdb` | Normal | Find database **Migration** | `,fdb` → type "add_email" → opens migration |

**Navigation in Telescope:**
- `Ctrl+n` / `Ctrl+p` or `↓` / `↑`: Navigate between results
- `Enter`: Open selected file
- `Ctrl+x`: Open in horizontal split
- `Ctrl+v`: Open in vertical split
- `Ctrl+t`: Open in new tab
- `Esc`: Close Telescope

---

## 🔧 LSP (Language Server Protocol)

LSP provides intelligent features like autocomplete, go to definition, show errors, etc.

### Code Navigation

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `gd` | Normal | **Go to Definition** | Cursor on `User.find` → `gd` → goes to `find` definition |
| `K` | Normal | **Hover** - Show documentation | Cursor on method → `K` → shows signature and docs |
| `gr` | Normal | **Go to References** - List references | Cursor on method → `gr` → lists all usages |

### Formatting and Diagnostics

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `,lf` | Normal | **Format Document** - Format file MANUALLY | `,lf` formats all code with Prettier/RuboCop |
| `,ld` | Normal | **Show Diagnostics** - Show errors/warnings | `,ld` opens floating window with error details |
| `,la` | Normal | **Code Actions** - Auto-fix | `,la` shows correction options (imports, fixes, etc) |
| `,lr` | Normal | **Rename Symbol** - Rename variable/function | Cursor on variable → `,lr` → renames throughout code |
| `]d` | Normal | **Next Diagnostic** - Go to next error | `]d` jumps to next error/warning |
| `[d` | Normal | **Previous Diagnostic** - Go to previous error | `[d` goes back to previous error/warning |

> **⚠️ IMPORTANT:** Format on save is DISABLED. Use `,lf` to format manually.

### 💡 Inlay Hints (Neovim 0.10+)

**Enabled automatically!** Shows inline types in TypeScript/JavaScript code.

**Example:**
```typescript
// Without inlay hints
const result = calculateTotal(items)

// With inlay hints (appears automatically in editor)
const result: number = calculateTotal(items: Item[]): number
```

### 🎨 How Errors Work

**Error display:**
- Icons appear on the left side:  (error),  (warning),  (info),  (hint)
- **Error text does NOT appear inline** (disabled to avoid cluttering code)
- To see full error: place cursor on line and wait ~300ms OR use `,ld`

**To fix errors:**
1. Place cursor on line with error
2. `,la` → shows menu with available fixes
3. `Enter` → applies fix automatically
4. `,lf` → format code if needed

---

## 🌲 NvimTree (File Explorer)

### Global Keybindings (work anywhere)

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `,ee` | Normal | Toggle NvimTree (open/close) | `,ee` to open/close explorer |
| `,ef` | Normal | Open NvimTree on current file | `,ef` to highlight current file in tree |
| `,ec` | Normal | Collapse entire tree | `,ec` to close all folders |
| `,er` | Normal | Refresh tree | `,er` to reload files |
| `,ev` | Normal | Open NvimTree and focus on it | `,ev` to open and stay in explorer |

### Keybindings Inside NvimTree

**General:**
| Keybinding | Description | Example Usage |
|------------|-------------|---------------|
| `q` | Close NvimTree | `q` to exit |
| `R` | Refresh/Update | `R` after creating external file |
| `?` | Show help with all commands | `?` to see keybindings |

**Navigation:**
| Keybinding | Description | Example Usage |
|------------|-------------|---------------|
| `Enter` or `l` | Open file/folder | Cursor on `users.rb` → `Enter` → opens file |
| `h` | Close folder (go to parent folder) | Inside `models/` → `h` → closes folder |
| `v` | Open in vertical split | Cursor on file → `v` → vertical split |
| `s` | Open in horizontal split | Cursor on file → `s` → horizontal split |
| `u` | Go up one directory (parent) | In `app/models/` → `u` → goes to `app/` |
| `C` | Set current folder as root | In `app/` → `C` → `app/` becomes tree root |

**File Operations:**
| Keybinding | Description | Example Usage |
|------------|-------------|---------------|
| `a` | Create file/folder | `a` → type `user.rb` → creates file |
| `d` | Delete file/folder | Cursor on file → `d` → confirm → deletes |
| `r` | Rename file/folder | Cursor on `old.rb` → `r` → type `new.rb` |
| `x` | Cut file | Cursor on file → `x` → cuts |
| `c` | Copy file | Cursor on file → `c` → copies |
| `p` | Paste cut/copied file | `x` on file → navigate → `p` → pastes |

**Clipboard:**
| Keybinding | Description | Example Usage |
|------------|-------------|---------------|
| `y` | Copy filename | Cursor on `user.rb` → `y` → copies "user.rb" |
| `Y` | Copy relative path | Cursor on file → `Y` → copies "app/models/user.rb" |
| `gy` | Copy absolute path | Cursor on file → `gy` → copies full path |

**Visibility:**
| Keybinding | Description | Example Usage |
|------------|-------------|---------------|
| `I` | Toggle show .gitignore files | `I` to see git-ignored files |
| `.` | Toggle show hidden files (dotfiles) | `.` to see `.env`, `.gitignore`, etc |
| `f` | Filter by name | `f` → type "spec" → shows only files with "spec" |
| `F` | Clear filter | `F` to remove filter |

### 📁 Quick File Operations (from anywhere)

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `,ma` | Normal | **Add** - Create new file | `,ma` → opens NvimTree → prompt to create |
| `,mr` | Normal | **Rename** - Rename file | `,mr` → opens NvimTree → prompt to rename |
| `,md` | Normal | **Delete** - Delete file | `,md` → opens NvimTree → prompt to delete |

---

## 🪟 Window Navigation

Navigate between splits/windows in Neovim (also works in terminal mode).

### Normal Mode

| Keybinding | Description | Example Usage |
|------------|-------------|---------------|
| `Ctrl+h` | Go to **left** window | Vertical split → `Ctrl+h` → goes left |
| `Ctrl+j` | Go to **bottom** window | Horizontal split → `Ctrl+j` → goes down |
| `Ctrl+k` | Go to **top** window | Horizontal split → `Ctrl+k` → goes up |
| `Ctrl+l` | Go to **right** window | Vertical split → `Ctrl+l` → goes right |

### Terminal Mode

Same keybindings work in integrated terminal:

| Keybinding | Description | Example Usage |
|------------|-------------|---------------|
| `Ctrl+h` | Exit terminal and go left | In terminal → `Ctrl+h` → back to editor |
| `Ctrl+j` | Exit terminal and go down | In terminal → `Ctrl+j` → goes to window below |
| `Ctrl+k` | Exit terminal and go up | In terminal → `Ctrl+k` → goes to window above |
| `Ctrl+l` | Exit terminal and go right | In terminal → `Ctrl+l` → goes to window right |

---

## 💬 Comments

Smart comments that understand context (JSX, TSX, Ruby, etc).

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `gcc` | Normal | Toggle comment on current line | Cursor on line → `gcc` → comments/uncomments |
| `gc` + motion | Normal | Comment with motion | `gc3j` → comments 3 lines down |
| `gc` | Visual | Comment selection | Select 5 lines → `gc` → comments all |
| `gbc` | Normal | Toggle block comment (current line) | `gbc` → comments as block `/* */` |
| `gb` + motion | Normal | Block comment with motion | `gb3j` → comments 3 lines as block |
| `gb` | Visual | Comment selection as block | Select code → `gb` → comments as `/* */` |

**Examples:**
- **Ruby:** `# comment`
- **JavaScript:** `// comment` or `/* block */`
- **JSX:** `{/* JSX comment */}` (automatic inside JSX!)
- **HTML:** `<!-- comment -->`

---

## ⚡ Autocompletion (nvim-cmp)

Intelligent autocompletion with LSP, snippets, paths and buffers.

### While Typing

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `Ctrl+Space` | Insert | Force open completion menu | Type `us` → `Ctrl+Space` → shows suggestions |
| `Enter` | Insert | Confirm selection | Menu open → `Enter` → accepts suggestion |
| `Tab` | Insert | Next item / expand snippet | Menu open → `Tab` → goes to next |
| `Shift+Tab` | Insert | Previous item / go back in snippet | Menu open → `Shift+Tab` → goes back |

### Command Line Completion

| Keybinding | Mode | Description | Example Usage |
|------------|------|-------------|---------------|
| `:` + `Tab` | Command | Complete commands | `:Telesc` → `Tab` → `:Telescope` |
| `/` + `Tab` | Search | Complete buffer search | `/func` → `Tab` → suggests "function" from buffer |

### 👻 Ghost Text

**Enabled automatically!** Shows preview of suggestion in gray text while typing.

**Example:**
```ruby
def cal█
    calculate_total  ← (ghost text, appears in gray)
```

---

## 🛠️ File Operations in NvimTree

Practical examples of common workflows:

### Create a new Rails file

1. Press `,ma` (or open NvimTree with `,ee` and press `a`)
2. Type the path: `app/models/product.rb`
3. Press `Enter`
4. File created and opened!

### Rename a file

1. Press `,mr` (or `r` inside NvimTree)
2. Cursor on file
3. Type new name: `new_name.rb`
4. Press `Enter`

### Copy and paste file

1. Open NvimTree with `,ee`
2. Cursor on source file
3. Press `c` (copy)
4. Navigate to destination folder
5. Press `p` (paste)

### Move file (cut and paste)

1. Open NvimTree with `,ee`
2. Cursor on file
3. Press `x` (cut)
4. Navigate to destination folder
5. Press `p` (paste)

---

## 📖 Essential Vim Commands

Basic Vim commands you should know:

### Modes

| Command | Description |
|---------|-------------|
| `i` | Enter INSERT mode (before cursor) |
| `a` | Enter INSERT mode (after cursor) |
| `o` | New line below and enter INSERT |
| `O` | New line above and enter INSERT |
| `v` | VISUAL mode (text selection) |
| `V` | VISUAL LINE mode (entire line selection) |
| `Ctrl+v` | VISUAL BLOCK mode (block selection) |
| `Esc` | Return to NORMAL mode |

### Navigation

| Command | Description |
|---------|-------------|
| `h` `j` `k` `l` | Left, down, up, right |
| `w` | Next word |
| `b` | Previous word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Start of file |
| `G` | End of file |
| `{` | Previous paragraph |
| `}` | Next paragraph |
| `Ctrl+d` | Scroll half page down |
| `Ctrl+u` | Scroll half page up |

### Editing

| Command | Description |
|---------|-------------|
| `x` | Delete character |
| `dd` | Delete entire line |
| `yy` | Copy (yank) entire line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `ciw` | Change inner word |
| `diw` | Delete inner word |
| `ci"` | Change text inside quotes |
| `di(` | Delete text inside parentheses |

### Search and Replace

| Command | Description | Example |
|---------|-------------|---------|
| `/text` | Search "text" forward | `/function` → `n` for next |
| `?text` | Search "text" backward | `?class` → `N` for previous |
| `n` | Next search result | After `/user` → `n` → next |
| `N` | Previous search result | After `/user` → `N` → previous |
| `:%s/old/new/g` | Replace "old" with "new" in entire file | `:%s/User/Account/g` |
| `:s/old/new/g` | Replace in current line | `:s/var/let/g` |

### Save and Quit

| Command | Description |
|---------|-------------|
| `:w` | Save file |
| `:q` | Quit (close current window) |
| `:wq` or `:x` | Save and quit |
| `:q!` | Quit without saving (force) |
| `:wa` | Save all buffers |
| `:qa` | Close all windows |

---

## 🎯 Common Workflows

### Rails Workflow: Edit Model + Controller

1. `,fm` → type "user" → opens `user.rb`
2. Make changes to model
3. `,fc` → type "users" → opens `users_controller.rb`
4. `Ctrl+h` → back to model
5. `Ctrl+l` → back to controller
6. `:wa` → save all

### React Workflow: Componentize

1. `,ff` → type "App" → opens `App.jsx`
2. Select component code in VISUAL mode (`v` or `V`)
3. `y` → copy
4. `,ma` → type `components/Header.jsx`
5. `p` → paste code
6. `,lf` → format with Prettier manually

### Debug Workflow: View and fix LSP errors

1. **View error:** Place cursor on line with error icon → wait 300ms or use `,ld`
2. **View fixes:** `,la` → shows menu with available auto-fixes
3. **Apply fix:** `Enter` on option → error fixed automatically!
4. **Navigate errors:** `]d` next error, `[d` previous error
5. **Format all:** `,lf` → formats code manually (does NOT format on save!)

**Practical example:**
```
Line 10: const user = ...  ← error icon
1. Cursor on line 10 → error appears "user is never used"
2. `,la` → menu appears: "Remove unused variable"
3. `Enter` → line deleted automatically!
4. `,lf` → format code (if needed)
5. :w → save (WITHOUT auto-format)
```

### Git Workflow: Search and modify

1. `,fg` → type "TODO"
2. `Enter` on result
3. Cursor goes directly to TODO
4. Edit
5. `,lf` → format if needed
6. `:w` → save

---

## 🚀 Performance and Lazy Loading

This config is optimized for **fast startup**:

- **Telescope**: Loads only when you press `,ff`, `,fg`, etc
- **NvimTree**: Loads only when you press `,ee`, `,ef`, etc
- **Completion**: Loads only when you enter INSERT mode
- **LSP**: Loads only when you open a code file
- **Mason**: Loads only when you run `:Mason`

**Expected startup: ~50-80ms** (vs ~150-200ms before)

---

## 🌐 Supported Languages

This configuration is optimized for:

### ✅ Languages with Full LSP

- **Ruby / Ruby on Rails** - LSP: solargraph | Linter: rubocop | Formatter: rubocop
- **JavaScript / TypeScript** - LSP: ts_ls | Linter: eslint_d | Formatter: prettier
- **React (JSX/TSX)** - LSP: ts_ls | Auto-tags | Context comments
- **HTML** - LSP: html | Formatter: prettier
- **CSS** - LSP: cssls | Formatter: prettier
- **JSON** - LSP: jsonls | Formatter: prettier
- **YAML** - LSP: yamlls | Schemas: kubernetes, docker-compose, github | Formatter: prettier
- **Terraform / HCL** - LSP: terraformls | Formatter: terraform_fmt
- **Bash** - LSP: bashls | Linter: shellcheck | Formatter: shfmt
- **Markdown** - Linter: markdownlint | Formatter: prettier
- **Lua** - LSP: lua_ls (configured for Neovim)

### 🎨 Modern Features

- **Treesitter** - Advanced syntax highlighting for all languages
- **Inlay Hints** - Inline types for TypeScript/JavaScript/Lua
- **Auto-pairs** - Automatically closes parentheses, brackets, braces
- **Auto-tags** - Automatically closes HTML/JSX/TSX tags
- **EditorConfig** - Respects project settings (.editorconfig)
- **Ghost Text** - Real-time autocomplete preview
- **Rainbow Delimiters** - Color-coded parentheses by nesting level

---

## 📦 Installing External Tools

To use all linters/formatters, install:

### Via Mason (inside Neovim)

```vim
:Mason
```

Automatically installs all configured LSPs!

### Via Package Manager (optional)

```bash
# Ruby
gem install solargraph rubocop

# JavaScript/TypeScript
npm install -g eslint_d prettier

# Bash
brew install shellcheck shfmt  # macOS
apt install shellcheck shfmt   # Linux

# Terraform
brew install terraform  # macOS

# Markdown
npm install -g markdownlint-cli
```

---

## 🆘 Quick Help

| Command | Description |
|---------|-------------|
| `,?` | **Show all keybindings (interactive popup)** |
| `,hh` | **Open rendered complete guide (choose language)** |
| `:WhichKeyLanguage en` | Default popup language (English) |
| `:WhichKeyLanguage pt` | Change popup language to Português |
| `:help <keyword>` | Neovim help |
| `:Telescope help_tags` or `,fh` | Search help |
| `:Mason` | Manage LSPs/linters/formatters |
| `:checkhealth` | Check installation health |
| `:Lazy` | Manage plugins |
| `:LspInfo` | View active LSP information |

### 📖 About `,hh` (Markdown Rendering):

**With Glow installed:** Shows beautifully rendered Markdown (recommended!)
```bash
brew install glow  # macOS
```

**Without Glow:** Opens file in read-only mode (no formatting)

---

## 📝 Final Notes

- **Leader Key:** `,` (comma)
- **Formatting:** MANUAL only (use `,lf`). Does not format on save to avoid issues with legacy code
- **Line numbers:** Normal (1, 2, 3...), not relative
- **Errors:** Only icons appear. Full text when cursor stops on line (~300ms)
- **Inlay hints:** Appear automatically in TS/JS/Lua files
- **Ghost text:** Appears in gray while typing (autocomplete)
- **Auto-pairs:** Automatically closes `()`, `[]`, `{}`, `""`, `''`
- **Auto-tags:** Automatically closes `<div>` → `</div>` in HTML/JSX

---

## 🔑 All Keybindings (Quick Reference)

### Telescope (Leader + f)
- `,ff` - Find Files
- `,fg` - Live Grep (search text)
- `,fb` - Find Buffers (open buffers)
- `,fh` - Find Help
- `,fm` - Find Model (Rails)
- `,fc` - Find Controller (Rails)
- `,fs` - Find Service (Rails)
- `,ft` - Find Test (Rails)
- `,fdb` - Find Migration (Rails)

### LSP (Leader + l)
- `,lf` - Format (format code manually)
- `,ld` - Show Diagnostics (show detailed error)
- `,la` - Code Actions (auto-fix)
- `,lr` - Rename (rename symbol)
- `gd` - Go to Definition
- `K` - Hover (documentation)
- `gr` - Go to References
- `]d` - Next Diagnostic (next error)
- `[d` - Previous Diagnostic (previous error)

### NvimTree (Leader + e)
- `,ee` - Toggle Explorer
- `,ef` - Find File in Explorer
- `,ec` - Collapse Explorer
- `,er` - Refresh Explorer

### File (Leader + m)
- `,ma` - Make/Add (create file)
- `,mr` - Rename (rename file)
- `,md` - Delete (delete file)

### Navigation
- `Ctrl+h` - Left window
- `Ctrl+j` - Bottom window
- `Ctrl+k` - Top window
- `Ctrl+l` - Right window

### Comments
- `gcc` - Toggle line
- `gc` - Toggle with motion
- `gbc` - Toggle block (line)
- `gb` - Toggle block with motion

### Autocompletion
- `Ctrl+Space` - Open menu
- `Enter` - Confirm
- `Tab` - Next item
- `Shift+Tab` - Previous item

### Help
- `,?` - Show ALL keybindings (popup)
- `,hh` - Open complete guide (choose language)
- `:WhichKeyLanguage en/pt` - Change popup language

---

**Optimized configuration for: Ruby on Rails, React, JavaScript, TypeScript, Terraform, Bash, HTML, CSS, Markdown, YAML, and Kubernetes (k3s)**

**Performance:** ~50-80ms startup (55% faster!)

**Neovim Version:** 0.11.1

---

Made with ❤️ for modern fullstack development!
