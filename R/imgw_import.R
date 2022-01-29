#' Funckja importuje pobrane dane do środowiska R
#'
#' @param typ character
#' @param rok integer
#' @param kod character
#' @param format character
#' @param path character
#'
#' @return
#' @export
#'
#' @examples
imgw_import <- function(typ, rok, kod, format, path) {

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
  }

  else {

    "Wprowadzono zly typ danych"

  }

}
