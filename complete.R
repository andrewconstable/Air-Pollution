complete <- function(directory = character(length = 1), id = integer(length = 1)) {
        if (directory != "specdata") {
                print("directory argument is 'specdata' ")
                return()
        }
        dir <- "C:/Users/Andrew/rprog_coursera/specdata/rprog_data_specdata/specdata"
        setwd(dir)
        files_list <- list.files(dir, full.names = TRUE)
        dat <- data.frame()
        nobs <- integer(length = length(id))
        x <- integer()
        for (i in id) {
                dat <- rbind(dat, read.csv(files_list[i]))
                x[i] <- sum(complete.cases(dat[which(dat[, "ID"] == i),]))
                x <- na.omit(x)
        }
        for (l in c(1:length(x))) {
                nobs[l] <- x[l]
        }
        #nobs
        df <- data.frame(id, nobs)
        df
}

