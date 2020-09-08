library(shiny);
library(ggplot2);


data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")
print(data);


shinyServer(function(input, output) {
  
  newData <- reactive({data[which(data$countriesAndTerritories==input$Countries), ]});
  
  output$`Total Cases1` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(newData()$cases);
    
  })
  
  output$`Total Deaths1` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(newData()$deaths);
    
  })
  
  output$`Mean Cases1` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(newData()$cases);
    
  })
  
  output$`Mean Deaths1` <- renderPrint({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(data$deaths);
    
  })
  
  output$WTotalCases <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(data$cases);
  })
  
  output$WTotalDeaths <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    sum(data$deaths);
  })
  
  output$WMeanCases <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(data$cases);
  })
  
  output$WMeanDeaths <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    mean(data$deaths);
  })
  
  output$PredictedCas1 <- renderPrint({
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    newDataSep <- newData()[which(newData()$month == 9), ];
    
    y <- newDataSep$cases
    x <- newDataSep$day
    
    m <- lm(cases ~ day, data=newDataSep);
    summary(m);
    
    predict(m, data.frame(day=input$day));
     
  })
  
  
  output$distPlot <- renderPlot({
    
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    
    
    plot(newData()$month, newData()$cases);
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
  
  
  
  
  
  
  output$casesPlot13 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==9), ];
    
    plot(SepData$day, SepData$cases, type="l");
    
    
  })
  
  output$deathPlot13 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    SepData <- newData()[which(newData()$month==9), ];
    
    plot(SepData$day, SepData$death, type="l");
    
    
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
    
    plot(AugData$day, AugData$cases, type="l");
    
    
  })
  
  output$deathPlot12 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AugData <- newData()[which(newData()$month==8), ];
    
    plot(AugData$day, AugData$death, type="l");
    
    
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
    
    plot(JulData$day, JulData$cases, type="l");
    
    
  })
  
  output$deathPlot11 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JulData <- newData()[which(newData()$month==7), ];
    
    plot(JulData$day, JulData$death, type="l");
    
    
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
    
    plot(JunData$day, JunData$cases, type="l");
    
    
  })
  
  output$deathPlot10 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    
    plot(JunData$day, JunData$death, type="l");
    
    
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
    
    plot(JunData$day, JunData$cases, type="l");
    
    
  })
  
  output$deathPlot9 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JunData <- newData()[which(newData()$month==6), ];
    
    plot(JunData$day, JunData$death, type="l");
    
    
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
    
    plot(AprData$day, AprData$cases, type="l");
    
    
  })
  
  
  output$deathPlot1 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    AprData <- newData()[which(newData()$month==4), ];
    
    plot(AprData$day, AprData$death, type="l");
    
    
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
    
    plot(MarData$day, MarData$cases, type="l");
    
    
  })
  
  output$deathPlot2 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    MarData <- newData()[which(newData()$month==3), ];
    
    plot(MarData$day, MarData$death, type="l");
    
    
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
    
    plot(FebData$day, FebData$cases, type="l");
    
    
  })
  
  
  output$deathPlot3 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    FebData <- newData()[which(newData()$month==2), ];
    
    plot(FebData$day, FebData$death, type="l");
    
    
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
    
    plot(JanData$day, JanData$cases, type="l");
    
    
  })
  
  
  output$deathPlot4 <- renderPlot({
    
    #newData <- data[which(data$countriesAndTerritories=="Singapore"), ];
    JanData <- newData()[which(newData()$month==1), ];
    
    plot(JanData$day, JanData$death, type="l");
    
    
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
    newData();
    
  })
})