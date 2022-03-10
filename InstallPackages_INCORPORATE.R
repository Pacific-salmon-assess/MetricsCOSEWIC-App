

install.packages("ggplot2")
install.packages("DT")
install.packages("markdown")
install.packages("rmarkdown")
install.packages("shiny")
install.packages("shinydashboard")
install.packages("shinyjqui")
install.packages("shinyFiles")
install.packages("shinybusy")


install.packages("devtools") # Install the devtools package
library(devtools) # Load the devtools package.
install_github("SOLV-Code/MetricsCOSEWIC", dependencies = TRUE, build_vignettes = FALSE)
library(MetricsCOSEWIC)
