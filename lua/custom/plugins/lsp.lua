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
      {'gi', vim.lsp.buf.implementation, desc = "Goto Implemen"};
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
      ext_capabilites.offsetEncoding = { "utf-16" }
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
  "mfussenegger/nvim-jdtls",
}

