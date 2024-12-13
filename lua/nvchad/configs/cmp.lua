dofile(vim.g.base46_cache .. "cmp")

local cmp = require "cmp"

local options = {
  completion = { completeopt = "menu,menuone" },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, -- Navigate up with Up arrow
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, -- Navigate down with Down arrow
    ["<Tab>"] = cmp.mapping.confirm { select = true }, -- Accept the selected item
    ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept the selected item
    ['<Esc>'] = function(fallback)
      if cmp.visible() then
        cmp.abort() -- Close the autocomplete menu without selecting anything
      end
      vim.cmd("stopinsert") -- Exit Insert Mode
    end,
    ["<S-Esc>"] = cmp.mapping.complete(), -- Open the autocomplete menu
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return vim.tbl_deep_extend("force", options, require "nvchad.cmp")
