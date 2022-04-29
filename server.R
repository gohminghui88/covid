library("shiny");
library("ggplot2");
library("dplyr");
library("ggmap");


data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM");
data2 <- read.csv("https://opendata.ecdc.europa.eu/covid19/nationalcasedeath/csv/data.csv", na.strings = "", fileEncoding = "UTF-8-BOM");
co <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv", header=TRUE, fileEncoding="UTF-8-BOM");



shinyServer(function(input, output) {
  
  newData <- reactive({   data[which(data$countriesAndTerritories==input$Countries), ]   });
  newData2 <- reactive({     data2[which(data2$country==input$Countries), ]     });
  newData2Cases <- reactive({  newData2()[which(newData2()$indicator=="cases"), ]     });
  newData2Deaths <- reactive({  newData2()[which(newData2()$indicator=="deaths"), ]     });
  
  newData2CasesWorld <- reactive({     data2[which(data2$indicator=="cases"), ]     });
  newData2DeathsWorld <- reactive({     data2[which(data2$indicator=="deaths"), ]     });
  d <- reactive({     data2[which(data2$indicator=="cases"), ]     });
  
  
  df <-reactive({ d() %>% 
                        dplyr::filter(year_week=="2022-15") %>% 
                        dplyr::select(1, indicator, weekly_count, year_week) %>% 
                        replace(.=="NA", 0)
                  
                });
  
  
  
  
  
  map.world <- reactive({ map_data("world") });
  map.world_joined <- reactive({ left_join(map.world(), df(), by = c('region' = 'country')) });
 
  
  co87 <- reactive({  left_join(df(), co, by = c("country" = "Country.Region")) });
  co88 <- reactive({ co87() %>% dplyr::select(country, indicator, weekly_count, year_week, Lat, Long) %>% 
                                replace(.=="NA", 0) %>% mutate(count = 100/weekly_count) });
  
  co89 <- reactive ({ na.omit(co88()) });
  
  
  output$`Total Cases1` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(as.numeric(unlist(newData2Cases()["weekly_count"])), na.rm=TRUE );
    
  })
  
  output$`Total Deaths1` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(as.numeric(unlist(newData2Deaths()["weekly_count"])), na.rm=TRUE );
    
  })
  
  output$`Mean Cases1` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(as.numeric(unlist(newData2Cases()["weekly_count"])), na.rm=TRUE );
    
  })
  
  output$`Mean Deaths1` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(as.numeric(unlist(newData2Deaths()["weekly_count"])), na.rm=TRUE );
    
  })
  
  
  output$casesPlot17 <- renderPlot({
    
    print(nrow(newData2Cases()["year_week"]))
    print(nrow(newData2Cases()["weekly_count"]))
    
    plot(as.factor(unlist(newData2Cases()["year_week"])), unlist(newData2Cases()["weekly_count"]), type="b", 
         lwd=1, xlab="year-week", ylab="count", pch=15);
    
    
    
  })
  
  
  output$deathPlot17 <- renderPlot({
    
   
    print(nrow(newData2Deaths()["year_week"]))
    print(nrow(newData2Deaths()["weekly_count"]))
    
    plot(as.factor(unlist(newData2Deaths()["year_week"])), unlist(newData2Deaths()["weekly_count"]), type="b", 
         lwd=1, xlab="year-week", ylab="count", pch=15, col="red");
    
    
    
  })
  
  
  output$casesPlot19 <- renderPlot({
    
    print(nrow(newData2Cases()["year_week"]))
    print(nrow(newData2Cases()["cumulative_count"]))
    
    plot(as.factor(unlist(newData2Cases()["year_week"])), unlist(newData2Cases()["cumulative_count"]), type="b", 
         lwd=1, xlab="year-week", ylab="count", pch=15);
    
    
    
  })
  
  
  output$deathPlot19 <- renderPlot({
    
    
    print(nrow(newData2Deaths()["year_week"]))
    print(nrow(newData2Deaths()["cumulative_count"]))
    
    plot(as.factor(unlist(newData2Deaths()["year_week"])), unlist(newData2Deaths()["cumulative_count"]), type="b", 
         lwd=1, xlab="year-week", ylab="count", pch=15, col="red");
    
    
    
  })
  
  
  
  output$WTotalCases <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(as.numeric(unlist(newData2CasesWorld()["weekly_count"])), na.rm=TRUE );
  })
  
  output$WTotalDeaths <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(as.numeric(unlist(newData2DeathsWorld()["weekly_count"])), na.rm=TRUE );
  })
  
  output$WMeanCases <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(as.numeric(unlist(newData2CasesWorld()["weekly_count"])), na.rm=TRUE );
  })
  
  output$WMeanDeaths <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(as.numeric(unlist(newData2DeathsWorld()["weekly_count"])), na.rm=TRUE );
  })
  
  output$casesPlot18 <- renderPlot({
    
    print(nrow(newData2CasesWorld()["year_week"]))
    print(nrow(newData2CasesWorld()["weekly_count"]))
    
    plot(as.factor(unlist(newData2CasesWorld()["year_week"])), unlist(newData2CasesWorld()["weekly_count"]), type="b", 
         lwd=1, xlab="year-week", ylab="count", pch=15);
    
    
  })
  
  
  output$deathPlot18 <- renderPlot({
    
    print(nrow(newData2DeathsWorld()["year_week"]))
    print(nrow(newData2DeathsWorld()["weekly_count"]))
    
    plot(as.factor(unlist(newData2DeathsWorld()["year_week"])), unlist(newData2DeathsWorld()["weekly_count"]), type="b", 
         lwd=1, xlab="year-week", ylab="count", pch=15, col="red");
    
    
  })
  
  
  output$casesPlot20 <- renderPlot({
    
    
    #Upload to Shiny server cannot have map. Tried on my desktop, succeeded. I will attach image instead. 

    #ggplot() +
    #  geom_polygon(data = map.world_joined(), aes(x = long, y = lat, group = group), fill="grey", alpha=0.3) +
    #  geom_point(data = co89(), aes(x = Long, y = Lat, size=count), color = "red", alpha=0.3) +
    #  scale_fill_manual(values = c("#CCCCCC","#e60000")) +
    #  labs(title = ' COVID-19 Infected Countries') +
    #  theme_set(theme_bw())
    
    
  })
  
  
  
  
  
  output$PredictedCas1 <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    newDataSep <- newData()[which(newData()$month == 11), ];
    
    y <- newDataSep$cases
    x <- newDataSep$day
    
    m <- lm(cases ~ day, data=newDataSep);
    summary(m);
    
    predict(m, data.frame(day=input$day));
     
  })
  
  
  
  
  
  
  output$distPlot <- renderPlot({
    
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    
    
    plot(newData()$month, newData()$cases, xlab="Month", ylab="Cases", pch=10);
    #ggplot(newData()) + geom_line(aes(color="red", x=month, y=cases)) + labs(title="scatter") + theme_light;
    
    
  })
  
  
  output$`Total Cases2` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(newData()$cases);
    
  })
  
  output$`Total Deaths2` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(newData()$deaths);
    
  })
  
  output$`Mean Cases2` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(newData()$cases);
    
  })
  
  output$`Mean Deaths2` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(newData()$deaths);
    
  })
  
  
  
  
  
  
  
  output$casesPlot16 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==12), ];
    
    plot(SepData$day, SepData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot16 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==12), ];
    
    plot(SepData$day, SepData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases16` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==12), ];
    sum(SepData$cases);
    
  })
  
  output$`Total Deaths16` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==12), ];
    sum(SepData$deaths);
    
  })
  
  output$`Mean Cases16` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==12), ];
    mean(SepData$cases);
    
  })
  
  output$`Mean Deaths16` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==12), ];
    mean(SepData$deaths);
    
  })
  
  
  
  
  
  
  
  output$casesPlot15 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==11), ];
    
    plot(SepData$day, SepData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot15 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==11), ];
    
    plot(SepData$day, SepData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases15` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==11), ];
    sum(SepData$cases);
    
  })
  
  output$`Total Deaths15` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==11), ];
    sum(SepData$deaths);
    
  })
  
  output$`Mean Cases15` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==11), ];
    mean(SepData$cases);
    
  })
  
  output$`Mean Deaths15` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==11), ];
    mean(SepData$deaths);
    
  })
  
  
  
  

  
  output$casesPlot14 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==10), ];
    
    plot(SepData$day, SepData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot14 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==10), ];
    
    plot(SepData$day, SepData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases14` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==10), ];
    sum(SepData$cases);
    
  })
  
  output$`Total Deaths14` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==10), ];
    sum(SepData$deaths);
    
  })
  
  output$`Mean Cases14` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==10), ];
    mean(SepData$cases);
    
  })
  
  output$`Mean Deaths14` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==10), ];
    mean(SepData$deaths);
    
  })
  
  
  
  
  
    
  
  
  output$casesPlot13 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==9), ];
    
    plot(SepData$day, SepData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot13 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==9), ];
    
    plot(SepData$day, SepData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases13` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==9), ];
    sum(SepData$cases);
    
  })
  
  output$`Total Deaths13` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==9), ];
    sum(SepData$deaths);
    
  })
  
  output$`Mean Cases13` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==9), ];
    mean(SepData$cases);
    
  })
  
  output$`Mean Deaths13` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==9), ];
    mean(SepData$deaths);
    
  })
  
  
  

  
  output$casesPlot12 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AugData <- newData()[which(newData()$month==8), ];
    
    plot(AugData$day, AugData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot12 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AugData <- newData()[which(newData()$month==8), ];
    
    plot(AugData$day, AugData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases12` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AugData <- newData()[which(newData()$month==8), ];
    sum(AugData$cases);
    
  })
  
  output$`Total Deaths12` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AugData <- newData()[which(newData()$month==8), ];
    sum(AugData$deaths);
    
  })
  
  output$`Mean Cases12` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AugData <- newData()[which(newData()$month==8), ];
    mean(AugData$cases);
    
  })
  
  output$`Mean Deaths12` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AugData <- newData()[which(newData()$month==8), ];
    mean(AugData$deaths);
    
  })
  
  
  
    
  
  
  
  
  output$casesPlot11 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JulData <- newData()[which(newData()$month==7), ];
    
    plot(JulData$day, JulData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot11 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JulData <- newData()[which(newData()$month==7), ];
    
    plot(JulData$day, JulData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases11` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JulData <- newData()[which(newData()$month==7), ];
    sum(JulData$cases);
    
  })
  
  output$`Total Deaths11` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JulData <- newData()[which(newData()$month==7), ];
    sum(JulData$deaths);
    
  })
  
  output$`Mean Cases11` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JulData <- newData()[which(newData()$month==7), ];
    mean(JulData$cases);
    
  })
  
  output$`Mean Deaths11` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JulData <- newData()[which(newData()$month==7), ];
    mean(JulData$deaths);
    
  })
  
  
  
  
  
  
  
  
  
  output$casesPlot10 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    
    plot(JunData$day, JunData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot10 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    
    plot(JunData$day, JunData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases10` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    sum(JunData$cases);
    
  })
  
  output$`Total Deaths10` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    sum(JunData$deaths);
    
  })
  
  output$`Mean Cases10` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    mean(JunData$cases);
    
  })
  
  output$`Mean Deaths10` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    mean(JunData$deaths);
    
  })
  
  
  
  
  
  
  output$casesPlot9 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    
    plot(JunData$day, JunData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot9 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    
    plot(JunData$day, JunData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  
  
  
  
  output$`Total Cases9` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MayData <- newData()[which(newData()$month==5), ];
    sum(MayData$cases);
    
  })
  
  output$`Total Deaths9` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MayData <- newData()[which(newData()$month==5), ];
    sum(MayData$deaths);
    
  })
  
  output$`Mean Cases9` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MayData <- newData()[which(newData()$month==5), ];
    mean(MayData$cases);
    
  })
  
  output$`Mean Deaths9` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MayData <- newData()[which(newData()$month==5), ];
    mean(MayData$deaths);
    
  })
  
  
  
  
  
  output$casesPlot1 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AprData <- newData()[which(newData()$month==4), ];
    
    plot(AprData$day, AprData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  
  output$deathPlot1 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AprData <- newData()[which(newData()$month==4), ];
    
    plot(AprData$day, AprData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases3` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AprData <- newData()[which(newData()$month==4), ];
    sum(AprData$cases);
    
  })
  
  output$`Total Deaths3` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AprData <- newData()[which(newData()$month==4), ];
    sum(AprData$deaths);
    
  })
  
  output$`Mean Cases3` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AprData <- newData()[which(newData()$month==4), ];
    mean(AprData$cases);
    
  })
  
  output$`Mean Deaths3` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AprData <- newData()[which(newData()$month==4), ];
    mean(AprData$deaths);
    
  })
  
  
  output$casesPlot2 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MarData <- newData()[which(newData()$month==3), ];
    
    plot(MarData$day, MarData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  output$deathPlot2 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MarData <- newData()[which(newData()$month==3), ];
    
    plot(MarData$day, MarData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  output$`Total Cases4` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MarData <- newData()[which(newData()$month==3), ];
    sum(MarData$cases);
    
  })
  
  output$`Total Deaths4` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MarData <- newData()[which(newData()$month==3), ];
    sum(MarData$deaths);
    
  })
  
  output$`Mean Cases4` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MarData <- newData()[which(newData()$month==3), ];
    mean(MarData$cases);
    
  })
  
  output$`Mean Deaths4` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MarData <- newData()[which(newData()$month==3), ];
    mean(MarData$deaths);
    
  })
  
  
  
  
  output$casesPlot3 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    FebData <- newData()[which(newData()$month==2), ];
    
    plot(FebData$day, FebData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  
  output$deathPlot3 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    FebData <- newData()[which(newData()$month==2), ];
    
    plot(FebData$day, FebData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases5` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    FebData <- newData()[which(newData()$month==2), ];
    sum(FebData$cases);
    
  })
  
  output$`Total Deaths5` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    FebData <- newData()[which(newData()$month==2), ];
    sum(FebData$deaths);
    
  })
  
  output$`Mean Cases5` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    FebData <- newData()[which(newData()$month==2), ];
    mean(FebData$cases);
    
  })
  
  output$`Mean Deaths5` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    FebData <- newData()[which(newData()$month==2), ];
    mean(FebData$deaths);
    
  })
  
  output$casesPlot4 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JanData <- newData()[which(newData()$month==1), ];
    
    plot(JanData$day, JanData$cases, type="b", xlab="Day", ylab="cases", pch=4);
    
    
  })
  
  
  output$deathPlot4 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JanData <- newData()[which(newData()$month==1), ];
    
    plot(JanData$day, JanData$death, type="b", xlab="Day", ylab="cases", col="red", pch=4);
    
    
  })
  
  
  output$`Total Cases6` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JanData <- newData()[which(newData()$month==1), ];
    sum(JanData$cases);
    
  })
  
  output$`Total Deaths6` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JanData <- newData()[which(newData()$month==1), ];
    sum(JanData$deaths);
    
  })
  
  output$`Mean Cases6` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JanData <- newData()[which(newData()$month==1), ];
    mean(JanData$cases);
    
  })
  
  output$`Mean Deaths6` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JanData <- newData()[which(newData()$month==1), ];
    mean(JanData$deaths);
    
  })
  
  output$View = renderTable({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    newData2();
    
  })
  
  output$View2 = renderTable({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    newData2CasesWorld();
    
  })
  
  output$View3 = renderTable({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    newData();
    
  })
})