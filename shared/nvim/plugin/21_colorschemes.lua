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
            local hl_c_cpp = function(name, val)
                vim.api.nvim_set_hl(0, name + '.c', val)
                vim.api.nvim_set_hl(0, name + '.cpp', val)
            end

            local c_type = c.bright_cyan
            local c_func = c.bright_blue
            local c_const = c.green -- TODO: cyan vs bright_green vs green
            local c_keyword = c.blue

            -- :Inspect or :InspectTree to see these tokens.
            -- diagnostics TODO: bright or not?
            hl('DiagnosticUnderlineError', { fg = c.red, undercurl = true })
            hl('DiagnosticUnderlineWarn', { fg = c.yellow, undercurl = true })
            hl('DiagnosticUnderlineInfo', { fg = c.blue, undercurl = true })
            hl('DiagnosticUnderlineHint', { fg = c.cyan, undercurl = true })

            hl('Delimiter', { fg = c.gray06 })

            hl('Type', { fg = c_type })
            hl('Function', { fg = c_func })
            hl('Identifier', { fg = c.white })
            hl('Macro', { fg = c_const })
            hl('Special', { fg = c_keyword })
            hl('Keyword', { fg = c_keyword })
            
            -- C/C++
            hl_c_cpp('@variable', { fg = c.white })
            hl_c_cpp('@lsp.type.variable', { fg = c.white })
            hl_c_cpp('@lsp.type.parameter', { fg = c.white })
            hl_c_cpp('@type', { fg = c_type })

            -- Go
            hl('@type.definition.go', { fg = c_type })
            hl('@type.go', { fg = c_type })
            hl('@constant.builtin.go', { fg = c_const })

            -- Rust
            hl('@type.rust', { fg = c_type })
            hl('@constant.builtin.rust', { fg = c_const })
            hl('@function.macro.rust', { fg = c_const }) -- not sure Rust macro should be considered as const or func
            hl('@lsp.type.macro.rust', { fg = c_const })
            hl('@variable.rust', { fg = c.white })
            hl('@lsp.type.variable.rust', { fg = c.white })

            -- lua
            hl('@constructor.lua', { fg = c.blue })
        end,
    })
    vim.cmd([[colorscheme rasmus]])
end)
