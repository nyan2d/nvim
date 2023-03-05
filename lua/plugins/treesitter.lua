require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "go", "javascript", "python", "html", "css" },
  sync_install = false,
  ignore_install = { "cpp" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
