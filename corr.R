corr <- function(directory, threshold = 0) {
      
      ##Read Files in ID
      
      files332 <- list.files(directory)
     
      corr_plan <- NULL # create empty vector
      
      source("complete.R") # call on the code from before
      
      complete_ind <- complete(directory) #get all the complete values
      # create a data.frame that only uses those values above the threshold
      complete_thr <- complete_ind[complete_ind$nobs>=threshold,]
      
      for(i in complete_thr$id) {
            #read in the files based on what's above the threshold
            readfiles <- lapply(file.path(directory, files332[i]), read.csv)
            
            dftemp <- readfiles[[1]] #dataframe for only one at a time
            
            dftemp_clean <- na.omit(dftemp) #get rid of all NA rows
            
            sulfate <- dftemp_clean[["sulfate"]] #extract sulfate
            nitrate <- dftemp_clean[["nitrate"]] # extract nitrate
            
            corr_each <- cor(sulfate, nitrate) #correlate
            corr_plan <- c(corr_plan, corr_each) #add all these to a vector
                 }

      corr_plan

}
