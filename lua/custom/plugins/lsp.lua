-- return {
--     -- LSP Configuration & Plugins
--     'neovim/nvim-lspconfig',
--
--     dependencies = {
--       -- Automatically install LSPs to stdpath for neovim
--       { 'williamboman/mason.nvim', config = true },
--       'williamboman/mason-lspconfig.nvim',
--
--       -- Useful status updates for LSP
--       -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
--       { 'j-hui/fidget.nvim', opts = {} },
--
--       -- Additional lua configuration, makes nvim stuff amazing!
--       'folke/neodev.nvim',
--      },
--
--      config = function()
--         vim.g.node_host_prog = "~/.nvm/versions/node/v16.15.0/bin/node"
--         -- [[ Configure LSP ]]
--         --  This function gets run when an LSP connects to a particular buffer.
--         local on_attach = function(_, bufnr)
--           -- NOTE: Remember that lua is a real programming language, and as such it is possible
--           -- to define small helper and utility functions so you don't have to repeat yourself
--           -- many times.
--           --
--           -- In this case, we create a function that lets us more easily define mappings specific
--           -- for LSP related items. It sets the mode, buffer and description for us each time.
--           local nmap = function(keys, func, desc)
--             if desc then
--               desc = 'LSP: ' .. desc
--             end
--
--             vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--           end
--
--           nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--           nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
--           nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--           nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--           nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--           nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--           nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--           nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--           -- See `:help K` for why this keymap
--           nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--           nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
--           -- Lesser used LSP functionality
--           nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--           nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--           nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--           nmap('<leader>wl', function()
--             print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--           end, '[W]orkspace [L]ist Folders')
--
--           -- Create a command `:Format` local to the LSP buffer
--           vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--             vim.lsp.buf.format()
--           end, { desc = 'Format current buffer with LSP' })
--         end
--
--         -- Enable the following language servers
--         --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--         --
--         --  Add any additional override configuration in the following tables. They will be passed to
--         --  the `settings` field of the server config. You must look up that documentation yourself.
--         local servers = {
--           pyright = {
--           -- Server-specific settings. See `:help lspconfig-setup`
--             settings = {
--                 python = {
--                 analysis = {
--                     autoSearchPaths = true,
--                     useLibraryCodeForTypes = true,
--                 },
--                 },
--             },
--           },
--           -- clangd = {},
--           -- gopls = {},
--          --  jdtls = {cmd = {
--          --            'java',
--          --    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--          --    '-Dosgi.bundles.defaultStartLevel=4',
--          --    '-Declipse.product=org.eclipse.jdt.ls.core.product',
--          --    '-Dlog.level=ALL',
--          --    '-Xmx1G',
--          --    '-jar', '/Library/Java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--          --    '-configuration', 'Library/Java/jdt-language-server-1.9.0-202203031534/config_mac',
--          --    '-data', vim.fn.expand('~/.cache/jdtls/workspace/') .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),                      },
--          --  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
--          --  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--          -- },
--           html = {},
--           cssls = {},
--           jsonls = {},
--           --typescript = {},
--           tailwindcss = {},
--           emmet_ls = {filetypes = {
--                            "html", "typescriptreact", "javascriptreact",
--                                  "css", "sass", "scss", "less", "svelte" }},
--
--           -- rust_analyzer = {},
--           tsserver = {},
--           lua_ls = {
--             Lua = {
--               workspace = { checkThirdParty = false },
--               telemetry = { enable = false },
--             },
--           },
--         }
--
--         -- Setup neovim lua configuration
--         require('neodev').setup()
--
--         -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
--         local capabilities = vim.lsp.protocol.make_client_capabilities()
--         capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
--         -- Ensure the servers above are installed
--         local mason_lspconfig = require 'mason-lspconfig'
--
--         mason_lspconfig.setup {
--           ensure_installed = vim.tbl_keys(servers),
--         }
--
--         mason_lspconfig.setup_handlers {
--           function(server_name)
--             require('lspconfig')[server_name].setup {
--               --root_dir = vim.loop.cwd,
--               capabilities = capabilities,
--               on_attach = on_attach,
--               settings = servers[server_name],
--             }
--           end,
--         }
--     end
-- }
return {
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    keys = {
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
      { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
      { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
      { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      {
        "<leader>W",
        function()
          vim.lsp.buf.format({
            filter = function(client)
              -- do not use default `lua_ls` to format
              local exclude_servers = { "lua_ls" }
              return not vim.tbl_contains(exclude_servers, client.name)
            end,
          })
          vim.cmd([[w!]])
        end,
        desc = "Format and Save",
      },
    },
    config = function()
      -- special attach lsp
      require("custom.util").on_attach(function(client, buffer)
        require("config.lsp.navic").attach(client, buffer)
        require("config.lsp.keymaps").attach(client, buffer)
        require("config.lsp.inlayhints").attach(client, buffer)
        require("config.lsp.gitsigns").attach(client, buffer)
        require("config.lsp.python").attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("custom.res.icons").diagnostics) do
        local function firstUpper(s)
          return s:sub(1, 1):upper() .. s:sub(2)
        end
        name = "DiagnosticSign" .. firstUpper(name)
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(require("config.lsp.diagnostics")["on"])

      local servers = require("config.lsp.servers")
      local ext_capabilites = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("custom.util").capabilities(ext_capabilites)

      local function setup(server)
        if servers[server] and servers[server].disabled then
          return
        end
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        require("lspconfig")[server].setup(server_opts)
      end

      local available = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          if not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  -- -- formatters
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = { "mason.nvim" },
  --   config = function()
  --     local null_ls = require("null-ls")
  --     local formatting = null_ls.builtins.formatting
  --     local diagnostics = null_ls.builtins.diagnostics
  --     null_ls.setup({
  --       debug = false,
  --       -- You can then register sources by passing a sources list into your setup function:
  --       -- using `with()`, which modifies a subset of the source's default options
  --       sources = {
  --         formatting.prettier,
  --         formatting.stylua,
  --         formatting.markdownlint,
  --         formatting.beautysh.with({ extra_args = { "--indent-size", "2" } }),
  --         formatting.black,
  --         diagnostics.flake8.with({ extra_args = { "--ignore=E203,E501,E402,F401,F821,W503" }, filetypes = { "python" } }),
  --       },
  --     })
  --   end,
  -- },
  --
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {
  --     ensure_installed = {
  --       "prettier",
  --       "stylua",
  --       "google_java_format",
  --       "black",
  --       "flake8",
  --       "markdownlint",
  --       "beautysh",
  --     },
  --     automatic_setup = true,
  --   },
  -- },

  "mfussenegger/nvim-jdtls",
}

