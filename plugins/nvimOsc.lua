local present, osc = pcall(require, "osc52")

if not present then
  return
end

local options = {
  max_length = 0, -- Maximum length of selection (0 for no limit)
  silent = false, -- Disable message on successful copy
  trim = false, -- Trim text before copy
}

osc.setup(options)
