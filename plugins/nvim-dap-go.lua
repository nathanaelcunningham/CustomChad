local present, dgo = pcall(require, "dap-go")

if not present then
  return
end

dgo.setup()
