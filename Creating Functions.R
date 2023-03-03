# Functions in R
#See the BOOK: https://learning.nceas.ucsb.edu/2023-02-arctic/index.html


# Temperature Conversion
airtemps <- c(212, 30.3, 78, 32)

celsius1 <- (airtemps[1]-32)*5/9
celsius2 <- (airtemps[2]-32)*5/9
celsius3 <- (airtemps[3]-32)*5/9
celsius4 <- (airtemps[4]-32)*5/9

# Better if we could do this in a function:
# Function can be assigned to a variable
# Use the function "function"
# Define the arguments of the function
# fahr are the temp values in F
# {} inside is what the function does
# uses fahr variables, substituting airtemps(above) with fahr.
# line 19 object celsius has values of the function

fahr_to_celsius <- function(fahr){
  celsius <- (fahr - 32)*5/9
  return(celsius)
}

# Need to execute so function is defined:
#fahr_to)C is now in environments

# Now use the function:
celsius11 <- fahr_to_celsius(airtemps[1])
celsius14 <- fahr_to_celsius(airtemps[4])


# IMportant to document your functions.
# Always document functions with Roxygen
# Forces you to define each parameter in your function.
# Help you help yourself!!

#Roxygen works well - under Code (above) menu - Insert Roxygen Skeleton
# Highlight the function, then click Insert Roxygen Skeleton
# Roxygen - This info is what generates a help page.


#' Convert Celsius to Fahrenheit
#'
#' Writing here will generate a Description section in the R help page.
#' @param celsius The temperature in Celsius - this appears in parameters in the help page
#'
#' @return The temperature in Fahrenheit
#' @export # if in a package, the function will be available to them via export
#'
#' @examples # here write examples of using this function - which show up in the help page
#' 
celsius_to_fahr <- function(celsius){
  fahr <- (celsius*9/5) + 32
  return(fahr)
}

airtemps_c <- fahr_to_celsius(airtemps)
airtemps_f <- celsius_to_fahr(airtemps)

# Can call this from another project
# Save the file, then
# source("Creating Functions.R")
# Then can use the functions elsewhere



#############################################
#############################################
#############################################

# Now need to make function more re-usable:


#Return a data frame of temperatures:
convert_temps <- function(fahr){
  celsius <- (fahr-32)*5/9
  kelvin <- celsius + 273.15
  temps <- data.frame(fahr = fahr, 
                      celsius = celsius,
                      kelvin = kelvin)
  return(temps)
}

temps_all <- convert_temps(airtemps)

