local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

-- globals must be set prior to requiring nvim-tree to function
--local g = vim.g

-- g.nvim_tree_git_hl = 1
-- g.nvim_tree_highlight_opened_files = 0

--[[g.nvim_tree_show_icons = {]]
--[[folders = 1,]]
--[[files = 1,]]
--[[git = 1,]]
--[[folder_arrows = 1,]]
--[[}]]

--[[g.nvim_tree_icons = {]]
--[[default = "",]]
--[[symlink = "",]]
--[[git = {]]
--[[deleted = "",]]
--[[ignored = "◌",]]
--[[renamed = "➜",]]
--[[staged = "✓",]]
--[[unmerged = "",]]
--[[unstaged = "✗",]]
--[[untracked = "★",]]
--[[},]]
--[[folder = {]]
--[[default = "",]]
--[[empty = "",]]
--[[empty_open = "",]]
--[[open = "",]]
--[[symlink = "",]]
--[[symlink_open = "",]]
--[[arrow_open = "",]]
--[[arrow_closed = "",]]
--[[},]]
--[[}]]


local options = {
  filters = {
    dotfiles = false,
    exclude = { "custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  --ignore_ft_on_setup = { "dashboard" },
  open_on_tab = true,
  hijack_cursor = false,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      -- quit_on_open = true,
      resize_window = true,
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    group_empty            = true,
    highlight_git          = true,
    highlight_opened_files = "none",
    add_trailing           = false,
    root_folder_label      = false,
    indent_markers         = {
      enable = true,
    },
    icons = {
      show = {
        folder = true,
        file = true,
        git = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          staged = "✓",
          unmerged = "",
          unstaged = "✗",
          untracked = "★",
        },
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },

      },
    },
  },
}

local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {clear = true}) -- A global group for all your config autocommands

vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
  group = config_group,
  command = ":NvimTreeToggle",
})

vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
  group = config_group,
  command = ":NvimTreeOpen",
})

nvimtree.setup(options)
