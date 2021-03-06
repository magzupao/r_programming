#####################################################################
# programming assignment 1: Course Project
# r-programming
# Marco Guado Zavaleta, mguado@gmail.com
# Octubre 2016
#####################################################################

pollutantmean <- function(path.files, pollutant, id = 0) {

  #We store all file names
  list.filenames <- list.files(path.files, pattern="*.csv")
  
  #numercia list that stores all values, useful to determine the median
  list.values <- numeric()
  
  if(id == 0){
    id = 332
  }
  
  for(i in c(id) ) {
    
    #file name processing
    filename <- paste(path.files, list.filenames[i], sep = "/")
    
    #load the file contents
    df.File <- read.csv(filename, head=TRUE, sep=",")
    
    #filter by sulfate or nitrate
    if(pollutant == "sulfate"){
      valores <- df.File$sulfate[!is.na(df.File$sulfate)]
    }
    else{
      valores <- df.File$nitrate[!is.na(df.File$nitrate)]
    }
    
    #It contains all values for each interaction
    list.values <- append(list.values, valores)
  }
  return(mean(list.values))
  
}
