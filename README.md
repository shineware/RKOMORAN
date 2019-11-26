
<!-- README.md is generated from README.Rmd. Please edit that file -->
RKOMORAN
========

<!-- badges: start -->
<!-- badges: end -->
The goal of RKOMORAN is to ...

Installation
------------

You can install the beta version of RKOMORAN using devtools

``` r
# install.packages("devtools")
library(devtools)

devtools::install_github("shineware/RKOMORAN")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(RKOMORAN)

komoran <- RKOMORAN::RKOMORAN$new(model_type = "STABLE")
komoran$get_plain_text("정신력은 체력이란 외피의 보호 없이는 구호밖에 안된다")
#> [1] "정신력/NNG 은/JX 체력/NNG 이란/JX 외피/NNG 의/JKG 보호/NNG 없이/MAG 는/JX 구호/NNG 밖에/JX 안/NNG 되/XSV ㄴ다/EC"

komoran$get_plain_text("샤인웨어에서는 어떤 활동을 하나요?")
#> [1] "샤인/NNP 웨어/NNG 에서/JKB 는/JX 어떤/MM 활동/NNG 을/JKO 하/VX 나요/EF ?/SF"

komoran$set_user_dic("/home/dennis/user.dic")
#> Please refer https://github.com/shin285/KOMORAN/wiki/Manual
#> [1] "샤인웨어/NNP 에서/JKB 는/JX 어떤/MM 활동/NNG 을/JKO 하/VX 나요/EF ?/SF"

komoran$get_nouns("넌 내게 잘해준 유일한 사람이었어")
[1] "유일한" "사람"

komoran$get_plain_text("내 죽음이 내 삶보다 더 가취 있기를")
[1] "내/NP 죽음/NNG 이/JKS 내/NP 삶/NNG 보다/JKB 더/MAG 가/XPN 취/NNG 있/VV 기/ETN 를/JKO"

komoran$get_morphes_by_tags("내 죽음이 내 삶보다 더 가취 있기를", tags = c("NP", "NNG"))
[1] "내"   "죽음" "내"   "삶"   "취"
```
