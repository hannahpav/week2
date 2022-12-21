corr <- function(directory, threshold = 0) {
      
      ##Read Files in ID
      
      files332 <- list.files(directory)
     # readfiles <- lapply(file.path(directory, files332), read.csv)
      
      files_run <- NULL
      corr_plan <- NULL
      
      source("complete.R")
      
      complete_ind <- complete(directory)
      complete_thr <- complete_ind[complete_ind$nobs>=threshold,]
      
      for(i in complete_thr$id) {
            
            readfiles <- lapply(file.path(directory, files332[i]), read.csv)
            
            dftemp <- readfiles[[1]]
            
            whole_sulfate <- dftemp[["sulfate"]]
            real_sulfate <- whole_sulfate[!is.na(whole_sulfate)]
            
            whole_nitrate <- dftemp[["nitrate"]]
            real_nitrate <- whole_nitrate[!is.na(whole_nitrate)]
            
            corr_each <- cor(real_sulfate, real_nitrate)
            corr_plan <- c(corr_plan, corr_each)
                 }
      
     # files_run}
#       
#       for(j in (files_run)) {
#             dftemp <- readfiles[[j]]
#            
#             whole_sulfate <- dftemp[["sulfate"]]
#             real_sulfate <- whole_sulfate[!is.na(whole_sulfate)]
#             
#             whole_nitrate <- dftemp[["nitrate"]]
#             real_nitrate <- whole_nitrate[!is.na(whole_nitrate)]
#             
#             corr_each <- cor(real_sulfate, real_nitrate)
#             corr_plan <- c(corr_plan, corr_each)
#       }
#       
      corr_plan

}
