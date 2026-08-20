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
                vim.api.nvim_set_hl(0, name .. '.c', val)
                vim.api.nvim_set_hl(0, name .. '.cpp', val)
            end

            -- :Inspect or :InspectTree to see these tokens.
            hl('DiagnosticUnderlineError', { fg = c.red, undercurl = true })
            hl('DiagnosticUnderlineWarn', { fg = c.yellow, undercurl = true })
            hl('DiagnosticUnderlineInfo', { fg = c.blue, undercurl = true })
            hl('DiagnosticUnderlineHint', { fg = c.cyan, undercurl = true })

            hl('Delimiter', { fg = c.gray06 })

            hl('Type', { fg = c.bright_cyan })
            hl('Value', { fg = c.green })
            hl('Constant', { fg = c.bright_green })
            hl('Function', { fg = c.bright_blue })
            hl('Identifier', { fg = c.white })
            hl('SpecialIdentifier', { fg = c.bright_white })
            hl('Keyword', { fg = c.blue })

            hl('Number', { link = 'Value' })
            hl('String', { link = 'Value' })
            hl('Character', { link = 'Value' })
            hl('Boolean', { link = 'Constant' })
            hl('Macro', { link = 'Constant' })
            hl('Special', { link = 'Keyword' })
            hl('SpecialChar', { link = 'Operator' })

            -- C/C++
            hl('@variable', { link = 'Identifier' })
            hl_c_cpp('@keyword.operator', { link = 'Operator' })
            hl_c_cpp('@type.builtin', { link = 'Keyword' })
            hl_c_cpp('@Value.macro', { link = 'Constant' })

            hl_c_cpp('@lsp.type.macro', { link = 'Constant' })
            hl_c_cpp('@lsp.type.enumMember', { link = 'Constant' })
            hl_c_cpp('@lsp.type.property', { link = 'SpecialIdentifier' })
            hl_c_cpp('@lsp.type.type', { link = 'Keyword' })

            -- Go
            hl('@property.go', { link = 'SpecialIdentifier' })
            hl('@module.go', { link = 'SpecialIdentifier' })
            hl('@function.builtin.go', { link = 'Function' })
            hl('@constant.builtin.go', { link = 'Constant' })

            -- Rust
            hl('@lsp.type.macro.rust', { link = 'Function' })

            -- lua
            hl('@constructor.lua', { link = 'Function' })
        end,
    })
    vim.cmd([[colorscheme rasmus]])
end)
