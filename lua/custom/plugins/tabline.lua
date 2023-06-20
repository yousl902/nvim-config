return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require'bufferline'.setup{
			options = {
				view = "multiwindow",
				numbers = "none",
				number_style = "",
				mappings = true,
				buffer_close_icon= '',
				modified_icon = '●',
				close_icon = '',
				left_trunc_marker = '',
				right_trunc_marker = '',
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is deduplicated
				tab_size = 18,
				diagnostics = false,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = 'id',
	offsets = {
          {
            filetype = "neo-tree",
            text = "EXPLORER",
            text_align = "center",
            separator = true, -- set to `true` if clear background of neo-tree
          },
          {
            filetype = "NvimTree",
            text = "EXPLORER",
            text_align = "center",
            -- separator = true,
          },
        },
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
			}
		}
  end
}
--You need to be using termguicolors for this plugin to work, as it reads the hex gui color values of various highlight groups.
