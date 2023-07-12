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
    ['0_hard'] = { '#273038', 232 },
    ['0']      = { '#2B333D', 0 },
    ['0_soft'] = { '#2D3742', 232 },
    ['0_dark'] = { '#1D1D28', 232 },
    ['1']      = { '#353D4A', 0 },
    ['2']      = { '#3F4755', 0 },
    ['3']      = { '#454E5D', 0 },
  },
  fg = {
    ['0'] = { '#F8EEE4', 0 },
    ['1'] = { '#F5EADD', 0 },
    ['2'] = { '#EEE3D4', 0 },
  },
  sakura = {
    ['0'] = { '#DC7276', 0 },
    ['1'] = { '#AB555F', 0 },
    ['2'] = { '#FCC588', 0 },
    ['3'] = { '#E58D79', 0 },
  },
  ike = {
    ['0'] = { '#72AA8F', 0 },
    ['1'] = { '#83B78A', 0 },
    ['2'] = { '#B1C699', 0 },
    ['3'] = { '#CFCBA5', 0 },
  },
  kumo = {
    ['0'] = { '#9BBDCC', 0 },
    ['1'] = { '#7C94C1', 0 },
    ['2'] = { '#AFAAE0', 0 },
    ['3'] = { '#7C71B3', 0 },
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
