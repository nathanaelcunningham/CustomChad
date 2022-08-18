-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)

-- local function copy(lines, _)
--   vim.fn.OSCYankString(table.concat(lines, "\n"))
-- end
--
-- local function paste()
--   return {
--     vim.fn.split(vim.fn.getreg "", "\n"),
--     vim.fn.getregtype "",
--   }
-- end

local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = "osc52",
  copy = { ["+"] = copy, ["*"] = copy },
  paste = { ["+"] = paste, ["*"] = paste },
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set("n", "<leader>c", '"+y')
vim.keymap.set("n", "<leader>cc", '"+yy')

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if
      layout[1] == "leaf"
      and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
      and layout[3] == nil
    then
      vim.cmd "confirm quit"
    end
  end,
})

local opt = vim.opt
-- Indenting
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  underline = true,
  signs = true,
})
