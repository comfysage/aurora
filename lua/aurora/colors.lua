---@class Color { [1]: string, [2]: number }

---@alias NeutralColor '0_hard' | '0' | '0_soft' | '1' | '2' | '3' | '4'
---@alias NeutralColors { [NeutralColor]: Color }

---@alias AccentColor '0' | '1' | '2' | '3'
---@alias AccentColors { [AccentColor]: Color }

---@class AuroraColors
---@field bg NeutralColors
---@field fg NeutralColors
---@field sakura AccentColors
---@field ike AccentColors
---@field kumo AccentColors

---@type AuroraColors
_G.aurora_colors = {
  bg = {
    ['0_hard'] = { '#2A2A33', 232 },
    ['0']      = { '#292D36', 232 },
    ['0_soft'] = { '#2D2D3D', 232 },
    ['0_dark'] = { '#1D1D28', 232 },
    ['1'] = { '#2E333D', 238 },
    ['2'] = { '#3A404D', 238 },
    ['3'] = { '#454C5C', 238 },
  },
  fg = {
    ['0'] = { '#EBE9D8', 231 },
    ['1'] = { '#E3E0CA', 231 },
    ['2'] = { '#D5D2BA', 231 },
  },
  sakura = {
    ['0'] = { '#AD8DBD', 136 },
    ['1'] = { '#A4B992', 130 },
    ['2'] = { '#EBCD92', 124 },
    ['3'] = { '#D69885', 00 },
    ['4'] = { '#BF6F76', 00 },
  },
  ike = {
    ['0'] = { '#7C9FBC', 68 },
    ['1'] = { '#8FBCAB', 67 },
    ['2'] = { '#8FBC9B', 66 },
    ['3'] = { '#99B58B', 65 },
  },
  kumo = {
    ['0'] = { '#A1C3CC', 0 },
    ['1'] = { '#ABADD0', 0 },
    ['2'] = { '#AD8DBD', 0 },
    ['3'] = { '#AF6672', 0 },
  },
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
