local M = {}

M.lsp = {
  n = {
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "Hover symbol details",
    },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code Action",
    },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.formatting_sync()
      end,
      "Format Code",
    },
    ["<leader>lh"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "Signature Help",
    },
    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "Rename",
    },
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "Hover diagnostics",
    },
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
    -- dap mappings
    ["<leader>dut"] = {
      function()
        require("dapui").toggle()
      end,
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
    },
    ["<M-8>"] = {
      function()
        require("dap").step_over()
      end,
    },
    ["<M-9>"] = {
      function()
        require("dap").step_into()
      end,
    },
    ["<M-0>"] = {
      function()
        require("dap").step_out()
      end,
    },
    ["<F9>"] = {
      function()
        require("dap").step_over()
      end,
    },
    ["<F10>"] = {
      function()
        require("dap").step_into()
      end,
    },
    ["<F11>"] = {
      function()
        require("dap").step_out()
      end,
    },
  },
}

return M
