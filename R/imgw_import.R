#' Funkcja importuje pobrane dane do srodowiska R
#'
#'
#'
#' @param typ character
#' @param rok integer
#' @param kod character
#' @param format character
#' @param path character
#'
#' @return dataframe
#'
#'
#' @section Dane dobowe:
#' \describe{
#'   \item{Kod}{Indywidualny kod stacji}
#'   \item{NOS}{Srednie dobowe zachmurzenie ogolne (oktanty)}
#'   \item{FWS}{Srednia dobowa predkosc wiatru (m/s)}
#'   \item{STD}{Srednia dobowa temperatura (℃)}
#'   \item{CPW}{Srednie dobowe cisnienie pary wodnej (hPa)}
#'   \item{WLGS}{Srednia dobowa wilgotnosc wzgledna (%)}
#'   \item{PPPS}{Srednie dobowe cisnienie na poziomie stacji (hPa)}
#'   \item{PPPM}{Srednie dobowe cisnienie na poziomie morza (hPa)}
#'   \item{WODZ}{Suma opadu dzien (mm)}
#'   \item{WONO}{Suma opadu noc (mm)}
#'   \item{STATUS}{Status "8" = brak pomiaru a Status "9" = brak zjawiska}
#'   }
#' @section Dane miesieczne:
#' \describe{
#'   \item{Kod}{Indywidualny kod stacji}
#'   \item{NOS}{Srednie miesieczne zachmurzenie ogolne (oktanty)}
#'   \item{FWS}{Srednia miesieczne predkosc wiatru (m/s)}
#'   \item{TEMP}{Srednia miesieczna temperatura (℃)}
#'   \item{CPW}{Srednie miesieczne cisnienie pary wodnej (hPa)}
#'   \item{WLGS}{Srednia miesieczna wilgotnosc wzgledna (%)}
#'   \item{PPPS}{Srednie miesieczne cisnienie na poziomie stacji (hPa)}
#'   \item{PPPM}{Srednie miesieczne cisnienie na poziomie morza (hPa)}
#'   \item{WODZ}{Suma opadu dzien (mm)}
#'   \item{WONO}{Suma opadu noc (mm)}
#'   \item{STATUS}{Status "8" = brak pomiaru a Status "9" = brak zjawiska}
#' }
#' @section Dane terminowe:
#' \describe{
#'   \item{HPOD}{Wysokosc podstawy chmur}
#'   \item{HPON}{Wysokosc podstawy nizszej}
#'   \item{HPOW}{Wysokosc podstawy wyzszej}
#'   \item{WPT}{Wysokosc podstawy tekstowy}
#'   \item{PPn}{Pomiar przyrzadem 1 (nizsza)}
#'   \item{PPw}{Pomiar przyrzadem 2 (wyzsza)}
#'   \item{WID}{Widzialnosc (kod)}
#'   \item{WIDO}{Widzialnosc operatora (m)}
#'   \item{WIDA}{Widzialnosc automat (m)}
#'   \item{NOG}{Zachmurzenie ogolne (oktanty)}
#'   \item{KRWR}{Kierunek wiatru  (°)}
#'   \item{FWR}{Predkosc wiatru  (m/s) }
#'   \item{PORW}{Poryw wiatru (m/s)}
#'   \item{STD}{Temperatura powietrza (°C)}
#'   \item{TTZW}{Temperatura termometru zwilzonego (°C)}
#'   \item{WW}{Wskaznik wentylacji (W/N)}
#'   \item{WL}{Wskaznik lodu (L/W)}
#'   \item{CPW}{Cisnienie pary wodnej (hPa)}
#'   \item{WLGW}{Wilgotnosc wzgledna (%)}
#'   \item{TPTR}{Temperatura punktu rosy (°C)}
#'   \item{PPPS}{Cisnienie na poziomie stacji (hPa)}
#'   \item{PPPM}{Cisnienie na poziomie morza (hPa)}
#'   \item{Cht}{Charakterystyka tendencji}
#'   \item{App}{Wartosc tendencji}
#'   \item{WO6G}{Opad za 6 godzin (mm)}
#'   \item{ROPT}{Rodzaj opadu za 6 godzin}
#'   \item{PB}{Pogoda biezaca}
#'   \item{PU}{Pogoda ubiegla}
#'   \item{CLCM}{Zachmurzenie niskie (oktanty)}
#'   \item{CHCL}{Chmury CL}
#'   \item{CHCLT}{Chmury CL tekstem}
#'   \item{CHCM}{Chmury CM}
#'   \item{CHCMT}{Chmury CM tekstem}
#'   \item{CHCH}{Chmury CH}
#'   \item{CHCHT}{Chmury CH tekstem}
#'   \item{SGRN}{Stan gruntu}
#'   \item{DEFI}{Niedosyt wilgotnosci (hPa)}
#'   \item{USLN}{Uslonecznienie}
#'   \item{ROSW}{Wystapienie rosy (0/1)}
#'   \item{PORK}{Poryw maksymalny za okres WW (m/s)}
#'   \item{GWP}{Godzina wystapienia porywu}
#'   \item{MWP}{Minuta wystapienia porywu}
#'   \item{TG05}{Temperatura gruntu -5 (°C)}
#'   \item{TMIN}{Temperatura minimalna za 12 godzin (°C)}
#'   \item{TMAX}{Temperatura maksymalna za 12 godzin (°C)}
#'   \item{TGMI}{Temperatura minimalna przy gruncie za 12 godzin (°C)}
#'   \item{RWSN}{Rownowaznik wodny sniegu (mm/cm)}
#'   \item{PKSN}{Wysokosc pokrywy snieznej (cm)}
#'   \item{HSS}{Wysokosc swiezo spadlego sniegu (cm)}
#'   \item{GRSN}{Wysokosc sniegu na poletku (cm)}
#'   \item{GS}{Gatunek sniegu}
#'   \item{UPK}{Uksztaltowanie pokrywy}
#'   \item{HPRO}{Wysokosc probki (cm)}
#'   \item{CIPR}{Ciezar probki (g)}
#'   \item{STATUS}{Status "8" = brak pomiaru a Status "9" = brak zjawiska}
#'}
#'
#' @details
#'
#' @examples
#'
#'
#' \dontrun{
#' Miesieczne_smt <-imgw_import(typ = "dobowe",
#'                              rok =  2012,
#'                              kod = 105,
#'                              format = "sdt",
#'                              path = "")
#'}
#' @export


imgw_import <- function(typ, rok, kod, format, path) {

  rok <- as.integer(rok)

  if (!is.character(typ) | !is.character(kod) | !is.character(path) | !is.character(format)){
    stopifnot("Wartości argumentów: `typ`,`kod`,`path` i 'format' muszą być typu character")}

  if (typ == "miesieczne")     {

    if (format == "smd") {

      url <- path
      url2 <- paste0(path, "/", "Miesieczne", "/", rok, "/", "s_m_d_", rok, ".csv")

      dane <- read.csv(
        file = url2,
        sep = ','
      )

      smd_miesieczne <- c('Kod', 'Nazwa', 'Rok', 'Miesiac',
                          'TMAX','StatusTMAX',
                          'TMXS','StatusTMXS',
                          'TMIN','StatusTMIN',
                          'TMNS','StatusTMNS',
                          'STM','StatusSTM',
                          'TMNG','StatusTMNG',
                          'SUMM','StatusSUMM',
                          'OPMX','StatusOPMX',
                          'POM',
                          'OOM',
                          'SUUS','StatusSUUS',
                          'PKSN', 'StatusPKSN',
                          'PSDN', 'StatusPSDN',
                          'DESD','StatusDESD',
                          'SNID','StatusSNID',
                          'DSND','StatusDSND',
                          'GRDD','StatusGRDD',
                          'MGLD','StatusMGLD',
                          'ZAMD', 'StatusZAMD',
                          'SADD','StatusSADD',
                          'GOLD','StatusGOLD',
                          'ZAND', 'StatusZAND',
                          'ZAWD','StatusZAWD',
                          'ZMED','StatusZMED',
                          'W10D','StatusW10D',
                          'W15D','StatusW15D',
                          'BURD','StatusBURD',
                          'ROSD','StatusROSD',
                          'SZRD','StatusSZRD')

      names(dane) <- smd_miesieczne

      return(dane)

    }

    if (format == "smt") {

      url <- path
      url2 <- paste0(path, "/", "Miesieczne", "/", rok, "/", "s_m_t_", rok, ".csv")

      dane <- read.csv(
        file = url2,
        sep = ','
      )

      smt_miesieczne <- c('Kod', 'Nazwa', 'Rok', 'Miesiac',
                          'NOS', 'StatusNOS',
                          'FWS', 'StatusFWS',
                          'STM', 'StatusSTM',
                          'CPW', 'StatusCPW',
                          'WLGS', 'StatusWLGS',
                          'PPPS', 'StatusPPPS',
                          'PPPM', 'StatusPPPM',
                          'WODZ', 'StatusWODZ',
                          'WONO', 'StatusWONO')

      names(dane) <- smt_miesieczne

      return(dane)

    }

    else {

      "Wprowadzono nieodpowiedni format. Dane miesieczne wystepuja w formatach 'smd' i 'smt'"

    }

  }

  else if (typ == "dobowe")     {

    if (format == "sdt") {

      url <- path
      url2 <- paste0(path, "/", "Dobowe", "/", rok, "/", kod, "/", "s_d_t_", kod,"_", rok, ".csv")

      dane <- read.csv(
        file = url2,
        sep = ','
      )

      sdt_dobowe <- c('Kod', 'Nazwa', 'Rok', 'Miesiac','Dzien',
                      'NOS', 'StatusNOS',
                      'FWS','StatusFWS',
                      'STD', 'StatusSTD',
                      'CPW', 'StatusCPW',
                      'WLGS','StatusWLGS',
                      'PPPS', 'StatusPPPS',
                      'PPPM', 'StatusPPPM',
                      'WODZ', 'StatusWODZ',
                      'WONO', 'StatusWONO')

      names(dane) <- sdt_dobowe

      return(dane)

    }

    if (format == "sd") {

      url <- path
      url2 <- paste0(path, "/", "Dobowe", "/", rok, "/", kod, "/", "s_d_", kod,"_", rok, ".csv")

      dane <- read.csv(
        file = url2,
        sep = ','
      )

      sd_dobowe <- c('Kod', 'Nazwa', 'Rok', 'Miesiac','Dzien',
                     'TMAX','StatusTMAX',
                     'TMIN','StatusTMIN',
                     'STD','StatusSTD',
                     'TMNG','StatusTMNG',
                     'SMDB','StatusSMDB',
                     'RO',
                     'PKSN','StatusPKSN',
                     'RWSN','StatusRWSN',
                     'USL','StatusUSL',
                     'DESZ','StatusDESZ',
                     'SNEG','StatusSNEG',
                     'DISN','StatusDISN',
                     'GRAD','StatusGRAD',
                     'MGLA','StatusMGLA',
                     'ZMGL','StatusZMGL',
                     'SADZ','StatusSADZ',
                     'GOLO','StatusGOLO',
                     'ZMNI','StatusZMNI',
                     'ZMWS','StatusZMWS',
                     'ZMET', 'StatusZMET',
                     'FF10', 'StatusFF10',
                     'FF15','StatusFF15',
                     'BRZA', 'StatusBRZA',
                     'ROSA', 'StatusROSA',
                     'SZRO', 'StatusSZRO',
                     'DZPS', 'StatusDZPS',
                     'DZBL', 'StatusDZBL',
                     'SG',
                     'IZD', 'StatusIZD',
                     'IZG', 'StatusIZG',
                     'AKTN', 'StatusAKTN')

      names(dane) <- sd_dobowe

      return(dane)

    }

    else {

      "Wprowadzono nieodpowiedni format. Dane dobowe wystepuja w formatach 'sdt' i 'sd'"

    }

  }

  else if (typ == "terminowe")     {

    if (format == "st") {

      url <- path
      url2 <- paste0(path, "/", "Terminowe", "/", rok, "/", kod, "/", "s_t_", kod,"_", rok, ".csv")

      dane <- read.csv(
        file = url2,
        sep = ','
      )

      st_terminowe <- c('Kod', 'Nazwa', 'Rok', 'Miesiac','Dzien', 'Godzina',
                        'HPOD','StatusHPOD',
                        'HPON','StatusHPON',
                        'HPOW','StatusHPOW',
                        'WPT',
                        'PPn',
                        'PPw',
                        'WID','StatusWID',
                        'WIDO','StatusWIDO',
                        'WIDA','StatusWIDA',
                        'NOG','StatusNOG',
                        'KRWR','StatusKRWR',
                        'FWR','StatusFWR',
                        'PORW','StatusPORW',
                        'STD','StatusSTD',
                        'TTZW','StatusTTZW',
                        'WW',
                        'WL',
                        'CPW','StatusCPW',
                        'WLGW','StatusWLGW',
                        'TPTR','StatusTPTR',
                        'PPPS','StatusPPPS',
                        'PPPM','StatusPPPM',
                        'ChT',
                        'APP','StatusAPP',
                        'WO6G','StatusWO6G',
                        'ROPT','StatusROPT',
                        'PB',
                        'PU',
                        'CLCM','StatusCLCM',
                        'CHCL','StatusCHCL',
                        'CHCLT',
                        'CHCM','StatusCHCM',
                        'CHCMT',
                        'CHCH','StatusCHCH',
                        'CHCHT',
                        'SGRN','StatusSGRN',
                        'DEFI','StatusDEFI',
                        'USLN','StatusUSLN',
                        'ROSW','StatusROSW',
                        'PORK','StatusPORK',
                        'GWP',
                        'MWP',
                        'TG05','StatusTG05',
                        'TG10','StatusTG10',
                        'TG20','StatusTG20',
                        'TG50','StatusTG50',
                        'TG100','StatusTG100',
                        'TMIN','StatusTMIN',
                        'TMAX','StatusTMAX',
                        'TGMI','StatusTGMI',
                        'RWSN','StatusRWSN',
                        'PKSN','StatusPKSN',
                        'HSS','StatusHSS',
                        'GRSN','StatusGRSN',
                        'GS',
                        'UPK',
                        'HPRO','StatusHPRO',
                        'CIPR','StatusCIPR')

      names(dane) <- st_terminowe

      return(dane)


    }

    else {

      "Wprowadzono nieodpowiedni format. Dane terminowe wystepuja w formacie 'st'"

    }
  }

  else {

    "Wprowadzono zly typ danych. Poprawne typy to: 'dobowe', 'miesieczne' i 'terminowe'"

  }

}
