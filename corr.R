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
      
     # files_run}
      
      for(j in (files_run)) {
            dftemp <- readfiles[[j]]
           
            whole_sulfate <- dftemp[["sulfate"]]
            real_sulfate <- whole_sulfate[!is.na(whole_sulfate)]
            
            whole_nitrate <- dftemp[["nitrate"]]
            real_nitrate <- whole_nitrate[!is.na(whole_nitrate)]
            
            corr_each <- cor(real_sulfate, real_nitrate)
            corr_plan <- c(corr_plan, corr_each)
      }
      
      corr_plan
      
}
