
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bills

<!-- badges: start -->
<!-- badges: end -->

The goal of bills is to easily calculate the additional costs of taxes
and tips when shopping or eating in British Columbia, Canada. The
function PriceBC, within this package, allows to rapidly predict the
final bill at restaurants or shops after accounting for the appropriate
taxes and user-selected tips.

## Installation

bills is not yet on CRAN, but it can be downloaded from this repository
by running the following R command:

``` r
# install.packages("devtools")
devtools::install_github("hans-ghezzi/bills", ref="0.1.0")
```

## Usage

This is a basic example which shows how to use the `PriceBC()` function:

``` r
library(bills)
PriceBC("Sale", PriceTag = 50)
#> [1] "The bill after taxes is: $56"
#> [1] 56
```

This package allows users to specify the service offered, between
Restaurants and Sale, which involve different tax brackets. Choosing the
service “Restaurants” also includes the notorious “Tips”, which are
culturally expected in North America.

``` r
PriceBC(type = "Restaurant", MealBill = 25, Tip = 10, AlcoholBill = 10)
#> [1] "The bill after taxes is: $37.75"
#> [1] "The bill after taxes and tip is: $41.525"
#> [1] 37.750 41.525
```
