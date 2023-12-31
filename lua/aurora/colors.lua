---@class Color { [1]: string, [2]: number }

---@alias AuroraColor 'bg0_hard'|'bg0_soft'|'bg0'|'bg1'|'bg2'|'bg3'|'bg4'|'bg5'|'bg_visual'|'bg_red'|'bg_green'|'bg_blue'|'bg_yellow'|'fg0'|'fg1'|'fg2'|'red'|'orange'|'yellow'|'green'|'aqua'|'blue'|'purple'|'pink'
---@alias AuroraColors { [AuroraColor]: Color }

---@type AuroraColors
_G.aurora_colors = {
  bg0_hard    = { "#20222E", 0 },
  bg0         = { "#292C38", 0 },
  bg0_soft    = { "#2E3340", 0 },
  bg1         = { "#323246", 8 },
  bg2         = { "#3E3D53", 8 },
  bg3         = { "#47455D", 8 },
  bg4         = { "#4F4D67", 8 },
  bg5         = { "#5B5977", 8 },
  fg0         = { "#F8EEE4", 7 },
  fg1         = { "#9396B5", 7 },
  fg2         = { "#6C6D89", 7 },
  red         = { "#E57E80", 1 },
  orange      = { "#F09C7D", 11 },
  yellow      = { "#FCC588", 3 },
  green       = { "#C0D6A6", 2 },
  aqua        = { "#A3D6B2", 6 },
  blue        = { "#C9CBFF", 4 },
  purple      = { "#C69FF5", 5 },
  pink        = { "#DDB6F2", 5 },
}

local M = {}

function M.colors()
  return _G.aurora_colors
end

---@param config AuroraConfig?
---@return AuroraTheme
function M.setup(config)
  ---@type AuroraConfig
  config = vim.tbl_extend("force", _G.aurora_config, config or {})
  return require 'aurora.theme'.setup(M.colors(), config)
end

return M
