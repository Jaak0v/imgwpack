
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

## Zastosowanie:

W celu pobrania danych należy skorzystać z funkcji `imgw_download`
określając w niej niezbędne parametry:

``` r
imgw_download(typ = '',
              kod = '',
              rok = '',
              path = '')
```

W celu importu danych należy skorzystać z funkcji `imgw_import`:

``` r
Nazwa <- imgw_import(typ = '',
                     kod = '',
                     rok = '',
                     format = '',
                     path = '')
```

Ze względu na strukturę danych zamieszczonych na serwerach IMGW, w
przypadku wykorzystania jednej z opisanych powyżej funkcji dla danych
miesięcznych, nie wykorzystujemy parametru ‘kod’.

W celu wizualizacji danych należy skorzystać z funkcji `imgw_download`:

``` r
imgw_plot(typ = "dobowe",
          dane = ,
          miesiac = ,
          zmienna = "")

imgw_plot(typ = "miesieczne",
          dane = ,
          zmienna = "",
          stacja = "")

imgw_plot(typ = "terminowe",
          dane = ,
          miesiac = ,
          dzien = ,
          zmienna = "",
)
```

## Dostępne rodzaje wykresów

1.  Temperatura

``` r
 zmienna = "temperatura" -> Wykres temperatury
```

2.  Cisnienie

``` r
    zmienna = "cisnienie" -> Wykres cisnienia na poziomie morza i stacji
```

3.  Wiatr

``` r
    zmienna = "predkosc_wiatru" -> Wykres predkosci wiatru
```

4.  Opad

``` r
    zmienna = "opad" -> Wykres opadu deszczu
```

5.  Zachmurzenie

``` r
    zmienna = "zachmurzenie" -> Wykres zachmurzenia
```

6.  Monogram
