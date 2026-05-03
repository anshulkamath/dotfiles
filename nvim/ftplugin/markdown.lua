-- Honor sembr recommendations: https://sembr.org
vim.opt_local.textwidth = 80
vim.opt_local.colorcolumn = "80"

-- fo=n uses formatlistpat to indent ALL continuation lines of a list item.
-- The built-in markdown ftplugin sets comments=fb:*,fb:-,fb:+ where the 'f'
-- flag means "first line only" -- that's why only the first continuation gets
-- the 2-space indent. Removing fo=c stops the comment-based wrapping logic and
-- cedes control entirely to fo=n + formatlistpat.
vim.opt_local.formatoptions:append("n")
vim.opt_local.formatoptions:remove("c")
vim.opt_local.formatlistpat = [[^\s*[-*+]\s\+\|^\s*\d\+[.)]\s\+]]
vim.opt_local.comments = "n:>"
vim.opt_local.autoindent = true
