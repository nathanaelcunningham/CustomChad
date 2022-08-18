local present, tag = pcall(require, "nvim-ts-autotag")

if not present then
    return
end

return tag.setup()
