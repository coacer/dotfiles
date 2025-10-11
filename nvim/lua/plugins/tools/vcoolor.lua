return {
  "KabbAmine/vCoolor.vim",
  cmd = { "VCoolor", "VCase", "VCoolIns", "ColorPicker" },
  config = function()
    -- vCoolor settings
    vim.g.vcoolor_disable_mappings = 1
    vim.g.vcoolor_lowercase = 1

    -- Create ColorPicker command alias
    vim.api.nvim_create_user_command("ColorPicker", "VCoolor", {})
  end,
}
