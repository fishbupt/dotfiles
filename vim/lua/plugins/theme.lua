require('nightfox').setup({
  options = {
    styles = {              -- Style to be applied to different syntax groups
      comments = "bold",    -- Value is any valid attr-list value `:help attr-list`
      functions = "bold",
      keywords = "bold",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")
