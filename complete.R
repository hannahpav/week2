complete <- function(directory, id = 1:332) {
       
       ##Read Files in ID
       
       files332 <- list.files(directory)
       readfiles <- lapply(file.path(directory, files332), read.csv)
       
       # create empty vecotor
       
      nobs <- NULL
          
            # loop to read in data  
            for(i in id) {
                  
                  dfttemp <- readfiles[[i]] # read the files into a temp frame
                  nobs_sum <- sum(complete.cases(dfttemp)) # some of the complete
                  
                 nobs <- c(nobs, nobs_sum) #create a vector of all "nobs"
             
                  
             }
       
       data.frame(id, nobs) #create data.frame
}
