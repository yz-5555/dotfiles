local add = vim.pack.add
local later = Config.later

later(function()
    add({ 'https://github.com/kvrohit/rasmus.nvim' })

    -- vim.g.rasmus_variant = "monochrome"
    vim.g.rasmus_italic_functions = false
    vim.g.rasmus_italic_comments = false
    vim.g.rasmus_italic_keywords = false
    vim.g.rasmus_italic_variables = false
    vim.g.rasmus_italic_booleans = false

    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'rasmus',
        callback = function()
            local variants = require('rasmus.colors')
            local cfg = require('rasmus.config').config
            local c = variants[cfg.variant]
            local hl = function(name, val)
                vim.api.nvim_set_hl(0, name, val)
            end

            -- :Inspect or :InspectTree to see these tokens.

            hl('Delimiter', { fg = c.gray06 })

            -- C/C++
            hl('Function', { fg = c.blue })

            hl('@variable.c', { fg = c.white })
            hl('@lsp.type.variable.c', { fg = c.white })
            hl('@lsp.type.variable.cpp', { fg = c.white })
            hl('@variable.parameter.c', { fg = c.bright_white })
            hl('@variable.parameter.cpp', { fg = c.bright_white })

            hl('Type', { italic = false })
            hl('Identifier', { fg = c.bright_white })
            hl('Macro', { bold = true, italic = false })
            hl('Special', { fg = c.bright_magenta, italic = false })
            hl('Keyword', { fg = c.bright_magenta })
            hl('@type.c', { fg = c.bright_yellow })
            hl('@type.cpp', { fg = c.bright_yellow })

            -- Go
            hl('@type.definition.go', { fg = c.bright_yellow })
            hl('@type.go', { fg = c.bright_yellow })
            hl('@constant.builtin.go', { fg = c.bright_green })
            hl('@module.go', { fg = c.yellow })

            -- Rust
            hl('@type.rust', { fg = c.bright_yellow })
            hl('@constant.builtin.rust', { fg = c.bright_green })
            hl('@module.rust', { fg = c.yellow, force = true })
            hl('@lsp.type.namespace.rust', { fg = c.yellow, force = true })
            hl('@function.macro.rust', { fg = c.blue })
            hl('@lsp.type.macro.rust', { fg = c.blue })
            hl('@variable.rust', { fg = c.white })
            hl('@lsp.type.variable.rust', { fg = c.white })

            -- lua
            hl('@constructor.lua', { fg = c.blue, italic = false })

            -- diagnostics
            hl('DiagnosticUnderlineError', { fg = c.red, undercurl = true })
            hl('DiagnosticUnderlineWarn', { fg = c.yellow, undercurl = true })
            hl('DiagnosticUnderlineInfo', { fg = c.blue, undercurl = true })
            hl('DiagnosticUnderlineHint', { fg = c.cyan, undercurl = true })
        end,
    })
    vim.cmd([[colorscheme rasmus]])
end)
