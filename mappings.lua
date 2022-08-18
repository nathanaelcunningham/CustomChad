local M = {}

M.lsp = {
  n = {
    ["K"] = { "vim.lsp.buf.hover()", "Hover symbol details" },
    ["<leader>la"] = { "vim.lsp.buf.code_action()", "Code Action" },
    ["<leader>lf"] = { "vim.lsp.buf.formatting_sync()", "Format Code" },
    ["<leader>lh"] = { "vim.lsp.buf.signature_help()", "Signature Help" },
    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "Rename",
    },
    ["<leader>ld"] = { "vim.diagnostic.open_float()", "Hover diagnostics" },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      desc = "Previous diagnostic",
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      desc = "Next diagnostic",
    },
    ["<leader>dut"] = {function() require("dapui").toggle() end}
  },
}

return M
