local overseer = require("overseer")

return {
        name = "cmake config with Ninja",
        builder = function()
                return {
                        cmd = {"cmake -S . -B cmake-build -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"},
                        components = { { "on_output_quickfix", open = true }, "default" },
                }
        end,
        desc = "cmake config with Ninja",
        tags = {overseer.TAG.BUILD}
}
