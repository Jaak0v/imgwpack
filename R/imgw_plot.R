#' Funkcja wizualizuje wybrane dane w postaci wykresu
#'
#' @param typ character
#' @param dane character
#' @param miesiac integer
#' @param zmienna character
#' @param stacja character
#' @param dzien integer
#'
#' @return plot
#' @export
#'
#' @examples
#' \dontrun{
#' imgw_plot(typ = "dobowe",
#'           dane = '',
#'           #miesiac = 5,
#'           zmienna = "cisnienie",
#'           stacja = "Zakopane")
#' }
#' @examples
imgw_plot <- function(typ, dane, miesiac, zmienna, stacja, dzien) {

  if (!is.character(typ) | !is.character(zmienna)) {
    stopifnot("Wartości argumentów: `typ` i `zmienna` muszą być typu character") }

  if (typ == "miesieczne")     {

    if (!is.character(stacja)) {
      stopifnot("Wartości argumentu: `stacja` musi byc typu charakter") }

    if(zmienna == "temperatura")  {

      ggplot(data=dane[dane[,2] == stacja,],
             aes(x=`Miesiac`, y=`STM`, group=1)) +
        ggh4x::stat_difference(aes(ymin = 0, ymax = `STM`), show.legend = FALSE, alpha = 0.5) +
        geom_line(aes(y = `STM`), size=0.8, color = "red") +
        geom_point(size = 0.8, color = "black" ) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        ggtitle("Miesieczny rozklad temperatury") +
        labs(x = "Dzien",
             y = "Temperatura [C]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
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
        ggtitle("Miesieczny rozklad cisnienia") +
        labs(x = "Dzien",
             y = "Cisnienie [hPa]",
             color = "Legenda") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if(zmienna == "opad")  {

      scale = 1

      ggplot(data=dane[dane[,2] == stacja,], aes(x = `Miesiac`)) +
        geom_bar(mapping = aes(y = `WODZ`), stat = "identity", color="black", fill="orange1", width = 0.7) +
        geom_bar(mapping = aes(y = `WONO`), stat = "identity", color="black", fill="royalblue3", width = 0.3) +
        geom_line(aes(y = `WLGS`/scale, color = "orangered2"), size = 1) +
        scale_y_continuous(sec.axis = sec_axis(~.*scale, name="Wilgotnosc Wzgledna [%]")) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        scale_color_identity(name = "Pora dnia",
                             breaks = c("yellow", "black"),
                             labels = c("Dzien", "Noc"),
                             guide = "legend") +
        ggtitle("Roczny rozklad opadu") +
        labs(x = "Dzien",
             y = "Opad [mm]",
             color = "Legenda") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))
    }

    else if (zmienna == "predkosc_wiatru") {

      ggplot(data=dane[dane[,2] == stacja,],
             aes(x=`Miesiac`, y=`FWS`, group=1)) +
        geom_line(color = "#063970", size = 0.85) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        ggtitle("Roczny rozklad predkosci wiatru") +
        labs(x = "Miesiac",
             y = "Predkosc wiatru [m/s]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "zachmurzenie") {

      ggplot(data=dane[dane[,2] == stacja,],
             aes(x=`Miesiac`, y=`NOS`, group=1)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        labs(y = "Zachmurzenie [oktanty]") +
        geom_line(size = 0.65) +
        geom_area(aes(y=`NOS`),
                  fill = "lightgray",
                  alpha = 0.65) +
        ggtitle("Roczny rozklad zachmurzenia") +
        labs(x = "Miesiac",
             y = "Zachmurzenie [oktanty]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "meteogram") {

      plot1 <- ggplot(data=dane[dane[,2] == stacja,],
                      aes(x=`Miesiac`, y=`STM`, group=1)) +
        ggh4x::stat_difference(aes(ymin = 0, ymax = `STM`), show.legend = FALSE, alpha = 0.5) +
        geom_line(aes(y = `STM`), size=0.5) +
        geom_point(size = 0.8, color = "black" ) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        labs(y = "Temperatura [°C]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      plot2 <- ggplot(data=dane[dane[,2] == stacja,]) +
        geom_line(aes(x=`Miesiac`, y=`PPPS`, color = "red")) +
        geom_line(aes(x=`Miesiac`, y=`PPPM`, color = "blue")) +
        geom_point(aes(x=`Miesiac`, y=`PPPS`, color = "red")) +
        geom_point(aes(x=`Miesiac`, y=`PPPM`, color = "blue")) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        scale_color_identity(name = "Poziom odniesienia",
                             breaks = c("red", "blue"))+
        labs(y = "Cisnienie [hPa]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      scale = 1.5
      plot3 <- ggplot(data=dane[dane[,2] == stacja,], aes(x = `Miesiac`)) +
        geom_bar(mapping = aes(y = `WODZ`), stat = "identity", color="black", fill="orange1", width = 0.7) +
        geom_bar(mapping = aes(y = `WONO`), stat = "identity", color="black", fill="royalblue3", width = 0.3) +
        geom_line(aes(y = `WLGS`/scale, color = "orangered2"), size = 1) +
        scale_y_continuous(sec.axis = sec_axis(~.*scale, name="Wilgotnosc Wzgledna [%]")) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        scale_color_identity(name = "Pora dnia",
                             breaks = c("yellow2", "black")) +
        labs(y = "Opad [mm]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      plot4 <- ggplot(data=dane[dane[,2] == stacja,],
                      aes(x=`Miesiac`, y=`FWS`, group=1)) +
        geom_line(color = "#063970", size = 0.85) +
        #geom_point() +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        labs(y = "Predkosc wiatru [m/s]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      plot5 <- ggplot(data=dane[dane[,2] == stacja,],
                      aes(x=`Miesiac`, y=`NOS`, group=1)) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12)) +
        labs(y = "Zachmurzenie [oktanty]") +
        geom_line(size = 0.65) +
        geom_area(aes(y=`NOS`),
                  fill = "lightgray",
                  alpha = 0.65) +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      grid.arrange(plot1, plot2, plot3, plot4, plot5,
                   ncol=1, nrow=5)

    }

    else {

      "Wybrano zla zmienna. Funkcja tworzy wykresy dla zmiennych: 'temperatura', 'cisnienie', 'opad',
      'predkosc_wiatru', 'zachmurzenie' i 'meteogram'"

    }
  }

  else if (typ == "dobowe")    {

    if(zmienna == "temperatura")  {

      ggplot(data=dane[dane[,4] == miesiac,],
             aes(x=`Dzien`, y=`STD`, group=1)) +
        ggh4x::stat_difference(aes(ymin = 0, ymax = `STD`), show.legend = FALSE, alpha = 0.5) +
        geom_line(aes(y = `STD`), size=0.8, color = "red") +
        geom_point(size = 0.8, color = "black" ) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        ggtitle("Miesieczny rozklad temperatury") +
        labs(x = "Dzien",
             y = "Temperatura [C]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
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
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if(zmienna == "opad")  {

      scale = 25

      ggplot(data=dane[dane[,4] == miesiac,], aes(x = `Dzien`)) +
        geom_bar(mapping = aes(y = `WODZ`), stat = "identity", color="black", fill="orange1", width = 0.7) +
        geom_bar(mapping = aes(y = `WONO`), stat = "identity", color="black", fill="royalblue3", width = 0.3) +
        geom_line(aes(y = `WLGS`/scale, color = "orangered2"), size = 1) +
        scale_y_continuous(sec.axis = sec_axis(~.*scale, name="Wilgotnosc Wzgledna [%]")) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        scale_color_identity(name = "Pora dnia",
                             breaks = c("yellow", "black"),
                             labels = c("Dzien", "Noc"),
                             guide = "legend") +
        ggtitle("Miesieczny rozklad opadu") +
        labs(x = "Dzien",
             y = "Opad [mm]",
             color = "Legenda") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "predkosc_wiatru") {

      ggplot(data=dane[dane[,4] == miesiac,],
             aes(x=`Dzien`, y=`FWS`, group=1)) +
        geom_line(color = "#063970", size = 0.85) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        ggtitle("Predkosc wiatru") +
        labs(x = "Dzien",
             y = "Predkosc wiatru [m/s]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "zachmurzenie") {


      ggplot(data=dane[dane[,4] == miesiac,],
             aes(x=`Dzien`, y=`NOS`, group=1)) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        labs(y = "Zachmurzenie [oktanty]") +
        geom_line(size = 0.65) +
        geom_area(aes(y=`NOS`),
                  fill = "lightgray",
                  alpha = 0.65) +
        ggtitle("Miesieczny rozklad zachmurzenia") +
        labs(x = "Dzien",
             y = "Zachmurzenie [oktanty]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "meteogram") {

      plot1 <- ggplot(data=dane[dane[,4] == miesiac,],
                      aes(x=`Dzien`, y=`STD`, group=1)) +
        ggh4x::stat_difference(aes(ymin = 0, ymax = `STD`), show.legend = FALSE, alpha = 0.5) +
        geom_line(aes(y = `STD`), size=0.5) +
        geom_point(size = 0.8, color = "black" ) +
        #geom_text(aes(label = round(`STD`, 1)),
        #vjust = 0, hjust = 0,
        #angle = 45,
        #colour = "red",
        # show.legend = FALSE) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        labs(y = "Temperatura [°C]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))


      plot2 <- ggplot(data=dane[dane[,4] == miesiac,]) +
        geom_line(aes(x=`Dzien`, y=`PPPS`, color = "red")) +
        geom_line(aes(x=`Dzien`, y=`PPPM`, color = "blue")) +
        geom_point(aes(x=`Dzien`, y=`PPPS`, color = "red")) +
        geom_point(aes(x=`Dzien`, y=`PPPM`, color = "blue")) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        scale_color_identity(name = "Poziom odniesienia",
                             breaks = c("red", "blue"))+
        labs(y = "Cisnienie [hPa]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      scale = 25
      plot3 <- ggplot(data=dane[dane[,4] == miesiac,], aes(x = `Dzien`)) +
        geom_bar(mapping = aes(y = `WODZ`), stat = "identity", color="black", fill="orange1", width = 0.7) +
        geom_bar(mapping = aes(y = `WONO`), stat = "identity", color="black", fill="royalblue3", width = 0.3) +
        geom_line(aes(y = `WLGS`/scale, color = "orangered2"), size = 1) +
        scale_y_continuous(sec.axis = sec_axis(~.*scale, name="Wilgotność Względna [%]")) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        scale_color_identity(name = "Pora dnia",
                             breaks = c("yellow2", "black")) +
        labs(y = "Opad [mm]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5),
        )

      plot4 <-  ggplot(data=dane[dane[,4] == miesiac,],
                       aes(x=`Dzien`, y=`FWS`, group=1)) +
        geom_line(color = "#063970", size = 0.85) +
        #geom_point() +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        labs(y = "Predkosc wiatru [m/s]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      plot5 <- ggplot(data=dane[dane[,4] == miesiac,],
                      aes(x=`Dzien`, y=`NOS`, group=1)) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24, 28, 31)) +
        labs(y = "Zachmurzenie [oktanty]") +
        geom_line(size = 0.65) +
        geom_area(aes(y=`NOS`),
                  fill = "lightgray",
                  alpha = 0.65) +
        #geom_text(aes(label = round(`NOS`, 1)),
        #vjust = 0, hjust = 0,
        #angle = 45,
        #colour = "black",
        #show.legend = FALSE) +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      grid.arrange(plot1, plot2, plot3, plot4, plot5,
                   ncol=1, nrow=5)


      grid.arrange(plot1, plot2, plot3, plot4, plot5,
                   ncol=1, nrow=5)

    }

    else {

      "Wybrano zla zmienna"

    }

  }

  else if (typ == "terminowe")     {

    if(zmienna == "temperatura")  {

      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
             aes(x=`Godzina`, y=`STD`, group=1)) +
        ggh4x::stat_difference(aes(ymin = 0, ymax = `STD`), show.legend = FALSE, alpha = 0.5) +
        geom_line(aes(y = `STD`), size=0.5, color = "red", size = 0.8) +
        geom_point(size = 0.8, color = "black" ) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        ggtitle("Godzinowy rozklad temperatury") +
        labs(x = "Godzina",
             y = "Temperatura [C]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
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
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if(zmienna == "opad")  {

      scale = 25
      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
             aes(x=`Godzina`)) +
        geom_bar(mapping = aes(y = `WO6G`), stat = "identity", color="black", fill="orange1", width = 0.7) +
        geom_line(aes(y = `WLGW`/scale, color = "orangered2"), size = 1) +
        scale_y_continuous(sec.axis = sec_axis(~.*scale, name="Wilgotnosc Wzgledna [%]")) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        ggtitle("Opad co 6 godzin") +
        scale_color_identity(name = "Pora dnia",
                             breaks = c("yellow", "black"),
                             labels = c("Dzien", "Noc"),
                             guide = "legend") +
        labs(x = "Godzina",
             y = "Opad [mm]",
             color = "Legenda") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "predkosc_wiatru") {

      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
             aes(x=`Godzina`, y=`FWR`, group=1)) +
        geom_line(color = "#063970", size = 0.85) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        ggtitle("Godzinowy rozklad predkosci wiatru") +
        labs(x = "Godzina",
             y = "Predkosc wiatru [m/s]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "zachmurzenie") {

      ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
             aes(x=`Godzina`, y=`NOG`, group=1)) +
        geom_line(size = 0.65) +
        geom_area(aes(y=`NOG`),
                  fill = "lightgray",
                  alpha = 0.65) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        ggtitle("Godzinowy rozklad zachmurzenia") +
        labs(x = "Godzina",
             y = "Zachmurzenie [oktanty]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x= element_text(color="black", size=8, face="bold"),
              plot.title = element_text(hjust = 0.5))

    }

    else if (zmienna == "meteogram") {

      plot1 <- ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
                      aes(x=`Godzina`, y=`STD`, group=1)) +
        ggh4x::stat_difference(aes(ymin = 0, ymax = `STD`), show.legend = FALSE, alpha = 0.5) +
        geom_line(aes(y = `STD`), size=0.8, color = "red") +
        geom_point(size = 0.8, color = "black" ) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        labs(y = "Temperatura [°C]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      plot2 <- ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,]) +
        geom_line(aes(x=`Godzina`, y=`PPPS`, color = "red")) +
        geom_line(aes(x=`Godzina`, y=`PPPM`, color = "blue")) +
        geom_point(aes(x=`Godzina`, y=`PPPS`, color = "red")) +
        geom_point(aes(x=`Godzina`, y=`PPPM`, color = "blue")) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_color_identity(name = "Poziom odniesienia",
                             breaks = c("red", "blue"))+
        labs(y = "Cisnienie [hPa]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      scale = 25
      plot3 <- ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
                      aes(x=`Godzina`)) +
        geom_bar(mapping = aes(y = `WO6G`), stat = "identity", color="black", fill="orange1", width = 0.7) +
        geom_line(aes(y = `WLGW`/scale, color = "orangered2"), size = 1) +
        scale_y_continuous(sec.axis = sec_axis(~.*scale, name="Wilgotnosc Wzgledna [%]")) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        scale_color_identity(name = "Pora dnia",
                             breaks = c("yellow", "black"),
                             labels = c("Dzien", "Noc"),
                             guide = "legend") +
        labs(y = "Opad [mm]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      plot4 <- ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
                      aes(x=`Godzina`, y=`FWR`, group=1)) +
        geom_line(color = "#063970", size = 0.85) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        labs(y = "Predkosc wiatru [m/s]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x=element_blank(),
              plot.title = element_text(hjust = 0.5))

      plot5 <- ggplot(data=dane[dane[,4] == miesiac & dane[,5] == dzien,],
                      aes(x=`Godzina`, y=`NOG`, group=1)) +
        geom_line(size = 0.65) +
        geom_area(aes(y=`NOG`),
                  fill = "lightgray",
                  alpha = 0.65) +
        scale_y_continuous(sec.axis = sec_axis(~.*1)) +
        scale_x_continuous(breaks=c(0, 4, 8, 12, 16, 20, 24)) +
        labs(y = "Zachmurzenie [oktanty]") +
        theme(axis.title.y = element_text(color="black", size=8, face="bold"),
              axis.title.x = element_blank(),
              plot.title = element_text(hjust = 0.5))


      grid.arrange(plot1, plot2, plot3, plot4, plot5,
                   ncol=1, nrow=5)

    }

    else {

      "Wybrano zla zmienna"

    }


  }

  else {

    "Wprowadzono zly typ danych. Poprawne typy to: 'dobowe', 'miesieczne' i 'terminowe'"

  }

}
