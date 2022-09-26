local present, cmp = pcall(require, "cmp")
local lspkind = require('lspkind')

if not present then
   return
end


vim.opt.completeopt = "menuone,noselect"

local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

local cmp_window = require "cmp.utils.window"

function cmp_window:has_scrollbar()
   return false
end

local options = {
    disable_netrw = true,
    hijack_cursor = true,
    --hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = true,
   window = {
      completion = {
         --border = border "CmpBorder",
         --border = "single",
         max_width = 5,
         max_height = 10,
         --winhighlight = ""
      },
      documentation = {
         border = border "CmpDocBorder",
      },
   },
   snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body);
        --local ls = require("luasnip");
        --ls.lsp_expand(args.body)
      end,
   },
   formatting = {
      format =  lspkind.cmp_format({
        --mode = 'symbol_text', -- show only symbol annotations
        maxwidth = 20, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        preset = 'codicons',
        symbol_map = require"plugins.lspkind_icons",
        menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
        })

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        --before = function (_, vim_item)
          --local icons = require "plugins.lspkind_icons"
          -- vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
          --return vim_item
        --end
      })
   },
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Insert,
         select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end, {
         "i",
         "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end, {
         "i",
         "s",
      }),
   },
   sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      -- { name = "buffer" },
      -- { name = "nvim_lua" },
      { name = "path" },
   },
}

cmp.setup(options)
