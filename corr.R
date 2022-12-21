corr <- function(directory, threshold = 0) {
      
      ##Read Files in ID
      
      files332 <- list.files(directory)
      readfiles <- lapply(file.path(directory, files332), read.csv)
      
      files_run <- NULL
      corr_plan <- NULL
      
      source("complete.R")
      
      for(i in 1:length(files332)) {
            
            complete_ind <- complete(directory)
            
            if((complete_ind$nobs[i]) > threshold)
                  {files_run <- c(files_run, i}
                  
      }
      files_run
      }
      