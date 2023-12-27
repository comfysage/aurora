---@class StyleConfig
---@field tabline { reverse: boolean, color: AuroraColor }
---@field search { reverse: boolean, inc_reverse: boolean }
---@field types { italic: boolean, color: AuroraColor }
---@field keyword { italic: boolean, color: AuroraColor }
---@field comment { italic: boolean }
---@field object { color: AuroraColor }
---@field context { color: AuroraColor }
---@field constant { color: AuroraColor }
---@field call { color: AuroraColor }
---@field string { color: AuroraColor }
---@field macro { color: AuroraColor }
---@field annotation { color: AuroraColor }

---@class AuroraTheme
---@field none Color
---@field colors AuroraColors
---@field base { fg: Color, bg: Color }
---@field bg Color
---@field fg Color
---@field bg0 Color
---@field bg1 Color
---@field bg2 Color
---@field bg3 Color
---@field fg0 Color
---@field fg1 Color
---@field fg2 Color
---@field sakura  Color
---@field sage    Color
---@field sukai   Color
---@field shinme  Color
---@field sakaeru Color
---@field taiyo Color
---@field seiun   Color
---@field ike     Color
---@field syntax AuroraSyntax
---@field style StyleConfig
---@field sign Color
---@field comment Color
---@field bg_accent Color

---@class AuroraSyntax
---@field keyword Color
---@field object Color
---@field type Color
---@field context Color
---@field constant Color
---@field call Color
---@field string Color
---@field macro Color
---@field annotation Color

local M = {}

---@param colors AuroraColors
---@param config AuroraConfig
---@return AuroraTheme
function M.setup(colors, config)
  local theme   = {}

  theme.none    = { 'NONE', 0 }
  theme.colors  = colors

  theme.bg      = theme.none
  if not config.transparent_background then
    theme.bg = colors.bg0
    if config.contrast_dark == 'hard' then
      theme.bg = colors.bg0_hard
    end
    if config.contrast_dark == 'soft' then
      theme.bg = colors.bg0_soft
    end
  end
  theme.base    = { fg = colors.bg0, bg = theme.bg }
  theme.fg      = colors.fg0

  theme.bg0     = colors.bg0
  theme.bg1     = colors.bg1
  theme.bg2     = colors.bg2
  theme.bg3     = colors.bg3

  theme.fg0     = colors.fg1
  theme.fg1     = colors.fg0
  theme.fg2     = colors.fg2

  local sign_colors = { soft = theme.bg3 }
  theme.sign      = sign_colors[config.contrast_dark] or theme.none
  theme.comment   = theme.fg2
  theme.bg_accent = theme.bg2

  theme.ike     = colors.aqua
  theme.shinme  = colors.green
  theme.sakura  = colors.red
  theme.taiyo   = colors.orange
  theme.sakaeru = colors.yellow
  theme.sukai   = colors.blue
  theme.sage    = colors.aqua
  theme.seiun   = colors.purple
  theme.pink    = colors.pink

  theme.syntax  = {
    keyword    = colors[config.style.keyword.color or 0] or theme.sakura,
    object     = colors[config.style.object.color or 0] or theme.fg1,
    type       = colors[config.style.types.color or 0] or theme.taiyo,
    context    = colors[config.style.context.color or 0] or theme.fg0,
    constant   = colors[config.style.constant.color or 0] or theme.pink,
    call       = colors[config.style.call.color or 0] or theme.sukai,
    string     = colors[config.style.string.color or 0] or theme.shinme,
    macro      = colors[config.style.macro.color or 0] or theme.taiyo,
    annotation = colors[config.style.annotation.color or 0] or theme.sakura,
  }

  theme.style = {
    search = { reverse = true }
  }
  theme.style = vim.tbl_deep_extend('force', theme.style, config.style)

  return theme
end

return M
