runtime! dein/init.vim
runtime! settings/base/*.vim
runtime! settings/lang/init.vim

"      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMTMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
"    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM5>1JMMMMMMMMMMMMMMMMMMMMMP<TMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
"  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM8>>?1lzMMMMMMMMMMMMMMMMMMMMP>;+TMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM8>????1llldMMMMMMMMMMMMMMMMMMb>>>>?HMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMME???????ztttldMMMMMMMMMMMMMMMMMb???>?>?MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXzz????==zlttttOMMMMMMMMMMMMMMMMb?????????MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKuuuuO=====ztttttttdMMMMMMMMMMMMMMb??=???????dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHuuZuuk====zttrrrrrrdMMMMMMMMMMMMMb=========?=MMMMMMMMMM"   ?MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHZZZZZZkzllzrrrrrrrvrwMMMMMMMMMMMMblllll==l===MMMMMMMMM]     ,MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHZZZZZZZXzlzrrrrrrvvvvvMMMMMMMMMMMblllllllllllMMMMMMMMMN,   .dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMNMMMMNMMMMNMMMMNMMMMNMMMMMMM#ZyZyyyyyyyOrrrrvvvvzzzzdMMMMMMMMM@lllllllllllMMMMMMMMMMMMMMMMMMMMMMNMMMMNMMMMNMMMMNMMMMNMMMMN
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM#yyyyyyyyyyXvvvvzzzzzzzuuuMMMMMMMM@tttttttttltMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMFdMMM@=(....?TMMMMMMMMMMMM9=-....,?YMMMM#yyyVyyY=~....._?Ozuuuuul   .MMMMM@rrrtr!   ,tMM_            MMMMMMM#   d@`    ?MB!    .HMMMMM
" MMMMM](M=.MMMMMMMMm.UMMMMMMMM=.gMMMMMMMMm.TMMNVVVVY`.XVVWMNyzA,.uuuuuu<   -MMMM@rrrr{   .rrMM-........    MMMMMMM#     ...   _ ...    MMMMM
" MMMMM] .MMMMMMMMMMMN MMMMMMD gMMMMMMMMMMMM,JMNfff'.XfpffWMMNkuun 1uuuZX.   4MMM@rvr2   .wrrMMMMMMMMMM#    MMMMMMM#    .MMM,   .MMM.   dMMMM
" MMMMM].MMMMMMMMMMMMM_dMMMM# dMMMMMMMMMMMMMN MNppP.XpppppWMMMMRuul wZZZZn    dMM@zzZ`   JvvrMMMMMMMMMM#    MMMMMMM#    MMMM)   MMMM}   JMMMM
" MMMMM].MMMMMMMMMMMMM:JMMMMF.===============!dNpp:.ppppppWMMMMMRuZ.(ZZZZZt   .WM#uz>   ,zzzzMMMMMMMMMM#    MMMMMMM#    MMMM)   MMMM}   JMMMM
" MMMMM].MMMMMMMMMMMMM:JMMMM].NNNNNNNNNNNNNNNNMNpp_(ppbbbbMMMMMMMNZ~,ZZZZyZl   (ySur   .uuuuuMMMMMMMMMM#    MMMMMMM#    MMMM)   MMMM}   JMMMM
" MMMMM].MMMMMMMMMMMMM:JMMMMb.MMMMMMMMMMMMMMMMMNbb|,bbkkbkHMMMMMMMN JZyyyyyy,   zy0   .XuuuuuMMMMMMMMMM#    MMMMMMM#    MMMM)   MMMM}   JMMMM
" MMMMM].MMMMMMMMMMMMM:JMMMMM,JMMMMMMMMMMMMMMMMNkkh.zkkkkkHMMMMMMMt.kyyZyyyyk.  .W\   dZZuuZuMMMMMMMMMM#    MMMMMMM#    MMMM)   MMMM}   JMMMM
" MMMMM].MMMMMMMMMMMMM:JMMMMMM,,HMMMMMMMMMMMMMMNqqkh.?HqqqHMMMMMM^.MMRyyyyyVVh   -   (ZZZZZZZMMMMMMMMMM#    MMMMMMM#    MMMM)   MMMM}   JMMMM
" MMMMM].MMMMMMMMMMMMM:JMMMMMMMN,."WMMMMMY"!.dMNqqqqqn,?TWMMMM9^.dMMMMNyyVVVVfl     .VWyyyyyyMMMMMMMMMM#    MMMMMMM#    MMMM)   MMMM}   JMMMM
" MMMMMNMMMMMMMMMMMMMMNMMMMMMMMMMMMNg+JJggMMMMMNqqqqqmmmmaJJJgMMMMMMMMMNVVffffpkkkXXffffWyyyyMMMMMMMMMMMNNNNMMMMMMMMNNNNMMMMNNNNMMMMNNNNMMMMM
" MMMMMMMMMMMMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmmggggggggMMMMMMMMMMMMMMNWffpppppffffppppWVyyMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNggggggggggMMMMMMMMMMMMMMMNkpppppbpppppppppWfQMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNHg@g@g@@@@MMMMMMMMMMMMMMMMMHpppbbpppppppbbWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNM@@@@@@@MMMMMMMMMMMMMMMMMMNbkkkbpppbbbHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
" MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNM@@@@@MMMMMMMMMMMMMMMMMMMNkkkkbbkkHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
"   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN@H@MMMMMMMMMMMMMMMMMMMMNHqkkkHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
"    MMMMMMMMMMMMMMMNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNHMMMMMMMMMMMMMMMMMMMMMMHkHNMMMMMMMMMMMMMMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
"     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
