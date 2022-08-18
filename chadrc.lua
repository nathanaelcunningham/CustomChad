-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["NvChad/ui"] = {
      tabufline = {
        enabled = false,
      },
    },
    ["williamboman/mason.nvim"] = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "emmet-ls",
        "json-lsp",
        "gofumt",
        "gopls",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
  },
}

M.mappings = require "custom.mappings"

return M
