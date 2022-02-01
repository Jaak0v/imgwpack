
<!-- README.md is generated from README.Rmd. Please edit that file -->

# imgwpack

<!-- badges: start -->
<!-- badges: end -->

Pakiet imgwpack powstał na potrzeby pracy dyplomowej “Opracowanie
pakietu R pozyskiwania, przetwarzania i wizualizacji danych
środowiskowych”. Jego głównym zadaniem jest pobieranie, import oraz
wizualizacja danych dostępnych na serwerach Instytutu Meteorologii i
Gospodarki Wodnej (IMGW).

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
          zmienna = "")
```

## Plik z kodami dla poszczególnych stacji

W celu importu listy kodów do środowiska R należy skorzystać z
polecenia:

``` r
data(kody)
```

## Dostępne rodzaje wykresów

1.  Temperatura

``` r
    zmienna = "temperatura" -> Wykres temperatury
```

2.  Ciśnienie

``` r
    zmienna = "cisnienie" -> Wykres ciśnienia na poziomie morza i stacji
```

3.  Wiatr

``` r
    zmienna = "predkosc_wiatru" -> Wykres prędkości wiatru
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

``` r
    zmienna = "monogram" -> Skumulowany wykres wszystkich parametrów
```

## Przykład zastosowania dla stacji HEL

Poniżej przedstawiono komendy, których użycie spowoduje pobranie, import
oraz wizualizację danych dla stacji meteorologicznej znajdującej się na
Helu.

``` r
imgw_download(typ = "dobowe",
              kod = '135',
              rok = '2012',
              path = "D:/Dane")

Dobowe_HEL <- imgw_import(typ = "dobowe",
                          rok = '2012',
                          kod = '135',
                          format = 'sdt', 
                          path = "D:/Dane")

imgw_plot(typ = "dobowe",
          dane = Dobowe_HEL,
          miesiac = 3,
          zmienna = "monogram")
```
