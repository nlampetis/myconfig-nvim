local jdtls = require('jdtls')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir_temp = "\\workspace\\" .. project_name

--local lspcutil = require 'lspconfig.util'
local my_root_files = {
  -- Single-module projects
  {
    '.vscode',
    '.git', -- git
    'build.xml', -- Ant
    'pom.xml', -- Maven
    'settings.gradle', -- Gradle
    'settings.gradle.kts', -- Gradle
    'haha.txt',
  },
  -- Multi-module projects
  { 'build.gradle', 'build.gradle.kts' },
}

local jdtls_env = os.getenv('JDTLS_HOME')
local java_debug_env = os.getenv('JDEBUG_HOME')
local lombok_jar = os.getenv('LOMBOK_JAR')
local jar_path = jdtls_env .. '\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local lombok_path = lombok_jar .. '\\lombok.jar'
local workspace_dir = jdtls_env .. workspace_dir_temp
local config_path = jdtls_env .. '\\config_win'

local config = {
  cmd = {

    'java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    --'--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. lombok_path,
    '-jar', jar_path,
    '-configuration', config_path,
    '-data', workspace_dir,
  },
  init_options = {
    bundles = {
      vim.fn.glob(java_debug_env)
    }
  },
  root_dir = require('jdtls.setup').find_root(my_root_files),
  --root_dir = function(fname)
    --for _, patterns in ipairs(my_root_files) do
      --local root = lspcutil.root_pattern(unpack(patterns))(fname)
      --if root then
       --return root
      --end
    --end
  --end,
  on_attach = function(_, bufnr)
    --require('plugins.lsp').on_attach()

    jdtls.setup_dap({hotcodereplace = 'auto'})
    jdtls.setup.add_commands()
    local opts = { silent = true, buffer = bufnr }
    vim.keymap.set('n', "<A-o>", jdtls.organize_imports, opts)
    vim.keymap.set('n', "<leader>edf", jdtls.test_class, opts)
    vim.keymap.set('n', "crv", jdtls.extract_variable, opts)
    vim.keymap.set('v', 'crm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
    vim.keymap.set('n', "crc", jdtls.extract_constant, opts)

    print(vim.fn.glob.java_debug_path .. 'for FUCKS SAKE')
    -- these are for dap
    vim.keymap.set('n', '<leader>dn', jdtls.test_nearest_method, opts)
  end --end,
}


jdtls.start_or_attach(config);

--[[
   [local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
   [local workspace_dir = "%JDTLS_HOME%/workspace/" .. project_name
   [-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
   [local config = {
   [  -- The command that starts the language server
   [  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
   [  cmd = {
   [
   [    -- 💀 --DONE
   [    'java', -- or '/path/to/java17_or_newer/bin/java'
   [    -- depends on if `java` is in your $PATH env variable and if it points to the right version.
   [
   [    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
   [    '-Dosgi.bundles.defaultStartLevel=4',
   [    '-Declipse.product=org.eclipse.jdt.ls.core.product',
   [    '-Dlog.protocol=true',
   [    '-Dlog.level=ALL',
   [    '-Xms1g',
   [    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
   [    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
   [
   [    -- 💀 --DONE
   [    '-jar', 'C:\\Users\\tet_voithos_4\\AppData\\Local\\nvim-data\\lsp_servers\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
   [    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
   [    -- Must point to the                                                     Change this to
   [    -- eclipse.jdt.ls installation                                           the actual version
   [
   [
   [    -- 💀 --DONE
   [    '-configuration', '%JDTLS_HOME%/config_win',
   [    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
   [    -- Must point to the                      Change to one of `linux`, `win` or `mac`
   [    -- eclipse.jdt.ls installation            Depending on your system.
   [
   [
   [    -- 💀
   [    -- See `data directory configuration` section in the README
   [    '-data', workspace_dir
   [  },
   [
   [  -- 💀
   [  -- This is the default if not provided, you can remove it. Or adjust as needed.
   [  -- One dedicated LSP server & client will be started per unique root_dir
   [  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
   [
   [  -- Here you can configure eclipse.jdt.ls specific settings
   [  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
   [  -- for a list of options
   [  settings = {
   [    java = {
   [    }
   [  },
   [
   [  -- Language server `initializationOptions`
   [  -- You need to extend the `bundles` with paths to jar files
   [  -- if you want to use additional eclipse.jdt.ls plugins.
   [  --
   [  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
   [  --
   [  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
   [  init_options = {
   [    bundles = {}
   [  },
   [}
   [-- This starts a new client & server,
   [-- or attaches to an existing client & server depending on the `root_dir`.
   [require('jdtls').start_or_attach(config)
   ]]
