local present, dap = pcall(require, "dap")

if not present then
  return
end

dap.adapters.go = {
  type = "server",
  port = "${port}",
  enrich_config = function(config, on_config)
    local final_config = vim.deepcopy(config)
    -- check if envFile key exists
    if config["envFile"] then
      -- make sure file is readable
      if vim.fn.filereadable(config["envFile"]) then
        -- set env for each line
        for line in io.lines(config["envFile"]) do
          for k, v in string.gmatch(line, "([%w_]+)=([%w%c%p%z]+)") do
            local value, _ = string.gsub(v, '"', "")
            vim.fn.setenv(k, value)
          end
        end
      end
    end
    on_config(final_config)
  end,
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath "data" .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

dap.configurations.typescript = {
  {
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
  {
    name = "Attach to process",
    type = "node2",
    request = "attach",
    processId = require("dap.utils").pick_process,
  },
}

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
}
require("dap.ext.vscode").load_launchjs(nil, { go = { "go" } })
