local compile_commands = {
  c = function(file, output)
    return "gcc '" .. file .. "' -o '" .. output .. "'"
  end,

  cpp = function(file, output)
    return "g++ '" .. file .. "' -o '" .. output .. "'"
  end,

  java = function(file, output)
    return "javac '" .. file .. "'"
  end,
}


local run_commands = {
  c = function(file, output)
    return "'" .. output .. "'"
  end,

  cpp = function(file, output)
    return "'" .. output .. "'"
  end,

  java = function(file, output)
    local dir = vim.fn.expand("%:p:h")
    local classname = vim.fn.expand("%:t:r")

    return "cd '" .. dir .. "' && java " .. classname
  end,
}


vim.api.nvim_create_user_command("Compile", function()
  local filetype = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r")

  local compiler = compile_commands[filetype]

  if compiler == nil then
    print("No compiler configured for " .. filetype)
    return
  end

  local command = compiler(file, output)

  vim.fn.jobstart(command, {
    shell = true,
    stdout_buffered = true,
    stderr_buffered = true,

    on_stderr = function(_, data)
      local errors = {}

      for _, line in ipairs(data) do
        if line ~= "" then
          table.insert(errors, line)
        end
      end

      if #errors > 0 then
        vim.fn.setqflist({}, " ", {
          title = "Compilation Errors",
          lines = errors,
        })

        vim.cmd("copen")
      end
    end,

    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Compiled successfully!", vim.log.levels.INFO)
      else
        vim.notify("Compilation failed!", vim.log.levels.ERROR)
      end
    end,
  })
end, {})


vim.api.nvim_create_user_command("Run", function()
  local filetype = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r")

  local runner = run_commands[filetype]

  if runner == nil then
    print("No runner configured for " .. filetype)
    return
  end

  local command = runner(file, output)

  vim.cmd("split | terminal echo 'Running...' && " .. command)
  vim.cmd("startinsert!")
end, {})
