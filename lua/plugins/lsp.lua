-- Borders for LspInfo winodw
local win = require "lspconfig.ui.windows"
--local _default_opts = win.default_opts

--vim.cmd [[
  --highlight! LspReferenceText guibg=#7CFC00 guifg=#7CFC00 gui=bold
--]]

local hl_name = "CmpPmenu"
local border = {
  { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
}


--win.default_opts = function(options)
  --local opts = _default_opts(options)
  --opts.border = "single"
  --return opts
--end

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = border or "single"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>cn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>cn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- start of config for the clang-tidy addon for the lsp



-- end of custom for the clangtidy

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require 'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require 'lspconfig'.rust_analyzer.setup {

  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
}

require 'lspconfig'.clangd.setup {
  on_attach = on_attach,
  cmd = {
    -- see clangd --help-hidden
    "clangd",
    "--background-index",
    "-j=12",
    "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    "--clang-tidy",
    "--clang-tidy-checks=*",
    "--all-scopes-completion",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
    "--pch-storage=memory",
  }
}

local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.html.setup{
  capabilities = html_capabilities,
}


-- js
require 'lspconfig'.eslint.setup {}
require 'lspconfig'.tsserver.setup {}

-- css
require 'lspconfig'.cssls.setup {
  -- capabilities are the same with the html
  capabilities = html_capabilities;
}

local dap = require('dap')

dap.configurations.java = {

  javaExec = "java",
  mainClass = "com.october.learning.LearningApplication",

  name = "Launch YourClassName",
  request = "launch",
  type = "java"
}

--[[
   [
   [local html_capabilities = vim.lsp.protocol.make_client_capabilities()
   [html_capabilities.textDocument.completion.completionItem.snippetSupport = true
   [require 'lspconfig'.html.setup{
   [  capabilities = html_capabilities,
   [}
   ]]
--[[
   [
   [local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
   [local workspace_dir_temp = "\\workspace\\" .. project_name
   [
   [local lspcutil = require 'lspconfig.util'
   [local my_root_files = {
   [  -- Single-module projects
   [  {
   [    '.vscode',
   [    '.git', -- git
   [    'build.xml', -- Ant
   [    'pom.xml', -- Maven
   [    'settings.gradle', -- Gradle
   [    'settings.gradle.kts', -- Gradle
   [    'haha.txt',
   [  },
   [  -- Multi-module projects
   [  { 'build.gradle', 'build.gradle.kts' },
   [}
   [
   ]]

--[[
   [local jdtls_env = os.getenv('JDTLS_HOME')
   [local jar_path = jdtls_env .. '\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
   [local workspace_dir = jdtls_env .. workspace_dir_temp
   [local config_path = jdtls_env .. '\\config_win'
   [
   [-- js
   [require 'lspconfig'.eslint.setup {}
   [require 'lspconfig'.tsserver.setup {}
   [
   [-- css
   [require 'lspconfig'.cssls.setup {
   [  -- capabilities are the same with the html
   [  capabilities = html_capabilities;
   [}
   [
   [require 'lspconfig'.jdtls.setup {
   [  on_attach = on_attach,
   [  cmd = {
   [
   [    'java',
   [
   [    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
   [    '-Dosgi.bundles.defaultStartLevel=4',
   [    '-Declipse.product=org.eclipse.jdt.ls.core.product',
   [    '-Dlog.protocol=true',
   [    '-Dlog.level=ALL',
   [    '-Xms1g',
   [    --'--add-modules=ALL-SYSTEM',
   [    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
   [    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
   [    --'-javaagent' .. tostring(vim.fn.getenv("LOMBOK_JAR")),
   [    '-jar', jar_path,
   [    '-configuration', config_path,
   [    '-data', workspace_dir,
   [  },
   [  root_dir = function(fname)
   [    for _, patterns in ipairs(my_root_files) do
   [      local root = lspcutil.root_pattern(unpack(patterns))(fname)
   [      if root then
   [       return root
   [      end
   [    end
   [  end,
   [}
   ]]
