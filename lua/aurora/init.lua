local aurora = {}

---@class AuroraConfig
---@field transparent_background boolean
---@field contrast_dark 'hard'|'medium'|'soft'
---@field override_terminal boolean
---@field style StyleConfig
---@field overrides HLGroups

---@type AuroraConfig
aurora.default_config = {
    transparent_background = false,
    contrast_dark = 'medium',
    override_terminal = true,
    style = {
        tabline    = { reverse = true, color = 'blue' },
        search     = { reverse = false, inc_reverse = true },
        types      = { italic  = true },
        keyword    = { italic  = true },
        comment    = { italic  = false },
        object     = {},
        context    = {},
        constant   = {},
        call       = {},
        string     = {},
        macro      = {},
        annotation = {},
    },
    overrides = {},
}

---@type AuroraConfig
_G.aurora_config = vim.tbl_deep_extend("force", aurora.default_config, _G.aurora_config or {})

---@param config AuroraConfig|table
function aurora.setup(config)
    _G.aurora_config = vim.tbl_deep_extend("force", _G.aurora_config, config or {})
end

---@param group string
---@param colors ColorSpec
local function set_hi(group, colors)
    if not vim.tbl_isempty(colors) then
        ---@type vim.api.keyset.highlight
        local color = colors
        color.fg = colors[1] and colors[1][1] or 'NONE'
        color.bg = colors[2] and colors[2][1] or 'NONE'
        color.ctermfg = colors[1] and colors[1][2] or 'NONE'
        color.ctermbg = colors[2] and colors[2][2] or 'NONE'
        color[1] = nil
        color[2] = nil
        vim.api.nvim_set_hl(0, group, color)
    end
end

---@param hlgroups HLGroups
local function set_highlights(hlgroups)
    vim.cmd("highlight Normal guifg=" .. hlgroups.Normal[1][1] .. " guibg=" .. hlgroups.Normal[2][1].. " ctermfg=" .. hlgroups.Normal[1][2] .. " ctermbg=" .. hlgroups.Normal[2][2])
    hlgroups.Normal = nil
    for group, colors in pairs(hlgroups) do
        set_hi(group, colors)
    end
end

function aurora.load(_)
    if vim.g.colors_name then
        vim.cmd('hi clear')
    end
    if vim.g.colors_name == 'aurora' then
        vim.notify("reloading aurora", vim.log.levels.ERROR)
        local module_name_pattern = vim.pesc('aurora')
        local matcher = function(pack)
            return string.find(pack, "^" .. module_name_pattern)
        end
        for pack, _ in pairs(package.loaded) do
            if matcher(pack) then
                package.loaded[pack] = nil
            end
        end
        require 'aurora'.setup (aurora_config)
    end

    vim.g.colors_name = 'aurora'
    vim.o.termguicolors = true

    -- if vim.o.background == 'light' then
    --     _G.aurora_config.theme = 'light'
    -- elseif vim.o.background == 'dark' then
    --     _G.aurora_config.theme = 'default'
    -- end

    local theme = require 'aurora.colors'.setup()
    local hlgroups = require 'aurora.hl.init'.setup(theme, _G.aurora_config)

    set_highlights(hlgroups)
end

function aurora.colors()
    return require 'aurora.colors'.colors()
end

return aurora
