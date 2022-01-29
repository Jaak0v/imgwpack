#' Funkcja pobiera wybrane dane meteorologiczne z serwerów Instytutu Meteorologii i Gospodarki Wodnej
#'
#' @param typ character
#' @param kod character
#' @param rok integer
#' @param path character
#'
#' @return
#'
#' @examples
#' @export

imgw_download <- function(typ, kod, rok, path) {

  if (typ == "miesieczne")     {

    if(rok >= 1960 && rok <= 1965) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, "1960_1965", "/", "1960_1965_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", "1960_1965", ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", "1960_1965")

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else if (rok >= 1966 && rok <= 1970) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, "1966_1970", "/", "1966_1970_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", "1966_1970", ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", "1966_1970")

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else if (rok >= 1971 && rok <= 1975) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, "1971_1975", "/", "1971_1975_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", "1971_1975", ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", "1971_1975")

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else if (rok >= 1976 && rok <= 1980) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, "1976_1980", "/", "1976_1980_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", "1976_1980", ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", "1976_1980")

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else if (rok >= 1981 && rok <= 1985) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, "1981_1985", "/", "1981_1985_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", "1981_1985", ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", "1981_1985")

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else if (rok >= 1986 && rok <= 1990) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, "1986_1990", "/", "1986_1990_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", "1986_1990", ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", "1986_1990")

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else if (rok >= 1991 && rok <= 1995) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, "1991_1995", "/", "1991_1995_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", "1991_1995", ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", "1991_1995")

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else if (rok >= 1996 && rok <= 2000) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, "1996_2000", "/", "1996_2000_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", "1996_2000", ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", "1996_2000")

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else if(rok >= 2001 && rok <= 2021) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/miesieczne/synop/"
      url2 <- paste0(url, rok, "/", rok, "_m_s.zip")

      # Nazwa pobranych plików
      zip <- paste0(path, "/", rok, ".zip")

      #Utworzenie Folderu
      folder <- paste0(path, "/", 'Miesieczne', "/", rok)

      #Pobieranie
      download.file(url2, zip)

      # Rozpakowanie i usunięcie
      unzip(zipfile = zip, exdir = folder)
      file.remove(zip)

    }

    else {
      "Wprowadzono nieodpowiedni rok"
    }

  }

  else if (typ == "dobowe")     {

    if(rok >= 1960 && rok <= 1965) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, "1960_1965", "/", "1960_1965", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", "1960_1965", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1966 && rok <= 1970) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, "1966_1970", "/", "1966_1970", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", "1966_1970", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1971 && rok <= 1975) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, "1971_1975", "/", "1971_1975", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", "1971_1975", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1976 && rok <= 1980) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, "1976_1980", "/", "1976_1980", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", "1976_1980", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1981 && rok <= 1985) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, "1981_1985", "/", "1981_1985", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", "1981_1985", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1986 && rok <= 1990) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, "1986_1990", "/", "1986_1990", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", "1986_1990", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1991 && rok <= 1995) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, "1991_1995", "/", "1991_1995", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", "1991_1995", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1996 && rok <= 2000) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, "1996_2000", "/", "1996_2000", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", "1996_2000", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if(rok >= 2001 && rok <= 2020) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/dobowe/synop/"
      url2 <- paste0(url, rok, "/", rok, '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Dobowe', "/", rok, "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else {

      "Wprowadzono nieodpowiedni rok"
    }

  }

  else if (typ == "terminowe")     {

    if(rok >= 1960 && rok <= 1965) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, "1960_1965", "/", "1960_1965", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", "1960_1965", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1966 && rok <= 1970) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, "1966_1970", "/", "1966_1970", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", "1966_1970", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1971 && rok <= 1975) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, "1971_1975", "/", "1971_1975", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", "1971_1975", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1976 && rok <= 1980) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, "1976_1980", "/", "1976_1980", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", "1976_1980", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1981 && rok <= 1985) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, "1981_1985", "/", "1981_1985", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", "1981_1985", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1986 && rok <= 1990) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, "1986_1990", "/", "1986_1990", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", "1986_1990", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1991 && rok <= 1995) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, "1991_1995", "/", "1991_1995", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", "1991_1995", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if (rok >= 1996 && rok <= 2000) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, "1996_2000", "/", "1996_2000", '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", "1996_2000", "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else if(rok >= 2001 && rok <= 2020) {

      url <- "https://danepubliczne.imgw.pl/data/dane_pomiarowo_obserwacyjne/dane_meteorologiczne/terminowe/synop/"
      url2 <- paste0(url, rok, "/", rok, '_', kod, "_s.zip")

      #Dodanie nazwy
      zip <- paste0(path, "/", kod, ".zip")

      #Utworzenie folderu z kodem
      folder <- paste0(path, "/", 'Terminowe', "/", rok, "/", kod)

      #Pobranie pliku
      download.file(url2, zip)

      #Rozpakowanie
      unzip(zipfile = zip, exdir = folder)

      #Usunięcie zipa
      file.remove(zip)

    }

    else {

      "Wprowadzono nieodpowiedni rok"
    }

  }

  else {

    "Wprowadzono zly typ danych"

  }

}
