
<!-- README.md is generated from README.Rmd. Please edit that file -->
togglvis
========

<!-- badges: start -->
<!-- badges: end -->
Installation
------------

You can install the latest version of togglvis from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("remotes")
remotes::install_github("karissawhiting/togglvis")
```

Example
-------

This is a basic example showing how to get data from the [{togglr}](https://github.com/ThinkR-open/togglr) API and process and visualize it.

You will need to set up an account on [toggl](https://toggl.com/) and get an API token. See [{togglr}](https://github.com/ThinkR-open/togglr) for easy instructions on how to set API key.

Note: You can also download data as a csv directly from the [toggl](https://toggl.com/).

``` r
library(togglvis)
library(dplyr)
library(togglr)
```

Get summary report data using [{togglr}](https://github.com/ThinkR-open/togglr) app, or download data from toggl web browser.

``` r
# See togglr documentation for how to set up the API key
report <- togglr::get_detailled_report()
```

``` r
processed_report <- process_report(report)
time_bar_chart(processed_report)
```

<img src="man/figures/README-cars-1.png" width="80%" />
