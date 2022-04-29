library(shiny);

 
shinyUI(pageWithSidebar(
  

  headerPanel("SVBook COVID 19 Dashboard Beta"),
  
  
  

  sidebarPanel(
    
    selectInput("Countries", "Countries: ", selected = "Singapore", choices = c("Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Anguilla", "Antigua_and_Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bonaire, Saint Eustatius and Saba", "Bosnia_and_Herzegovina", "Botswana", "Brazil", "British_Virgin_Islands", "Brunei_Darussalam", "Bulgaria", "Burkina_Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape_Verde", "Cases_on_an_international_conveyance_Japan", "Cayman_Islands", "Central_African_Republic", "Chad", "Chile", "China", "Colombia", "Congo", "Costa_Rica", "Cote_dlvoire", "Croatia", "Cuba", "Curaçao", "Cyprus", "Czechia", "Democratic_Republic_of_the_Congo", "Denmark", "Djibouti", "Dominica", "Dominican_Republic", "Ecuador", "Egypt", "El_Salvador", "Equatorial_Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Falkland_Islands_(Malvinas)", "Faroe_Islands", "Fiji", "Finland", "France", "French_Polynesia", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea_Bissau", "Guyana", "Haiti", "Holy_See", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle_of_Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Mauritania", "Mauritius", "Mexico", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nepal", "Netherlands", "New_Caledonia", "New_Zealand", "Nicaragua", "Niger", "Nigeria", "North_Macedonia", "Northern_Mariana_Islands", "Norway", "Oman", "Pakistan", "Palestine", "Panama", "Papua_New_Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto_Rico", "Qatar", "Romania", "Russia", "Rwanda", "Saint_Kitts_and_Nevis", "Saint_Lucia",  "Saint_Vincent_and_the_Grenadines", "San_Marino", "Sao_Tome_and_Principe", "Saudi_Arabia", "Senegal", "Serbia", "Seychelles", "Sierra_Leone", "Singapore", "Sint_Maarten", "Slovakia", "Slovenia", "Somalia", "South_Africa", "South_Korea", "South_Sudan", "Spain", "Sri_Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Taiwan", "Thailand", "Timor_Leste", "Togo", "Trinidad_and_Tobago", "Tunisia", "Turkey", "Turks_and_Caicos_islands", "Uganda", "Ukraine", "United_Arab_Emirates",  "United_Kingdom", "United_Republic_of_Tanzania", "United_States_of_America", "United_States_Virgin_Islands", "Uruguay", "Uzbekistan", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe")), 
    
    
    
    sliderInput("day", 
                "Predicted No. of Cases for Day:", 
                min = 1,
                max = 31, 
                value = 19)
    
    
  ),
  

  mainPanel(
    h3("COVID 19 Dashboard"),
    h4("Created by: Eric Goh, M.Tech. , M. B. A. , G.Dip. , B. Sc."),
    h4("Email: gohminghui88@gmail.com"),
    HTML("<br />"),
    
    h3("Data from European Centre for Disease Prevention and Control"), 
    p("- Data on 14-day notification rate of new COVID-19 cases and deaths"),
    p("- historical data (to 14 December 2020) on the daily number of new reported COVID-19 cases and deaths worldwide"),
    HTML("<br />"),
    
    
    h4("Prediction"),
    h5("Predicted No. of Cases based on regressions and Nov 2020 data. If higher than this amount, it is not good. "),
    verbatimTextOutput("PredictedCas1"),
    
    HTML("<br />"),
    h4("2020 to Present"),
    HTML("<br />"),
    h4("Country"), 
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases1"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths1"),
    
    h5("Weekly Average Cases: "),
    verbatimTextOutput("Mean Cases1"),
    
    h5("Weekly Average Deaths"),
    verbatimTextOutput("Mean Deaths1"),
    
    plotOutput("casesPlot17"),
    
    plotOutput("deathPlot17"),
    
    
    h4("Cumulative"),
    
    plotOutput("casesPlot19"),
    
    plotOutput("deathPlot19"),
    
    
    
    h4("World"), 
    
    
    h5("World Total Cases"),
    verbatimTextOutput("WTotalCases"),
    
    h5("World Total Deaths"),
    verbatimTextOutput("WTotalDeaths"),
    
    h5("Weekly Average Cases"),
    verbatimTextOutput("WMeanCases"),
    
    h5("Weekly Average Deaths"),
    verbatimTextOutput("WMeanDeaths"),
    
    h5("COVID 19 Plot Generated using year 2022 week 15 data. The map works on my PC, but not generated on Shiny server. I upload it as image. "),
    img(src='http://svbook.com/images/mpa1.png', align = "left", height='400',width='800'),
    
    plotOutput("casesPlot20"),
    
    plotOutput("casesPlot18"),
    
    plotOutput("deathPlot18"),
    
    
    
    
    HTML("<br />"),
    h4("2020"),
    HTML("<br />"),
    h4("Country"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases2"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths2"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases2"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths2"),
    
    plotOutput("distPlot"),
    
    
    
    

    
    
    h4("December 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases16"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths16"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases16"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths16"),
    
    plotOutput("casesPlot16"),
    
    plotOutput("deathPlot16"),
    
    
    
    h4("November 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases15"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths15"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases15"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths15"),
    
    plotOutput("casesPlot15"),
    
    plotOutput("deathPlot15"),
    
    
    
    h4("October 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases14"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths14"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases14"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths14"),
    
    plotOutput("casesPlot14"),
    
    plotOutput("deathPlot14"),
    
    
    
    
    h4("September 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases13"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths13"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases13"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths13"),
    
    plotOutput("casesPlot13"),
    
    plotOutput("deathPlot13"),
    
    
    
    h4("August 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases12"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths12"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases12"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths12"),
    
    plotOutput("casesPlot12"),
    
    plotOutput("deathPlot12"),
    
    
    
    h4("July 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases11"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths11"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases11"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths11"),
    
    plotOutput("casesPlot11"),
    
    plotOutput("deathPlot11"),
    
    
    
    h4("June 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases10"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths10"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases10"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths10"),
    
    plotOutput("casesPlot10"),
    
    plotOutput("deathPlot10"),
    
    
    
    h4("May 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases9"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths9"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases9"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths9"),
    
    plotOutput("casesPlot9"),
    
    plotOutput("deathPlot9"),
    
    
    
    h4("April 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases3"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths3"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases3"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths3"),
    
    plotOutput("casesPlot1"),
    
    plotOutput("deathPlot1"),
    
    
    
    h4("March 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases4"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths4"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases4"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths4"),
    
    plotOutput("casesPlot2"),
    
    plotOutput("deathPlot2"),
    
    
    
    
    h4("Febuary 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases5"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths5"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases5"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths5"),
    
    plotOutput("casesPlot3"), 
    
    plotOutput("deathPlot3"), 
    
    
    
    
    h4("January 2020"),
    
    h5("Total Cases: "),
    verbatimTextOutput("Total Cases6"),
    
    h5("Total Deaths: "),
    verbatimTextOutput("Total Deaths6"),
    
    h5("Daily Average Cases: "),
    verbatimTextOutput("Mean Cases6"),
    
    h5("Daily Average Deaths"),
    verbatimTextOutput("Mean Deaths6"),
    
    plotOutput("casesPlot4"), 
    
    plotOutput("deathPlot4"),
    
    
    
    
    
    h4("Data"), 
    
    
    tabsetPanel(type = "tabs",
    
        tabPanel(   "Deaths and Cases, Country", tableOutput("View")   ),
        tabPanel(   "World", tableOutput("View2")   ),
        tabPanel(   "Historical Data (to 14 December 2020)", tableOutput("View3")   )
                
                
    )  
    
    
  )
))
