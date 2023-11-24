local cpp_runner = function()
  local current_file = vim.fn.expand '%:p'
  local build_relative_path = vim.fn.finddir('build', current_file .. ';')
  local root_dir = vim.fn.getcwd()
  local build_path = root_dir .. '/' .. build_relative_path
  -- no build dir found, run the file directly
  if build_relative_path == '' then
    return 'cd $dir && g++ -std=c++11 $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt'
  else
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
      return 'cd ' .. build_path .. ' && make && ./' .. target_value
    else
      return 'Error: TARGET not found in Makefile'
    end
  end
end

require('code_runner').setup {
  -- mode = "toggleterm",
  filetype = {
    java = { 'cd $dir &&', 'javac $fileName &&', 'java $fileNameWithoutExt' },
    python = 'python3 -u',
    cpp = cpp_runner,
    rust = 'cd $dir && cargo run',
  },
}
