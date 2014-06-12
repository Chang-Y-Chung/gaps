# cd to this directory then run this like:
#   $ R CMD BATCH run.R /dev/tty
#
# CTRL-C to stop the server
library(shiny)
runApp('.', display.mode="showcase", launch.browser=TRUE)
