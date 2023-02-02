local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local options = {
  ensure_installed = {
    "lua",
    "vim",
    "cpp",
    "rust",
    "java",
    "html",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {
      "html"
    },
  },
}


treesitter.setup(options)
