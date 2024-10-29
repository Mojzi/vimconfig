vim.filetype.add({
    extension = {
        vs = "vs",
        ps = "ps",
        vert = "vert",
        frag = "frag"
    }
})


local util = require('lspconfig.util')
require('lspconfig.configs').slangd = {
    default_config = {
        name = 'slangd',
        cmd = { 'slangd' },
        filetypes = { 'hsls', 'vs', 'glsl', 'ps' },
        root_dir = function(fname)
            return util.find_git_ancestor(fname)
        end
    }
}

require('lspconfig.configs').glsl_analyzer = {
    default_config = {
        cmd = { 'glsl_analyzer' },
        filetypes = { 'glsl', 'vert', 'tesc', 'tese', 'frag', 'geom', 'comp' },
        single_file_support = true,
        root_dir = function(fname)
            return util.find_git_ancestor(fname)
        end,
        capabilities = {},
  }
}


--require('lspconfig.configs').dartls = {
--    default_config = {
--        cmd = {
--            "dart",
--            "language-server",
--            "--protocol=lsp",
--            -- "--port=8123",
--            -- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
--        },
--        filetypes = { "dart" },
--        autostart = true,
--        init_options = {
--            onlyAnalyzeProjectsWithOpenFiles = false,
--            suggestFromUnimportedLibraries = true,
--            closingLabels = true,
--            outline = false,
--            flutterOutline = false,
--        },
--        settings = {
--            dart = {
--                updateImportsOnRename = true,
--                completeFunctionCalls = true,
--                showTodos = true,
--            },
--        },
--    }
--}


local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- lsp.skip_server_setup({'slangd'})


-- lsp.setup_servers({'glsl_analyzer', force = true})

lsp.configure('slangd', { force_setup = true })
lsp.configure('glsl_analyzer', { force_setup = true })
--lsp.configure('dartls', { force_setup = true })
lsp.setup_servers({'dartls',  force = true})


lsp.configure('tsserver', {force_setup = true })

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.confirm({ selected = true })
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "fpr", function() vim.lsp.buf.format() end, opts)

end)

lsp.setup()
