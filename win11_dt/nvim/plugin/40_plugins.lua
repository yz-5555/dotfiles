local add = vim.pack.add
local now_if_args, now, later = Config.now_if_args, Config.now, Config.later

now_if_args(function()
    local ts_update = function() vim.cmd('TSUpdate') end
    Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

    add({
        'https://github.com/nvim-treesitter/nvim-treesitter',
        'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    })

    local languages = {
        "bash",
        "c",
        "cpp",
        'lua',
        'vimdoc',
        'markdown',
        "rust",
        "zig"
    }
    local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
    end
    local to_install = vim.tbl_filter(isnt_installed, languages)
    if #to_install > 0 then require('nvim-treesitter').install(to_install) end

    -- Enable tree-sitter after opening a file for a target language
    local filetypes = {}
    for _, lang in ipairs(languages) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
            table.insert(filetypes, ft)
        end
    end
    local ts_start = function(ev) vim.treesitter.start(ev.buf) end
    Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

now_if_args(function()
    add({ 'https://github.com/neovim/nvim-lspconfig' })

    vim.lsp.enable({
        'lua_ls',
        'clangd',
        'zls',
    })
end)

later(function()
    add({ 'https://github.com/stevearc/conform.nvim' })

    require('conform').setup({
        default_format_opts = {
            lsp_format = 'fallback',
        },
        formatters_by_ft = { lua = { 'stylua' } },
    })
end)
