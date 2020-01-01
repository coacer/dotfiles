let g:comfortable_motion_friction = 800.0 " 摩擦力
let g:comfortable_motion_air_drag = 3.0 " 空気抵抗
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-f> :call comfortable_motion#flick(300)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-300)<CR>
