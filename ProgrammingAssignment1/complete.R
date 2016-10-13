#####################################################################
# programming assignment 1: Course Project
# r-programming
# Marco Guado Zavaleta, mguado@gmail.com
# Octubre 2016
#####################################################################
complete  <- function(path.files, id) {

  #We store all file names
  list.filenames <- list.files(path.files, pattern="*.csv")
  
  id.file <- integer()
  num.filas <- integer()
  
  for(i in c(id) ) {
    
    #file name processing
    filename <- paste(path.files, list.filenames[i], sep = "/")
    
    #load the file contents
    df.File <- read.csv(filename, head=TRUE, sep=",")
    
    filas <- length(df.File$sulfate[!is.na(df.File$sulfate)])
    
    id.file <- append(id.file, i)
    num.filas <- append(num.filas, filas)
    
  }
  
  rspta <- data.frame(id.file , num.filas)
  
  #rspta.names <- c("id", "nobs")
  colnames(rspta) <- c("id", "nobs")
  
  rspta
  
}
#a <- complete ("specdata", 1:10)
