corr <- function(directory, threshold = 0) {
      
      ##Read Files in ID
      
      files332 <- list.files(directory)
      readfiles <- lapply(file.path(directory, files332), read.csv)
      
      files_run <- NULL
      corr_plan <- NULL
      
      source("complete.R")
      
      complete_ind <- complete(directory)
      
      for(i in 1:length(files332)) {
            
            if((complete_ind$nobs[i]) > threshold) {
                 files_run <- c(files_run, i)}
                 }
      
      #print(files_run)
      
      for(i in (files_run)) {
            dftemp <- readfiles[[i]]
            corr_each <- cor(dftemp["sulfate"], dftemp["nitrate"])
            corr_plan <- c(corr_plan, corr_each)
      }
      
      coor_plan
      
}

