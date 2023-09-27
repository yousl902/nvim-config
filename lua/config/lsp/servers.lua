local servers = {
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        inlayHints = true,
      },
    },
  },
clangd = {
      keys = {
        { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      },
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
          "Makefile",
          "configure.ac",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja"
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
          fname
        ) or require("lspconfig.util").find_git_ancestor(fname)
      end,
      capabilities = {
        offsetEncoding = { "utf-16" },
      },
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    },

  cssls = {},
  html = {},
  jsonls = {},
--  sqlls = {},
  intelephense = {}, -- php language server
  jdtls = {
    disabled = true,
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
        misc = {
          parameters = {
            "--log-level=trace",
          },
        },
        format = {
          enable = false,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
            continuation_indent_size = "2",
          },
        },
      },
    },
  },
  tsserver = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  -- python language server
  pyright = {
    settings = {
      python = {
        analysis = {
          indexing = true,
          typeCheckingMode = "basic",
          diagnosticMode = "openFilesOnly",
          autoImportCompletions = false,
          -- autoSearchPaths = false,
          inlayHints = {
            variableTypes = true,
            functionReturnTypes = true,
          },
          useLibraryCodeForTypes = true,
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = "none",
            reportOptionalMemberAccess = "none",
            reportOptionalSubscript = "none",
            reportPrivateImportUsage = "none",
          },
        },
      },
    },
  },
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          jedi_definition = {
            enabled = true,
            follow_imports = true,
            follow_builtin_imports = true,
            follow_builtin_definitions = true,
          },
          jedi_rename = { enabled = true },
          jedi_completion = { enabled = false },
          jedi_hover = { enabled = true },
          pylsp_mypy = {
            enabled = true,
            live_mode = false,
            dmypy = false,
            report_progress = false,
          },
          -- Disabled ones:
          flake8 = { enabled = false },
          mccabe = { enabled = false },
          preload = { enabled = false },
          pycodestyle = { enabled = false },
          pyflakes = { enabled = false },
          pylint = { enabled = false },
          rope = { enabled = false },
          rope_completion = { enabled = false },
          rope_rename = { enabled = false },
          yapf = { enabled = false },
          pylsp_black = { enabled = false },
          pyls_isort = { enabled = false },
          autopep8 = { enabled = false },
        },
      },
    },
  },
}
return servers
