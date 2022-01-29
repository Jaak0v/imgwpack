#' Funkcja wizualizuje wybrane dane w postaci wykresu
#'
#' @param typ character
#' @param dane character
#' @param miesiac integer
#' @param zmienna character
#' @param stacja character
#' @param dzien integer
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' imgw_plot(typ = "miesieczne",
#'           dane = '',
#'           #miesiac = 5,
#'           zmienna = "cisnienie",
#'           stacja = "Zakopane")
#' }
#' @examples
imgw_plot <- function(typ, dane, miesiac, zmienna, stacja, dzien) {

  if (typ == "miesieczne")     {

    if(zmienna == "temperatura")  {

      ggplot(data=dane[dane[,2] == stacja,],
             aes(x=`Miesiac`, y=`STM`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        ggtitle("Roczny rozklad temperatury") +
        labs(x = "Miesiac",
             y = "Temperatura [??C]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="red", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "cisnienie") {

      ggplot(data=dane[dane[,2] == stacja,]) +
        geom_line(aes(x=`Miesiac`, y=`PPPS`, color = "red")) +
        geom_line(aes(x=`Miesiac`, y=`PPPM`, color = "blue")) +
        geom_point(aes(x=`Miesiac`, y=`PPPS`, color = "red")) +
        geom_point(aes(x=`Miesiac`, y=`PPPM`, color = "blue")) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        scale_color_identity(name = "Poziom odniesienia",
                             breaks = c("red", "blue"),
                             labels = c("Poziom stacji", "Poziom morza"),
                             guide = "legend") +
        ggtitle("Roczny rozklad cisnienia") +
        labs(x = "Miesiac",
             y = "Cisnienie [hPa]",
             color = "Legenda") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if(zmienna == "opad")  {

      ggplot(data=dane[dane[,2] == stacja,]) +
        geom_line(aes(x=`Miesiac`, y=`WODZ`, color = "yellow")) +
        geom_line(aes(x=`Miesiac`, y=`WONO`, color = "black")) +
        geom_point(aes(x=`Miesiac`, y=`WODZ`, color = "yellow")) +
        geom_point(aes(x=`Miesiac`, y=`WONO`, color = "black")) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        scale_color_identity(name = "Pora dnia",
                             breaks = c("yellow", "black"),
                             labels = c("Dzien", "Noc"),
                             guide = "legend") +
        ggtitle("Roczny rozklad opadu") +
        labs(x = "Miesiac",
             y = "Opad [mm]",
             color = "Legenda") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))
    }

    else if (zmienna == "predkosc_wiatru") {

      ggplot(data=dane[dane[,2] == stacja,],
             aes(x=`Miesiac`, y=`FWS`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        ggtitle("Roczny rozklad predkosci wiatru") +
        labs(x = "Miesiac",
             y = "Predkosc wiatru [m/s]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "zachmurzenie") {

      ggplot(data=dane[dane[,2] == stacja,],
             aes(x=`Miesiac`, y=`NOS`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        ggtitle("Roczny rozklad zachmurzenia") +
        labs(x = "Miesiac",
             y = "Zachmurzenie [oktanty]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else {

      "Wybrano zla zmienna"

    }
  }

  else if (typ == "dobowe")    {

    if(zmienna == "temperatura")  {

      ggplot(data=dane[dane[,4] == miesiac,],
             aes(x=`Dzien`, y=`STD`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        ggtitle("Miesi??czny rozklad temperatury") +
        labs(x = "Dzien",
             y = "Temperatura [??C]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="red", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "cisnienie") {

      ggplot(data=dane[dane[,4] == miesiac,]) +
        geom_line(aes(x=`Dzien`, y=`PPPS`, color = "red")) +
        geom_line(aes(x=`Dzien`, y=`PPPM`, color = "blue")) +
        geom_point(aes(x=`Dzien`, y=`PPPS`, color = "red")) +
        geom_point(aes(x=`Dzien`, y=`PPPM`, color = "blue")) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        scale_color_identity(name = "Poziom odniesienia",
                             breaks = c("red", "blue"),
                             labels = c("Poziom stacji", "Poziom morza"),
                             guide = "legend") +
        ggtitle("Miesieczny rozklad cisnienia") +
        labs(x = "Dzien",
             y = "Cisnienie [hPa]",
             color = "Legenda") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if(zmienna == "opad")  {

      ggplot(data=dane[dane[,4] == miesiac,]) +
        geom_line(aes(x=`Dzien`, y=`WODZ`, color = "yellow")) +
        geom_line(aes(x=`Dzien`, y=`WONO`, color = "black")) +
        geom_point(aes(x=`Dzien`, y=`WODZ`, color = "yellow")) +
        geom_point(aes(x=`Dzien`, y=`WONO`, color = "black")) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        scale_color_identity(name = "Pora dnia",
                             breaks = c("yellow", "black"),
                             labels = c("Dzien", "Noc"),
                             guide = "legend") +
        ggtitle("Miesieczny rozklad opadu") +
        labs(x = "Dzien",
             y = "Opad [mm]",
             color = "Legenda") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "predkosc_wiatru") {

      ggplot(data=dane[dane[,4] == miesiac,],
             aes(x=`Dzien`, y=`FWS`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        ggtitle("Miesieczny rozklad predkosci wiatru") +
        labs(x = "Dzien",
             y = "Predkosc wiatru [m/s]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "zachmurzenie") {

      ggplot(data=dane[dane[,4] == miesiac,],
             aes(x=`Dzien`, y=`NOS`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        ggtitle("Miesieczny rozklad zachmurzenia") +
        labs(x = "Dzien",
             y = "Zachmurzenie [oktanty]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else {

      "Wybrano zla zmienna"

    }

  }

  else if (typ == "terminowe")     {

    if(zmienna == "temperatura")  {

      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
             aes(x=`Godzina`, y=`STD`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        ggtitle("Godzinowy rozklad temperatury") +
        labs(x = "Godzina",
             y = "Temperatura [??C]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="red", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "cisnienie") {

      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,]) +
        geom_line(aes(x=`Godzina`, y=`PPPS`, color = "red")) +
        geom_line(aes(x=`Godzina`, y=`PPPM`, color = "blue")) +
        geom_point(aes(x=`Godzina`, y=`PPPS`, color = "red")) +
        geom_point(aes(x=`Godzina`, y=`PPPM`, color = "blue")) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        scale_color_identity(name = "Poziom odniesienia",
                             breaks = c("red", "blue"),
                             labels = c("Poziom stacji", "Poziom morza"),
                             guide = "legend") +
        ggtitle("Godzinowy rozklad cisnienia") +
        labs(x = "Godzina",
             y = "Cisnienie [hPa]",
             color = "Legenda") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if(zmienna == "opad")  {

      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
             aes(x=`Godzina`, y=`WO6G`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        ggtitle("Opad co 6 godzin") +
        labs(x = "Godzina",
             y = "Opad [mm]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="red", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "predkosc_wiatru") {

      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
             aes(x=`Godzina`, y=`STD`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        ggtitle("Godzinowy rozklad predkosci wiatru") +
        labs(x = "Godzina",
             y = "Predkosc wiatru [m/s]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "zachmurzenie") {

      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
             aes(x=`Godzina`, y=`NOG`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        ggtitle("Godzinowy rozklad zachmurzenia") +
        labs(x = "Godzina",
             y = "Zachmurzenie [oktanty]") +
        theme(axis.title.x = element_text(color="black", size=10, face="bold"),
              axis.title.y = element_text(color="blue", size=10, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else {

      "Wybrano zla zmienna"

    }


  }

  else {

    "Wprowadzono zly typ danych"
  }

}
