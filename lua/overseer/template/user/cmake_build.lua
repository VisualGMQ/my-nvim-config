return {
  name = "cmake build",
  builder = function()
    return {
      cmd = { "cmake", "--build", "cmake-build" },
      -- attach a component to the task that will pipe the output to the quickfix.
      -- components customize the behavior of a task.
      -- see :help overseer-components for a list of all components.
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
}
