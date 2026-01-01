vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.go",
  callback = function()
    -- Find the root directory (go.mod or .git)
    local root = vim.fs.dirname(vim.fs.find({ "go.mod", ".git" }, { upward = true })[1])
    if not root then return end

    -- Start gopls client directly
    vim.lsp.start({
      name = "gopls",
      cmd = { "gopls" },
      root_dir = root,
    })
  end,
})
