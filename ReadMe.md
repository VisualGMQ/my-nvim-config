我的Neovim配置，所有的都使用Lua。

**必须保证neovim版本在0.11以上**

## Windows下Dap配置须知

如果是使用`codelldb`，Windows下需要额外配置环境变量

```
LLDB_USE_NATIVE_PDB_READER=1
```

我不知道这个环境变量会不会影响其他DAP，反正在没配这条之前其他的C++ DAP都无法断点（一断就崩溃）

来源: [reddit](https://www.reddit.com/r/neovim/comments/1eeydfp/solving_codelldb_with_dap_not_picking_up_pdb)
