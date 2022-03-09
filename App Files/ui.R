
#install.packages("devtools") # Install the devtools package
#library(devtools) # Load the devtools package.
#install_github("SOLV-Code/MetricsCOSEWIC", dependencies = TRUE, build_vignettes = FALSE)
#library(MetricsCOSEWIC)




# Think it needs these here for the server deployment
# shiny deployment looks for library(), so need that too in order to get the dependencies)
source("R/3c_HelperFunctions_ModelSetup.R")
source.modules("R/")
load_or_install(c("ggplot2","DT","markdown","rmarkdown","shiny","shinydashboard","shinyjqui","shinyFiles"))
library("ggplot2")
library("DT")
library("markdown")
library("rmarkdown")
library("shiny")
library("shinydashboard")
library("shinyjqui")
library("shinyFiles")
library("shinybusy")
library("MetricsCOSEWIC")








navbarPage("MetricsCOSEWIC", id = "MainTab",


	 tabPanel("Disclaimer",

fluidPage(

  titlePanel("Disclaimer"),

  fluidRow(
    column(8,
	  includeMarkdown("Markdown/disclaimer.md")
    )
  )
)



	  ),  # end Help tab panel




#######
 tabPanel("Data Loading", value= "data.loading",

pageWithSidebar(
  headerPanel("Data Loading"),

  sidebarPanel(
			  tags$h4("Data File"),
			  tags$hr(),
			  fileInput("file.name.2", "Choose CSV File", accept = c("text/csv","text/comma-separated-values,text/plain", ".csv")    ),
			  tags$hr() ,
			  tags$a("Get Some Sample Data",href="https://drive.google.com/drive/folders/1y1d0TF8v2kWWbHXkTaK0mb3BQjUc7xrZ?usp=sharing",target="_blank")
			) # end sidebar
  ,

     mainPanel(

			div(style = "height:500px; overflow-y: scroll;overflow-x: scroll;",
					tableOutput("inputheader.table"),height = "400px",width = "200px")


		) # end main panel

		) #end page with side bar for  data loading
  ),  # end  second tab panel





#######
tabPanel("General Settings", value= "general.settings",

				 tags$h4("Moved this here, because the explore tab was getting crowded..."),
				 				 tags$hr(style = "border-top: 1px solid #000000;"),
				 tags$h4("Scaling and Labels"),
				 numericInput("abd.rescale", "Scale for Abundance", value=1),
				 textInput("abd.label", "Abd Label", value = "Abundance"),
				 tags$hr(style = "border-top: 1px solid #000000;"),
				 tags$h4("BM and Metric Settings"),
				 numericInput("prob.decl.bm", "Prob Decl BM", value= -25, min = -90, max=0,step = 1),
				 tags$hr(style = "border-top: 1px solid #000000;"),
				 tags$h4("MCMC Settings"),
				 numericInput("n.chains", "Number of Chains", value=3),
				 numericInput("n.iter", "Number of Samples/Chain", value=120000),
				 numericInput("n.burnin", "Burnin (Discard)", value=20000),
				 numericInput("n.thin", "Thinning (Keep every nth sample)", value=10)


				 #tags$h4("Data Treatment Settings"),
				 #	checkboxInput("cov.rescale", label="SibReg Complex: Rescale Covariates?", value = TRUE ),
				 #tags$h4("Display Settings"),
				 #numericInput("table.decimals", label=h5("Number of Decimals shown in tables and figures (NOT YET LINKED)"),
				 #						 value = 0 , min = 0, max = 10, step = 1,   width = "40%"),
				 #textInput("axis.label", label=h5("Forecasted Variable"), value = "Abundance", width = "40%"),
				 #checkboxInput("show.equ","Show model equations in figures (not linked yet)",value=FALSE)
				 #uiOutput("axis.label.sel")

),  # end  general settings panel



####################################


tabPanel("Decline Estimates", value= "probdecl",


				 pageWithSidebar(
				 	headerPanel("Decline Estimates"),

				 	sidebarPanel(
				 		add_busy_spinner(spin = "fading-circle"),
				 		uiOutput("du.list.menu"),
				 		uiOutput("time.window.slider1"),
				 		uiOutput("time.window.slider2"),
				 		uiOutput("endyr.slider"),
				 		tags$hr(style = "border-top: 1px solid #000000;"),
				 		checkboxGroupInput("fit.settings", label="Fit Settings",
				 											 choices=c("Fit to ln(Abundance)?" = "log","Use Bayesian MCMC?" = "Bayesian")   ,
				 											 selected = c("log") , inline = TRUE),
				 		tags$hr(style = "border-top: 1px solid #000000;"),
				 		uiOutput("priors.p.intercept"),
				 		uiOutput("priors.tau.intercept"),
				 		uiOutput("priors.p.slope"),
				 		uiOutput("priors.tau.slope")

				 	) # end sidebar
				 	,


				 	mainPanel(


				 		tabsetPanel(type = "tabs",
				 								tabPanel("Full Time Series",
				 												 plotOutput("plot.full.series",width = "100%", height = "600px")),
				 								tabPanel("Fitted Trend",
				 												 plotOutput("plot.fit",width = "100%", height = "600px")),
				 								#conditionalPanel(condition = "'Bayesian' %in% input['fit.settings']",
				 								tabPanel("Summary", DT::dataTableOutput("table.mcmc")), #),
				 								#conditionalPanel(condition = "'Bayesian' %in% input['fit.settings']",
				 								tabPanel("MCMC Diagnostics")#) # end conditional panel



				 		) # end tabsetpanel
				 	) # end main panel

				 ) #end page with side bar for model pre-check



),


######################################




#tabPanel("Run Retrospective Test", value= "retrospective",
#				 pageWithSidebar(
#				 	headerPanel("Retrospective"),
#				 	sidebarPanel(
#				 	) # end sidebar
#				 	,
#				 	mainPanel(
#				 	) # end main panel
#				 ) #end page with side bar for model pre-check
#),

####################################


	 tabPanel("Help",  value= "help.panel",

fluidPage(

  titlePanel("Help Page"),

  fluidRow(
    column(8,
	  includeMarkdown("Markdown/help.md")
    )
  )
)



	  ),  # end Help tab panel

	tabPanel("About",

fluidPage(

  titlePanel("About ForecastR"),

  fluidRow(
    column(8,
      includeMarkdown("Markdown/about.md")
    )
  )
)
	  )  # end about tab panel



) # end navbar Page


