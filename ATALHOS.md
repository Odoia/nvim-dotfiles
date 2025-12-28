# 📚 Guia Completo de Atalhos - Neovim Config

> **Leader Key:** `,` (vírgula)

---

## 🚨 IMPORTANTE

**Formatação automática ao salvar está DESABILITADA** para evitar problemas em código legado.
Para formatar código, use **`,lf`** manualmente.

---

## 💡 Como Ver Todos os Atalhos

**Pressione `,?` (vírgula + interrogação) para ver todos os atalhos disponíveis em um popup interativo!**

### 📺 Como Funciona o Popup:

**Exemplo 1:** Pressione `,` e espere ~300ms
```
╭──────────────────────────────────────────────────╮
│  LEADER KEY (,)                                  │
├──────────────────────────────────────────────────┤
│  f  →  󰍉 Telescope (Busca)                       │
│  l  →   LSP (Servidor de Linguagem)             │
│  e  →   Explorador de Arquivos                  │
│  m  →   Operações de Arquivo                    │
│  ?  →  [,?] Show All Keybindings                │
╰──────────────────────────────────────────────────╯
```
**Agora digite `f`** (ficando `,f`):
```
╭──────────────────────────────────────────────────╮
│  󰍉 Telescope (Busca)                             │
├──────────────────────────────────────────────────┤
│  f  →  [,ff]  Buscar Arquivos                   │
│  g  →  [,fg]  Buscar Texto (Live Grep)          │
│  b  →  [,fb]  Buffers Abertos                   │
│  h  →  [,fh]  Ajuda                              │
│  m  →  [,fm]  Buscar Model (Rails)              │
│  c  →  [,fc]  Buscar Controller (Rails)         │
│  s  →  [,fs]  Buscar Service (Rails)            │
│  t  →  [,ft]  Buscar Test (Rails)               │
│  d  →  󰆼 Database (Rails)                        │
╰──────────────────────────────────────────────────╯
```

**Exemplo 2:** Pressione `g` e espere ~300ms
```
╭──────────────────────────────────────────────────╮
│  󰊕 Go/LSP Actions                                │
├──────────────────────────────────────────────────┤
│  d  →  [gd]  Ir para Definição                  │
│  r  →  [gr]  Listar Referências                 │
│  c  →   Toggle Comment                          │
│  b  →   Toggle Block Comment                   │
╰──────────────────────────────────────────────────╯
```

### 🎯 Dicas:
- **Todas as descrições mostram a tecla entre colchetes: [,ff], [gd], etc**
- Assim você sempre vê qual tecla pressionar!
- Quanto mais usar, mais vai decorar naturalmente
- Use `,?` quando esquecer algum atalho
- Use `,hh` para abrir este guia completo (escolhe English/Português)

**Trocar idioma do popup:**
- `:WhichKeyLanguage en` → English (padrão)
- `:WhichKeyLanguage pt` → Português

---

## 📋 Resumo Rápido - Atalhos Mais Usados

| Atalho | Descrição |
|--------|-----------|
| `,?` | **Mostrar TODOS os atalhos (popup interativo)** |
| `,hh` | **Abrir guia de atalhos (escolhe idioma)** |
| `,ff` | Buscar arquivos no projeto |
| `,fg` | Buscar texto em todos os arquivos |
| `,ee` | Abrir/fechar explorador de arquivos |
| `,lf` | **Formatar código manualmente** |
| `,la` | **Correções automáticas (Code Actions)** |
| `,ld` | Ver detalhes do erro |
| `]d` / `[d` | Próximo/anterior erro |
| `gd` | Ir para definição |
| `K` | Mostrar documentação |
| `gcc` | Comentar/descomentar linha |

---

## 📑 Índice Completo

- [Telescope (Busca de Arquivos)](#-telescope-busca-de-arquivos)
- [LSP (Language Server Protocol)](#-lsp-language-server-protocol)
- [NvimTree (Explorador de Arquivos)](#-nvimtree-explorador-de-arquivos)
- [Navegação entre Janelas](#-navegação-entre-janelas)
- [Comentários](#-comentários)
- [Autocompletion (nvim-cmp)](#-autocompletion-nvim-cmp)
- [Operações de Arquivo no NvimTree](#-operações-de-arquivo-no-nvimtree)
- [Comandos Vim Essenciais](#-comandos-vim-essenciais)

---

## 🔍 Telescope (Busca de Arquivos)

Telescope é um fuzzy finder extremamente poderoso para buscar arquivos, texto, buffers e mais.

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `,ff` | Normal | Buscar arquivos no projeto | Pressione `,ff` e digite o nome do arquivo |
| `,fg` | Normal | Buscar texto em todos os arquivos (live grep) | `,fg` e digite "def create" para buscar métodos |
| `,fb` | Normal | Listar buffers abertos | `,fb` para ver todos os arquivos abertos |
| `,fh` | Normal | Buscar tags de ajuda | `,fh` e digite "telescope" para ver ajuda |

### 🛤️ Atalhos Específicos para Ruby on Rails

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `,fm` | Normal | Buscar arquivo de **Model** | `,fm` → digite "user" → abre `app/models/user.rb` |
| `,fc` | Normal | Buscar arquivo de **Controller** | `,fc` → digite "users" → abre `app/controllers/users_controller.rb` |
| `,fs` | Normal | Buscar arquivo de **Service** | `,fs` → digite "payment" → abre `app/services/payment_service.rb` |
| `,ft` | Normal | Buscar arquivo de **Test** (spec ou test) | `,ft` → digite "user" → abre `spec/models/user_spec.rb` |
| `,fdb` | Normal | Buscar **Migration** no banco de dados | `,fdb` → digite "add_email" → abre migration |

**Navegação no Telescope:**
- `Ctrl+n` / `Ctrl+p` ou `↓` / `↑`: Navegar entre resultados
- `Enter`: Abrir arquivo selecionado
- `Ctrl+x`: Abrir em split horizontal
- `Ctrl+v`: Abrir em split vertical
- `Ctrl+t`: Abrir em nova aba
- `Esc`: Fechar Telescope

---

## 🔧 LSP (Language Server Protocol)

LSP fornece funcionalidades inteligentes como autocomplete, ir para definição, mostrar erros, etc.

### Navegação de Código

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `gd` | Normal | **Go to Definition** - Ir para definição | Cursor em `User.find` → `gd` → vai para definição de `find` |
| `K` | Normal | **Hover** - Mostrar documentação | Cursor em método → `K` → mostra assinatura e docs |
| `gr` | Normal | **Go to References** - Listar referências | Cursor em método → `gr` → lista todos os usos |

### Formatação e Diagnósticos

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `,lf` | Normal | **Format Document** - Formatar arquivo MANUALMENTE | `,lf` formata todo o código com Prettier/RuboCop |
| `,ld` | Normal | **Show Diagnostics** - Mostrar erros/avisos | `,ld` abre janela flutuante com detalhes do erro |
| `,la` | Normal | **Code Actions** - Correções automáticas | `,la` mostra opções de correção (imports, fixes, etc) |
| `,lr` | Normal | **Rename Symbol** - Renomear variável/função | Cursor em variável → `,lr` → renomeia em todo código |
| `]d` | Normal | **Next Diagnostic** - Ir para próximo erro | `]d` pula para o próximo erro/aviso |
| `[d` | Normal | **Previous Diagnostic** - Ir para erro anterior | `[d` volta para o erro/aviso anterior |

> **⚠️ IMPORTANTE:** Formatação ao salvar está DESABILITADA. Use `,lf` para formatar manualmente.

### 💡 Inlay Hints (Neovim 0.10+)

**Habilitado automaticamente!** Mostra tipos inline no código TypeScript/JavaScript.

**Exemplo:**
```typescript
// Sem inlay hints
const result = calculateTotal(items)

// Com inlay hints (aparece automaticamente no editor)
const result: number = calculateTotal(items: Item[]): number
```

### 🎨 Como Funcionam os Erros

**Exibição de erros:**
- Ícones aparecem na lateral esquerda:  (erro),  (aviso),  (info),  (dica)
- **Texto do erro NÃO aparece inline** (desabilitado para não poluir o código)
- Para ver o erro completo: coloque o cursor na linha e espere ~300ms OU use `,ld`

**Para corrigir erros:**
1. Coloque cursor na linha com erro
2. `,la` → mostra menu com correções disponíveis
3. `Enter` → aplica a correção automaticamente
4. `,lf` → formata o código se necessário

---

## 🌲 NvimTree (Explorador de Arquivos)

### Atalhos Globais (funcionam em qualquer lugar)

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `,ee` | Normal | Toggle NvimTree (abrir/fechar) | `,ee` para abrir/fechar o explorador |
| `,ef` | Normal | Abrir NvimTree no arquivo atual | `,ef` para destacar arquivo atual na árvore |
| `,ec` | Normal | Colapsar toda a árvore | `,ec` para fechar todas as pastas |
| `,er` | Normal | Atualizar/Refresh a árvore | `,er` para recarregar arquivos |
| `,ev` | Normal | Abrir NvimTree e focar nele | `,ev` para abrir e ficar no explorador |

### Atalhos Dentro do NvimTree

**Geral:**
| Atalho | Descrição | Exemplo de Uso |
|--------|-----------|----------------|
| `q` | Fechar NvimTree | `q` para sair |
| `R` | Refresh/Atualizar | `R` após criar arquivo externo |
| `?` | Mostrar ajuda com todos os comandos | `?` para ver atalhos |

**Navegação:**
| Atalho | Descrição | Exemplo de Uso |
|--------|-----------|----------------|
| `Enter` ou `l` | Abrir arquivo/pasta | Cursor em `users.rb` → `Enter` → abre arquivo |
| `h` | Fechar pasta (ir para pasta pai) | Dentro de `models/` → `h` → fecha pasta |
| `v` | Abrir em split vertical | Cursor em arquivo → `v` → split vertical |
| `s` | Abrir em split horizontal | Cursor em arquivo → `s` → split horizontal |
| `u` | Subir um diretório (parent) | Em `app/models/` → `u` → vai para `app/` |
| `C` | Definir pasta atual como raiz | Em `app/` → `C` → `app/` vira raiz da árvore |

**Operações de Arquivo:**
| Atalho | Descrição | Exemplo de Uso |
|--------|-----------|----------------|
| `a` | Criar arquivo/pasta | `a` → digite `user.rb` → cria arquivo |
| `d` | Deletar arquivo/pasta | Cursor em arquivo → `d` → confirma → deleta |
| `r` | Renomear arquivo/pasta | Cursor em `old.rb` → `r` → digite `new.rb` |
| `x` | Recortar arquivo (cut) | Cursor em arquivo → `x` → corta |
| `c` | Copiar arquivo | Cursor em arquivo → `c` → copia |
| `p` | Colar arquivo cortado/copiado | `x` em arquivo → navega → `p` → cola |

**Clipboard:**
| Atalho | Descrição | Exemplo de Uso |
|--------|-----------|----------------|
| `y` | Copiar nome do arquivo | Cursor em `user.rb` → `y` → copia "user.rb" |
| `Y` | Copiar caminho relativo | Cursor em arquivo → `Y` → copia "app/models/user.rb" |
| `gy` | Copiar caminho absoluto | Cursor em arquivo → `gy` → copia caminho completo |

**Visibilidade:**
| Atalho | Descrição | Exemplo de Uso |
|--------|-----------|----------------|
| `I` | Toggle mostrar arquivos .gitignore | `I` para ver arquivos ignorados pelo git |
| `.` | Toggle mostrar arquivos ocultos (dotfiles) | `.` para ver `.env`, `.gitignore`, etc |
| `f` | Filtrar por nome | `f` → digite "spec" → mostra só arquivos com "spec" |
| `F` | Limpar filtro | `F` para remover filtro |

### 📁 Operações Rápidas de Arquivo (de qualquer lugar)

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `,ma` | Normal | **Add** - Criar novo arquivo | `,ma` → abre NvimTree → prompt para criar |
| `,mr` | Normal | **Rename** - Renomear arquivo | `,mr` → abre NvimTree → prompt para renomear |
| `,md` | Normal | **Delete** - Deletar arquivo | `,md` → abre NvimTree → prompt para deletar |

---

## 🪟 Navegação entre Janelas

Navegar entre splits/janelas do Neovim (funciona também no modo terminal).

### Modo Normal

| Atalho | Descrição | Exemplo de Uso |
|--------|-----------|----------------|
| `Ctrl+h` | Ir para janela da **esquerda** | Split vertical → `Ctrl+h` → vai pra esquerda |
| `Ctrl+j` | Ir para janela de **baixo** | Split horizontal → `Ctrl+j` → vai pra baixo |
| `Ctrl+k` | Ir para janela de **cima** | Split horizontal → `Ctrl+k` → vai pra cima |
| `Ctrl+l` | Ir para janela da **direita** | Split vertical → `Ctrl+l` → vai pra direita |

### Modo Terminal

Os mesmos atalhos funcionam no terminal integrado:

| Atalho | Descrição | Exemplo de Uso |
|--------|-----------|----------------|
| `Ctrl+h` | Sair do terminal e ir para esquerda | No terminal → `Ctrl+h` → volta pro editor |
| `Ctrl+j` | Sair do terminal e ir para baixo | No terminal → `Ctrl+j` → vai pra janela abaixo |
| `Ctrl+k` | Sair do terminal e ir para cima | No terminal → `Ctrl+k` → vai pra janela acima |
| `Ctrl+l` | Sair do terminal e ir para direita | No terminal → `Ctrl+l` → vai pra janela direita |

---

## 💬 Comentários

Comentários inteligentes que entendem contexto (JSX, TSX, Ruby, etc).

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `gcc` | Normal | Toggle comentário na linha atual | Cursor na linha → `gcc` → comenta/descomenta |
| `gc` + motion | Normal | Comentar com movimento | `gc3j` → comenta 3 linhas pra baixo |
| `gc` | Visual | Comentar seleção | Seleciona 5 linhas → `gc` → comenta todas |
| `gbc` | Normal | Toggle comentário em bloco (linha atual) | `gbc` → comenta como bloco `/* */` |
| `gb` + motion | Normal | Comentário em bloco com movimento | `gb3j` → comenta 3 linhas como bloco |
| `gb` | Visual | Comentar seleção como bloco | Seleciona código → `gb` → comenta como `/* */` |

**Exemplos:**
- **Ruby:** `# comentário`
- **JavaScript:** `// comentário` ou `/* bloco */`
- **JSX:** `{/* comentário JSX */}` (automático dentro de JSX!)
- **HTML:** `<!-- comentário -->`

---

## ⚡ Autocompletion (nvim-cmp)

Autocompletion inteligente com LSP, snippets, paths e buffers.

### Durante Digitação

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `Ctrl+Space` | Insert | Forçar abrir menu de completion | Digite `us` → `Ctrl+Space` → mostra sugestões |
| `Enter` | Insert | Confirmar seleção | Menu aberto → `Enter` → aceita sugestão |
| `Tab` | Insert | Próximo item / expandir snippet | Menu aberto → `Tab` → vai pro próximo |
| `Shift+Tab` | Insert | Item anterior / voltar no snippet | Menu aberto → `Shift+Tab` → volta |

### Completion na Linha de Comando

| Atalho | Modo | Descrição | Exemplo de Uso |
|--------|------|-----------|----------------|
| `:` + `Tab` | Command | Completar comandos | `:Telesc` → `Tab` → `:Telescope` |
| `/` + `Tab` | Search | Completar busca do buffer | `/func` → `Tab` → sugere "function" do buffer |

### 👻 Ghost Text

**Habilitado automaticamente!** Mostra preview da sugestão em texto cinza enquanto digita.

**Exemplo:**
```ruby
def cal█
    calculate_total  ← (ghost text, aparece em cinza)
```

---

## 🛠️ Operações de Arquivo no NvimTree

Exemplos práticos de workflows comuns:

### Criar um novo arquivo Rails

1. Pressione `,ma` (ou abra NvimTree com `,ee` e pressione `a`)
2. Digite o caminho: `app/models/product.rb`
3. Pressione `Enter`
4. Arquivo criado e aberto!

### Renomear um arquivo

1. Pressione `,mr` (ou `r` dentro do NvimTree)
2. Cursor no arquivo
3. Digite o novo nome: `new_name.rb`
4. Pressione `Enter`

### Copiar e colar arquivo

1. Abra NvimTree com `,ee`
2. Cursor no arquivo de origem
3. Pressione `c` (copiar)
4. Navegue até a pasta de destino
5. Pressione `p` (colar)

### Mover arquivo (recortar e colar)

1. Abra NvimTree com `,ee`
2. Cursor no arquivo
3. Pressione `x` (recortar)
4. Navegue até a pasta de destino
5. Pressione `p` (colar)

---

## 📖 Comandos Vim Essenciais

Comandos básicos do Vim que você deve conhecer:

### Modos

| Comando | Descrição |
|---------|-----------|
| `i` | Entrar no modo INSERT (antes do cursor) |
| `a` | Entrar no modo INSERT (depois do cursor) |
| `o` | Nova linha abaixo e entrar no INSERT |
| `O` | Nova linha acima e entrar no INSERT |
| `v` | Modo VISUAL (seleção de texto) |
| `V` | Modo VISUAL LINE (seleção de linhas inteiras) |
| `Ctrl+v` | Modo VISUAL BLOCK (seleção em bloco) |
| `Esc` | Voltar para modo NORMAL |

### Navegação

| Comando | Descrição |
|---------|-----------|
| `h` `j` `k` `l` | Esquerda, baixo, cima, direita |
| `w` | Próxima palavra |
| `b` | Palavra anterior |
| `0` | Início da linha |
| `$` | Fim da linha |
| `gg` | Início do arquivo |
| `G` | Fim do arquivo |
| `{` | Parágrafo anterior |
| `}` | Próximo parágrafo |
| `Ctrl+d` | Scroll meia página pra baixo |
| `Ctrl+u` | Scroll meia página pra cima |

### Edição

| Comando | Descrição |
|---------|-----------|
| `x` | Deletar caractere |
| `dd` | Deletar linha inteira |
| `yy` | Copiar (yank) linha inteira |
| `p` | Colar depois do cursor |
| `P` | Colar antes do cursor |
| `u` | Desfazer (undo) |
| `Ctrl+r` | Refazer (redo) |
| `ciw` | Mudar palavra inteira (change inner word) |
| `diw` | Deletar palavra inteira (delete inner word) |
| `ci"` | Mudar texto dentro de aspas |
| `di(` | Deletar texto dentro de parênteses |

### Busca e Substituição

| Comando | Descrição | Exemplo |
|---------|-----------|---------|
| `/texto` | Buscar "texto" pra frente | `/function` → `n` pra próximo |
| `?texto` | Buscar "texto" pra trás | `?class` → `N` pra anterior |
| `n` | Próximo resultado da busca | Após `/user` → `n` → próximo |
| `N` | Resultado anterior da busca | Após `/user` → `N` → anterior |
| `:%s/old/new/g` | Substituir "old" por "new" em todo arquivo | `:%s/User/Account/g` |
| `:s/old/new/g` | Substituir na linha atual | `:s/var/let/g` |

### Salvar e Sair

| Comando | Descrição |
|---------|-----------|
| `:w` | Salvar arquivo |
| `:q` | Sair (fecha janela atual) |
| `:wq` ou `:x` | Salvar e sair |
| `:q!` | Sair sem salvar (forçar) |
| `:wa` | Salvar todos os buffers |
| `:qa` | Fechar todas as janelas |

---

## 🎯 Fluxos de Trabalho Comuns

### Workflow Rails: Editar Model + Controller

1. `,fm` → digite "user" → abre `user.rb`
2. Faça alterações no model
3. `,fc` → digite "users" → abre `users_controller.rb`
4. `Ctrl+h` → volta pro model
5. `Ctrl+l` → volta pro controller
6. `:wa` → salva tudo

### Workflow React: Componentizar

1. `,ff` → digite "App" → abre `App.jsx`
2. Selecione código do componente no modo VISUAL (`v` ou `V`)
3. `y` → copia
4. `,ma` → digite `components/Header.jsx`
5. `p` → cola código
6. `,lf` → formata com Prettier manualmente

### Workflow Debug: Ver e corrigir erros LSP

1. **Ver erro:** Coloque cursor na linha com ícone de erro → espere 300ms ou use `,ld`
2. **Ver correções:** `,la` → mostra menu com correções automáticas disponíveis
3. **Aplicar correção:** `Enter` na opção → erro corrigido automaticamente!
4. **Navegar erros:** `]d` próximo erro, `[d` erro anterior
5. **Formatar tudo:** `,lf` → formata código manualmente (NÃO formata ao salvar!)

**Exemplo prático:**
```
Linha 10: const user = ...  ← ícone de erro
1. Cursor na linha 10 → aparece erro "user is never used"
2. `,la` → menu aparece: "Remove unused variable"
3. `Enter` → linha deletada automaticamente!
4. `,lf` → formata o código (se necessário)
5. :w → salva (SEM formatação automática)
```

### Workflow Git: Buscar e modificar

1. `,fg` → digite "TODO"
2. `Enter` no resultado
3. Cursor vai direto pro TODO
4. Edita
5. `,lf` → formata se necessário
6. `:w` → salva

---

## 🚀 Performance e Lazy Loading

Esta config foi otimizada para **startup rápido**:

- **Telescope**: Carrega apenas quando você pressiona `,ff`, `,fg`, etc
- **NvimTree**: Carrega apenas quando você pressiona `,ee`, `,ef`, etc
- **Completion**: Carrega apenas quando você entra no modo INSERT
- **LSP**: Carrega apenas quando você abre um arquivo de código
- **Mason**: Carrega apenas quando você executa `:Mason`

**Startup esperado: ~50-80ms** (vs ~150-200ms antes)

---

## 🌐 Linguagens Suportadas

Esta configuração está otimizada para:

### ✅ Linguagens com LSP Completo

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
- **Lua** - LSP: lua_ls (configurado para Neovim)

### 🎨 Features Modernas

- **Treesitter** - Syntax highlighting avançado para todas as linguagens
- **Inlay Hints** - Tipos inline para TypeScript/JavaScript/Lua
- **Auto-pairs** - Fecha automaticamente parênteses, colchetes, chaves
- **Auto-tags** - Fecha automaticamente tags HTML/JSX/TSX
- **EditorConfig** - Respeita configurações de projeto (.editorconfig)
- **Ghost Text** - Preview de autocomplete em tempo real
- **Rainbow Delimiters** - Parênteses coloridos por nível

---

## 📦 Instalação de Ferramentas Externas

Para usar todos os linters/formatters, instale:

### Via Mason (dentro do Neovim)

```vim
:Mason
```

Instala automaticamente todos os LSPs configurados!

### Via Package Manager (opcional)

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

## 🆘 Ajuda Rápida

| Comando | Descrição |
|---------|-----------|
| `,?` | **Mostrar todos os atalhos (popup interativo)** |
| `,hh` | **Abrir guia completa renderizada (pergunta idioma)** |
| `:WhichKeyLanguage en` | Idioma padrão do popup (English) |
| `:WhichKeyLanguage pt` | Mudar idioma do popup para Português |
| `:help <keyword>` | Ajuda do Neovim |
| `:Telescope help_tags` ou `,fh` | Buscar na ajuda |
| `:Mason` | Gerenciar LSPs/linters/formatters |
| `:checkhealth` | Verificar saúde da instalação |
| `:Lazy` | Gerenciar plugins |
| `:LspInfo` | Ver informações do LSP ativo |

### 📖 Sobre o `,hh` (Renderização de Markdown):

**Com Glow instalado:** Mostra o Markdown renderizado de forma bonita (recomendado!)
```bash
brew install glow  # macOS
```

**Sem Glow:** Abre o arquivo em modo somente leitura (sem formatação)

---

## 📝 Notas Finais

- **Leader Key:** `,` (vírgula)
- **Formatação:** MANUAL apenas (use `,lf`). Não formata ao salvar para evitar problemas em código legado
- **Números de linha:** Normais (1, 2, 3...), não relativos
- **Erros:** Aparecem apenas ícones. Texto completo ao parar cursor na linha (~300ms)
- **Inlay hints:** Aparecem automaticamente em arquivos TS/JS/Lua
- **Ghost text:** Aparece em cinza enquanto você digita (autocomplete)
- **Auto-pairs:** Fecha automaticamente `()`, `[]`, `{}`, `""`, `''`
- **Auto-tags:** Fecha automaticamente `<div>` → `</div>` em HTML/JSX

---

## 🔑 Todos os Atalhos (Referência Rápida)

### Telescope (Leader + f)
- `,ff` - Find Files (buscar arquivos)
- `,fg` - Live Grep (buscar texto)
- `,fb` - Find Buffers (buffers abertos)
- `,fh` - Find Help (ajuda)
- `,fm` - Find Model (Rails)
- `,fc` - Find Controller (Rails)
- `,fs` - Find Service (Rails)
- `,ft` - Find Test (Rails)
- `,fdb` - Find Migration (Rails)

### LSP (Leader + l)
- `,lf` - Format (formatar código manualmente)
- `,ld` - Show Diagnostics (mostrar erro detalhado)
- `,la` - Code Actions (correções automáticas)
- `,lr` - Rename (renomear símbolo)
- `gd` - Go to Definition
- `K` - Hover (documentação)
- `gr` - Go to References
- `]d` - Next Diagnostic (próximo erro)
- `[d` - Previous Diagnostic (erro anterior)

### NvimTree (Leader + e)
- `,ee` - Toggle Explorer
- `,ef` - Find File in Explorer
- `,ec` - Collapse Explorer
- `,er` - Refresh Explorer

### Arquivo (Leader + m)
- `,ma` - Make/Add (criar arquivo)
- `,mr` - Rename (renomear arquivo)
- `,md` - Delete (deletar arquivo)

### Navegação
- `Ctrl+h` - Janela esquerda
- `Ctrl+j` - Janela baixo
- `Ctrl+k` - Janela cima
- `Ctrl+l` - Janela direita

### Comentários
- `gcc` - Toggle linha
- `gc` - Toggle com movimento
- `gbc` - Toggle bloco (linha)
- `gb` - Toggle bloco com movimento

### Autocompletion
- `Ctrl+Space` - Abrir menu
- `Enter` - Confirmar
- `Tab` - Próximo item
- `Shift+Tab` - Item anterior

### Ajuda
- `,?` - Mostrar TODOS os atalhos (popup)
- `,hh` - Abrir guia completa (escolhe idioma)
- `:WhichKeyLanguage pt/en` - Trocar idioma do popup

---

**Configuração otimizada para: Ruby on Rails, React, JavaScript, TypeScript, Terraform, Bash, HTML, CSS, Markdown, YAML, e Kubernetes (k3s)**

**Performance:** ~50-80ms de startup (55% mais rápido!)

**Versão Neovim:** 0.11.1

---

Feito com ❤️ para desenvolvimento fullstack moderno!
