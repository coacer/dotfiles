-- Icons
return {
  'ryanoasis/vim-devicons',
  'nvim-tree/nvim-web-devicons',
  {
    'tiagofumo/vim-nerdtree-syntax-highlight',
    config = function()
      vim.g.NERDTreeLimitedSyntax = 1
    end,
  },
}
