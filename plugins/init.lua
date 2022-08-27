return {
  ["ojroques/nvim-osc52"] = {
    config = function()
      require "custom.plugins.nvimOsc"
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["windwp/nvim-ts-autotag"] = {
    config = function()
      require "custom.plugins.nvim-ts-autotag"
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require "custom.plugins.nvim-dap"
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    config = function()
      require "custom.plugins.nvim-dap-ui"
    end,
  },
  ["leoluz/nvim-dap-go"] = {
    config = function()
      require "custom.plugins.nvim-dap-go"
    end,
  },
}
