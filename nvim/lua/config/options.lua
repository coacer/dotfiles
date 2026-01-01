-- Command line mode で使用するシェル(alias読み込みするため)
-- vim.opt.shell = '/bin/zsh -i'

-- 基本設定
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8' -- 保存時の文字コード
vim.opt.fileencodings = 'ucs-bom,utf-8,euc-jp,cp932' -- 読み込み時の文字コードの自動判別. 左側が優先される
vim.opt.fileformats = 'unix,dos,mac' -- 改行コードの自動判別. 左側が優先される
vim.opt.hidden = true -- バッファ保存せずに移動しようとした場合に!をつけなくても移動できる, またargsの移動も隠しファイルにする
vim.opt.undofile = true -- undo履歴をファイルに保存(vim終了時にundo履歴が削除されない)
vim.opt.mouse = 'a' -- マウス有効化
vim.opt.termguicolors = true
vim.opt.pumblend = 40 -- ポップアップメニューの透明度を設定
vim.opt.winblend = 30 -- floating windowsの透明度を設定
vim.cmd('language en_US.UTF-8')

-- タブ・インデント設定
vim.opt.expandtab = true -- タブ入力を複数の空白入力に置き換える
vim.opt.tabstop = 2 -- 画面上でタブ文字が占める幅
vim.opt.softtabstop = 2 -- 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
vim.opt.smartindent = true -- 改行時に前の行の構文をチェックし次の行のインデントを増減する
vim.opt.shiftwidth = 2 -- smartindentで増減する幅

-- 検索設定
vim.opt.ignorecase = true -- 検索パターンに大文字小文字を区別しない
vim.opt.smartcase = true -- 検索パターンに大文字を含んでいたら大文字小文字を区別する

-- その他
vim.opt.inccommand = 'split' -- 文字列置換をインタラクティブに
vim.opt.ttimeoutlen = 50 -- インサートモードからEscの遅延を無くす
vim.opt.virtualedit = 'block' -- 矩形選択でテキストが存在しない箇所も選択出来る

-- UI設定
vim.opt.number = true -- 行番号を表示
-- vim.opt.relativenumber = true -- 相対行番号を表示 (画面描画が重いのでオフに)
vim.opt.cursorline = true -- カーソルラインをハイライト
vim.opt.cursorcolumn = true -- カーソルカラムをハイライト
vim.opt.showmatch = true -- 括弧の対応関係を一瞬表示する
-- カーソルの形状と点滅設定
vim.opt.guicursor =
  "n-v-c:block-blinkon500-blinkoff500," ..
  "i-ci-ve:ver25-blinkon500-blinkoff500"

-- その他の設定
vim.opt.regexpengine = 1 -- @see https://github.com/vim/vim/issues/2712#issuecomment-372968129

-- Autocmds
local basic_group = vim.api.nvim_create_augroup('Basic', { clear = true })

-- ターミナル表示時は番号を表示しない
vim.api.nvim_create_autocmd('TermOpen', {
  group = basic_group,
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.cmd('startinsert')
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = basic_group,
  pattern = 'term://*',
  command = 'startinsert',
})

-- vtlファイルをvelocityとして認識
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = basic_group,
  pattern = '*.vtl',
  callback = function()
    vim.bo.filetype = 'velocity'
  end,
})
