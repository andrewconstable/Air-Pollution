corr <- function(directory = character(length = 1), threshold = 0) {
        if (directory != "specdata") {
                print("directory argument is 'specdata' ")
                return()
        }        
        dir <- "C:/Users/Andrew/rprog_coursera/specdata/rprog_data_specdata/specdata"
        setwd(dir)
        clean_dat <- read.csv("clean_dat.csv", row.names = 1)
        x <- double()
        result <- double()
        for (i in 1:332) {
                if (nrow(subset(clean_dat, ID == i)) > threshold) {
                        x[i] <- cor(clean_dat[which(clean_dat[, "ID"] == i),]$nitrate,
                                clean_dat[which(clean_dat[, "ID"] == i),]$sulfate)
                }
        }
        x <- na.omit(x)
        if (length(x) > 0) {
                for (l in c(1:length(x))) {
                        result[l] <- x[l]
                }
        } else {result <- numeric(length = 0)}
        
        result
}


