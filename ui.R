library(shiny);

 
shinyUI(pageWithSidebar(
  

  headerPanel("COVID 19 Beta Created By Eric Goh"),
  
  

  sidebarPanel(
    
    selectInput("Countries", "Countries: ", selected = "Singapore", choices = c("Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Anguilla", "Antigua_and_Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bonaire, Saint Eustatius and Saba", "Bosnia_and_Herzegovina", "Botswana", "Brazil", "British_Virgin_Islands", "Brunei_Darussalam", "Bulgaria", "Burkina_Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape_Verde", "Cases_on_an_international_conveyance_Japan", "Cayman_Islands", "Central_African_Republic", "Chad", "Chile", "China", "Colombia", "Congo", "Costa_Rica", "Cote_dlvoire", "Croatia", "Cuba", "Curaçao", "Cyprus", "Czechia", "Democratic_Republic_of_the_Congo", "Denmark", "Djibouti", "Dominica", "Dominican_Republic", "Ecuador", "Egypt", "El_Salvador", "Equatorial_Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Falkland_Islands_(Malvinas)", "Faroe_Islands", "Fiji", "Finland", "France", "French_Polynesia", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea_Bissau", "Guyana", "Haiti", "Holy_See", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle_of_Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Mauritania", "Mauritius", "Mexico", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nepal", "Netherlands", "New_Caledonia", "New_Zealand", "Nicaragua", "Niger", "Nigeria", "North_Macedonia", "Northern_Mariana_Islands", "Norway", "Oman", "Pakistan", "Palestine", "Panama", "Papua_New_Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto_Rico", "Qatar", "Romania", "Russia", "Rwanda", "Saint_Kitts_and_Nevis", "Saint_Lucia",  "Saint_Vincent_and_the_Grenadines", "San_Marino", "Sao_Tome_and_Principe", "Saudi_Arabia", "Senegal", "Serbia", "Seychelles", "Sierra_Leone", "Singapore", "Sint_Maarten", "Slovakia", "Slovenia", "Somalia", "South_Africa", "South_Korea", "South_Sudan", "Spain", "Sri_Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Taiwan", "Thailand", "Timor_Leste", "Togo", "Trinidad_and_Tobago", "Tunisia", "Turkey", "Turks_and_Caicos_islands", "Uganda", "Ukraine", "United_Arab_Emirates",  "United_Kingdom", "United_Republic_of_Tanzania", "United_States_of_America", "United_States_Virgin_Islands", "Uruguay", "Uzbekistan", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe")), 
    
    
    
    sliderInput("day", 
                "Predicted No. of Cases for Day:", 
                min = 1,
                max = 31, 
                value = 19)
    
    
  ),
  

  mainPanel(
    
    
    
    h4("Current Month"), 
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases1"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths1"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases1"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths1"),
    
    
    
    h5("World Total Cases"),
    verbatimTextOutput("WTotalCases"),
    
    h5("World Total Deaths"),
    verbatimTextOutput("WTotalDeaths"),
    
    h5("World Average and Mean Cases"),
    verbatimTextOutput("WMeanCases"),
    
    h5("World Average and Mean Deaths"),
    verbatimTextOutput("WMeanDeaths"),
    
  
    h5("Predicted No. of Cases, If higher than this amount, it is not good. If lower than this amount, it is good. "),
    verbatimTextOutput("PredictedCas1"),
    
    
    
    
    h4("Dec 2019 to Sep 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases2"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths2"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases2"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths2"),
    
    plotOutput("distPlot"),
    
    
    
    h4("September 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases13"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths13"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases13"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths13"),
    
    plotOutput("casesPlot13"),
    
    plotOutput("deathPlot13"),
    
    
    
    h4("August 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases12"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths12"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases12"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths12"),
    
    plotOutput("casesPlot12"),
    
    plotOutput("deathPlot12"),
    
    
    
    h4("July 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases11"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths11"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases11"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths11"),
    
    plotOutput("casesPlot11"),
    
    plotOutput("deathPlot11"),
    
    
    
    h4("June 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases10"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths10"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases10"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths10"),
    
    plotOutput("casesPlot10"),
    
    plotOutput("deathPlot10"),
    
    
    
    h4("May 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases9"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths9"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases9"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths9"),
    
    plotOutput("casesPlot9"),
    
    plotOutput("deathPlot9"),
    
    
    
    h4("April 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases3"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths3"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases3"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths3"),
    
    plotOutput("casesPlot1"),
    
    plotOutput("deathPlot1"),
    
    
    
    h4("March 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases4"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths4"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases4"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths4"),
    
    plotOutput("casesPlot2"),
    
    plotOutput("deathPlot2"),
    
    
    
    
    h4("Febuary 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases5"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths5"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases5"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths5"),
    
    plotOutput("casesPlot3"), 
    
    plotOutput("deathPlot3"), 
    
    
    
    
    h4("January 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases6"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths6"),
    
    h5("Average and Mean Cases: "),
    verbatimTextOutput("Mean Cases6"),
    
    h5("Average and Mean Deaths"),
    verbatimTextOutput("Mean Deaths6"),
    
    plotOutput("casesPlot4"), 
    
    plotOutput("deathPlot4"),
    
    h4("Data"), 
    tableOutput("View")
    
    
  )
))
