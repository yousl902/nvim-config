-- TODO: fix the debugger for c++
local file_to_debug = function()
  local current_file = vim.fn.expand '%:p'
  local build_relative_path = vim.fn.finddir('build', current_file .. ';')
  local root_dir = vim.fn.getcwd()
  local build_path = root_dir .. '/' .. build_relative_path
  -- no build dir found, run the file directly
  -- if build_relative_path == '' then
  --   return 'cd $dir && g++ -std=c++11 $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt'
  -- else
    -- Read the Makefile to find the TARGET variable
    local makefile_path = build_relative_path .. '/Makefile'
    local makefile = io.open(makefile_path, 'r')
    local target_value = nil
    if makefile then
      for line in makefile:lines() do
        if line:match '^TARGET%s*=' then
          target_value = line:match '= (.+)$'
          break
        end
      end
      makefile:close()
    end

    if target_value then
      -- return 'cd ' .. build_path .. ' && make && ./' .. target_value
      print(build_path)
      return build_path .. '/' .. target_value
    else
      return 'Error: TARGET not found in Makefile'
    end
  end
-- end
-- install codelldb with :MasonInstall codelldb
-- configure nvim-dap (codelldb)
local my_dap = require("user.configs.debbuger")
my_dap.config.on_config_done = function(dap)
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      -- program = function()
      --   local path
      --   vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
      --     path = input
      --   end)
      --   vim.cmd [[redraw]]
      --   return path
      -- end,
      -- cwd = "${workspaceFolder}",
      -- stopOnEntry = false,
      program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    -- program = file_to_debug,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    },
  }

  dap.configurations.c = dap.configurations.cpp
end
