
complete <- function(directory, id) 
  
{
  
  files_list      <- data.frame(list.files(directory)) 
  files_list_full <- list.files(directory, full.names=TRUE)
  
  counter  <- length(id)
  dat      <- data.frame()  
  datA     <- data.frame()  
  datB     <- data.frame()  
  
  for(i in 1:counter) 
    
  {
    
    dat1     <- read.csv(files_list_full[id[c(i)]])
    dat1good <- complete.cases(dat1)
    dat2     <- NROW(dat1[dat1good,])
    
    datA      <- rbind(datA , id[i])  
    datB      <- rbind(datB , dat2)  
    
  } 
  
  
  dat <- cbind(datA, datB)
  colnames(dat)[1] <- "id"
  colnames(dat)[2] <- "nobs"
  dat
  
}



