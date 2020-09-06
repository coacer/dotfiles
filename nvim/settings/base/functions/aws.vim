" デフォルトで使用する値設定
let g:AWSDefaultProfile = 'default'
let g:AWSDefaultRegion  = 'ap-northeast-1'

" キャッシュ用変数
let g:AWSS3BucketCache     = ''
let g:AWSS3TargetPathCache = ''

" S3にコピー
" args: バケット名, ファイル名, 転送先パス
function! s:aws_s3_cp() abort
  echo 'Start copying'

  if empty(g:AWSS3BucketCache)
    while empty(bucket)
      let bucket = input('Please input bucket name > ')
    endwhile
  else
    let bucket = input('Please input bucket name [' .  g:AWSS3BucketCache . '] > ')
    if empty(bucket)
      let bucket = g:AWSS3BucketCache
    else
      let g:AWSS3BucketCache = bucket
    endif
  endif

  let file = input('Please input file name [default: current buffer file] > ')
  let file = empty(file) ? expand('%') : file

  if empty(g:AWSS3TargetPathCache)
    while empty(path)
      let path = input('Please input path > ')
    endwhile
  else
    let path = input('Please input path [' . g:AWSS3TargetPathCache . '] > ')
    if empty(path)
      let path = g:AWSS3TargetPathCache
    else
      let g:AWSS3TargetPathCache = path
    endif
  endif

  call system('aws --profile ' . g:AWSDefaultProfile . ' --region ' . g:AWSDefaultRegion . ' s3 cp ' . file . ' s3://' . bucket . '/' . path)
endfunction
