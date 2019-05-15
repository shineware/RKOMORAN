
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
```
