-- setup
require('dap-go').setup()
require('dapui').setup()

-- keymaps
vim.keymap.set("n", "<F5>", ":lua require-dap'.confinue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require-dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require-dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require-dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require-dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require-dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require-dap'.set_breakpoint(nil, nil, vim.fn.input('Log ppoint message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require-dap'.repl.open()<CR>")

