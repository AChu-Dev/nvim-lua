local colourscheme1 = "github_dark_high_contrast"
--local colourscheme1 = 'silverhand'
--local colourscheme1 = 'silverhand'
local colourscheme2 = "onehalfdark" -- backup colourscheme


local status_ok = pcall(vim.cmd, "colorscheme " .. colourscheme1)
if not status_ok then
    local status_ok = pcall(vim.cmd, "colorscheme " .. colourscheme2)
    return
end

