local theme = require 'aurora.colors'.setup {}

local colors = {
  normal = theme.syntax.constant[1],
  insert = theme.syntax.call[1],
  visual = theme.syntax.type[1],

  fg0 = theme.fg0[1],
  fg1 = theme.fg1[1],
  fg2 = theme.fg2[1],
  base = {
    fg = theme.base.fg[1],
    bg = theme.base.bg[1],
  },
  bg1 = theme.bg1[1],
  bg2 = theme.bg2[1],
}

local aurora = {}

aurora.normal = {
  a = { fg = colors.base.fg, bg = colors.normal },
  b = { bg = colors.bg2, fg = colors.normal },
  c = { bg = colors.base.bg, fg = colors.fg2 },
}

aurora.insert = {
  a = { fg = colors.base.fg, bg = colors.insert },
  b = { bg = colors.bg2, fg = colors.insert },
}

aurora.command = aurora.normal

aurora.visual = {
  a = { fg = colors.base.fg, bg = colors.visual },
  b = { bg = colors.bg2, fg = colors.visual },
}

aurora.replace = aurora.insert

aurora.inactive = {
  a = { bg = colors.base.bg, fg = colors.fg2 },
  b = { bg = colors.base.bg, fg = colors.fg2 },
  c = { bg = colors.base.bg, fg = colors.fg2 },
}

return aurora
