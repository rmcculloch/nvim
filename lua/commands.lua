-- There is no native command for clearing the registries.
vim.cmd[[command! ClearReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]]
-- The other run commands (F5, F6, :RunFile) which output to nvim's terminal can fail with large outputs.
vim.cmd[[command! RunPython :execute('!python -m cProfile % > result.txt') | e result.txt]]
