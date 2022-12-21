complete <- function(directory, id = 1:332) {
       
       ##Read Files in ID
       
       files332 <- list.files(directory)
       readfiles <- lapply(file.path(directory, files332), read.csv)
       
       # create empty dataframe
       
      data <- data.frame(bozo = rep(NA, length(id)), nobs=NA)
        
      #nods_length <- integer(length(id))
          
            #  # loop to read in data  
            for(i in id) {
                  dfttemp <- readfiles[[i]]
                  nobs_sum <- sum(complete.cases(dfttemp))

                 data$nobs[seq_along(id[i])] <- nobs_sum
            #       
            #      #data$id[i] <- i
             }
       
       print(data)
}
      
     # for(i in id) {
     #         dfttemp <- readfiles[[i]]
     #         nobs_sum <- sum(complete.cases(readfiles[[i]]))
     # 
     #         #data$nobs[i] <- nobs_sum
     # 
     #         data$id[i] <- i
     # 
     #   }
#       
#       print(data)
# }

            
      # data.frame(id, sumtrue)
      # sum_true
            
      #       ## calculate the number of items to mean
      #       sum_placeholder <- is.na(dftemp[pollutant])
      #       sum_placeholder_inv <- !sum_placeholder
      #       sum_true <- sum_true + sum(sum_placeholder_inv)}
      # 
      # ## calculate mean
      # totalsum/sum_true
