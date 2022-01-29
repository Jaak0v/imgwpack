
<!-- README.md is generated from README.Rmd. Please edit that file -->

# imgwpack

<!-- badges: start -->
<!-- badges: end -->

Pakiet imgwpack powstał na potrzeby pracy dyplomowej “Opracowanie
pakietu R pozyskiwania, przetwarzania i wizualizacji danych
środowiskowych” . Jego głównym zadaniem jest pobieranie, importowanie
oraz wizualizacja danych dostępnych na serwerach Instytutu Meteorologii
i Gospodarki Wodnej (IMGW).

## Proces instalacji pakietu:

``` r
# w razie braku pakietu devtools, należy go zainstalować
if (!require(devtools)) {install.packages("devtools"); require(devtools)}
# instalacja z GitHub (bez winiety)
install_github("Jaak0v/imgwpack")
# instalacja z GitHub (z winietą)
install_github("Jaak0v/imgwpack", force = T, build_vignettes= T)
# lub w razie problemów z komenda install_github
install_git("https://github.com/Jaak0v/imgwpack")
library(imgwpack)
```

## Przyklad zastosowani

This is a basic example which shows you how to solve a common problem:

``` r
library(imgwpack)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
