return {
  name = "cmake config",
  builder = function()
    return {
      cmd = { "cmake", "-S", ".", "-B", "cmake-build", "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON", "-GNinja"},
      -- attach a component to the task that will pipe the output to the quickfix.
      -- components customize the behavior of a task.
      -- see :help overseer-components for a list of all components.
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
}
