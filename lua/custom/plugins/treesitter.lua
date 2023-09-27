
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     version = false, -- last release is way too old and doesn't work on Windows
--     build = ":TSUpdate",
--     event = { "BufReadPost", "BufNewFile" },
--     opts = {
--       ensure_installed = {
--         "bash",
--         "html",
--         "javascript",
--         "json",
--         "lua",
--         "markdown",
--         "markdown_inline",
--         "python",
--         "query",
--         "regex",
--         "tsx",
--         "typescript",
--         "vim",
--         "yaml",
--         "php",
--         "scss",
--         "cpp",
--         "java",
--         "graphql",
--       },
--       highlight = { enable = true },
--       indent = { enable = true, disable = { "yaml", "python", "html" } },
--       context_commentstring = { enable = true },
--       rainbow = {
--         enable = false,
--         query = "rainbow-parens",
--         disable = { "jsx", "html" },
--       },
--     },
--     config = function(_, opts)
--       require("nvim-treesitter.configs").setup(opts)
--     end,
--   },
--
--   {
--     "HiPhish/nvim-ts-rainbow2",
--     event = "BufReadPost",
--   },
--
--   {
--     "windwp/nvim-ts-autotag",
--     ft = {
--       "html",
--       "javascript",
--       "typescript",
--       "javascriptreact",
--       "typescriptreact",
--       "svelte",
--       "vue",
--       "tsx",
--       "jsx",
--       "rescript",
--       "xml",
--       "php",
--       "markdown",
--       "glimmer",
--       "handlebars",
--       "hbs",
--     },
--     opts = {
--       enable = true,
--       filetypes = {
--         "html",
--         "javascript",
--         "typescript",
--         "javascriptreact",
--         "typescriptreact",
--         "svelte",
--         "vue",
--         "tsx",
--         "jsx",
--         "rescript",
--         "xml",
--         "php",
--         "markdown",
--         "glimmer",
--         "handlebars",
--         "hbs",
--       },
--     },
--   },
-- }
--
return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
        -- init = function()
        --   -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        --   local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
        --   local opts = require("lazy.core.plugin").values(plugin, "opts", false)
        --   local enabled = false
        --   if opts.textobjects then
        --     for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
        --       if opts.textobjects[mod] and opts.textobjects[mod].enable then
        --         enabled = true
        --         break
        --       end
        --     end
        --   end
        --   if not enabled then
        --     require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        --   end
        -- end,
    },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    -----@type TSConfig
    opts = {
      highlight = {
        enable = true,
        ["variable"] = "#FF00FF" ,
        rainbow = {
          enable = true,
          -- disable = { "html", "vue", "tsx", "cpp", "jsx"},
          -- extended_mode = false,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          --extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          --max_file_lines = nil, -- Do not enable for files with more than n lines, int
         -- colors = { "#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#88c0d0", "#5e81ac", "#b48ead" }, -- table of hex strings
          --termcolors = {"#3364FF"} -- table of colour name strings
        },
      },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "html",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "vim",
        "vimdoc",
        'java',
        "yaml",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "sql",
        --"yaml",
        "css",
        --"markdown",
        --"markdown_inline",
        "svelte",
        --"graphql",
        --"bash",
        --"dockerfile",
        "gitignore",
      },

       incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    -----@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
