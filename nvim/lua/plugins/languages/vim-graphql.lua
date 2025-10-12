-- GraphQL syntax
return {
  'jparise/vim-graphql',
  ft = { 'graphql' },
  config = function()
    vim.g.graphql_javascript_tags = { '' }
  end,
}
