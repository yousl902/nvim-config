return {
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

-- Enable telescope fzf native, if installed
  config = {
    pcall(require('telescope').load_extension, 'fzf'),

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' }),
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' }),
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' }),

    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' }),
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' }),
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' }),
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' }),
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' }),
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' }),
    vim.keymap.set('n', '<leader>sk', "<cmd>Telescope keymaps<cr>", {desc = "Keymaps" }),


    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' }),
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' }),
    --vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' }),
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' }),
  }
}

  -- {
  --   "nvim-telescope/telescope.nvim",
  --   cmd = "Telescope",
  --   version = false, -- telescope did only one release, so use HEAD for now
  --   opts = {
  --     defaults = {
  --       prompt_prefix = "   ",
  --       selection_caret = "  ",
  --       entry_prefix = "   ",
  --       borderchars = {
  --         prompt = Util.generate_borderchars(
  --           "thick",
  --           nil,
  --           { top = "█", top_left = "█", left = "█", right = " ", top_right = " ", bottom_right = " " }
  --         ),
  --         results = Util.generate_borderchars(
  --           "thick",
  --           nil,
  --           { top = "█", top_left = "█", right = " ", top_right = " ", bottom_right = " " }
  --         ),
  --         preview = Util.generate_borderchars("thick", nil, { top = "█", top_left = "█", top_right = "█" }),
  --       },
  --       dynamic_preview_title = true,
  --       hl_result_eol = true,
  --       sorting_strategy = "ascending",
  --       file_ignore_patterns = {
  --         ".git/",
  --         "target/",
  --         "docs/",
  --         "vendor/*",
  --         "%.lock",
  --         "__pycache__/*",
  --         "%.sqlite3",
  --         "%.ipynb",
  --         "node_modules/*",
  --         -- "%.jpg",
  --         -- "%.jpeg",
  --         -- "%.png",
  --         "%.svg",
  --         "%.otf",
  --         "%.ttf",
  --         "%.webp",
  --         ".dart_tool/",
  --         ".github/",
  --         ".gradle/",
  --         ".idea/",
  --         ".settings/",
  --         ".vscode/",
  --         "__pycache__/",
  --         "build/",
  --         "gradle/",
  --         "node_modules/",
  --         "%.pdb",
  --         "%.dll",
  --         "%.class",
  --         "%.exe",
  --         "%.cache",
  --         "%.ico",
  --         "%.pdf",
  --         "%.dylib",
  --         "%.jar",
  --         "%.docx",
  --         "%.met",
  --         "smalljre_*/*",
  --         ".vale/",
  --         "%.burp",
  --         "%.mp4",
  --         "%.mkv",
  --         "%.rar",
  --         "%.zip",
  --         "%.7z",
  --         "%.tar",
  --         "%.bz2",
  --         "%.epub",
  --         "%.flac",
  --         "%.tar.gz",
  --       },
  --       results_title = "",
  --       layout_config = {
  --         horizontal = {
  --           prompt_position = "top",
  --           preview_width = 0.55,
  --           results_width = 0.8,
  --         },
  --         vertical = {
  --           mirror = false,
  --         },
  --         width = 0.87,
  --         height = 0.80,
  --         preview_cutoff = 120,
  --       },
  --     },
  --   },
  --   keys = {
  --     -- goto
  --     { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
  --     { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
  --     { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
  --     -- search
  --     { "sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  --     { "sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  --     { "sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  --     { "sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  --     { "sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  --     { "sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  --     { "sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  --     { "sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  --     { "sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
  --     -- Git
  --     { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  --     { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  --     { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  --     -- Find
  --     -- { "<leader>f",  "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
  --     { "<leader>f", Util.telescope("find_files"), desc = "Find files" },
  --     -- { "<leader>F",  "<cmd>Telescope live_grep<cr>",                           desc = "Find Text" },
  --     { "<leader>F", Util.telescope("live_grep"), desc = "Find Text" },
  --   },
  --   -- config = function() require("tvl.config.telescope") end,
  -- },
  --
  --
