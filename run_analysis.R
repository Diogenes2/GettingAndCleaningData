runanalysis <- function(Folder){ ## All the function needs is the folder where the unzipped files are.
        
        dirlist <- list.dirs(Folder)
        for (i in 1:length(dirlist))
                {
                trainfile <- (list.files(dirlist[i], pattern = '*X_train.txt', full.names = TRUE))
                testfile <- (list.files(dirlist[i], pattern = '*X_test.txt', full.names = TRUE))
                namesfile <- (list.files(dirlist[i], pattern = '*features.txt', full.names = TRUE))
                oneacv <- (list.files(dirlist[i], pattern = "y_train.txt", full.names = TRUE))
                twoacv <- (list.files(dirlist[i], pattern = "y_test.txt" , full.names = TRUE))
                subtest <- (list.files(dirlist[i], pattern = "subject_test.txt", full.names = TRUE))
                subtrain <- (list.files(dirlist[i], pattern = "subject_train.txt", full.names = TRUE))
                if(length(subtest!=0))lstest <- read.table(subtest)
                if(length(subtrain!=0))lstrain <- read.table(subtrain)
                if(length(trainfile!=0)) { qq <- read.table(trainfile) }
                if(length(testfile!=0)) { ww <- read.table(testfile)}
                if(length(namesfile!=0)) { colnameslist <- read.table(namesfile)}
                if ((length(oneacv) != 0) & (length(oneacv) != 3)) { actfirst <- read.table(oneacv[1])}
                if ((length(twoacv) != 0) & (length(twoacv) != 3)) { actsecond <- read.table(twoacv[1])}
                
        }
        
        newdf <- rbind(qq,ww)
        dfcnames <- as.vector(colnameslist[,2], mode = "character")
        colnames(newdf) <- dfcnames
        dfactcolone <- as.vector(actfirst[,1], mode = "integer")  
        dfactcoltwo <- as.vector(actsecond[,1], mode = "integer")
        dfsubcolone <- as.vector(lstest[,1], mode = "integer")
        dfsubcoltwo <- as.vector(lstrain[,1], mode = "integer")
        Subject <- append(dfsubcolone, dfsubcoltwo)
        activity <- append(dfactcolone, dfactcoltwo)
        colnumbers <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)
        dfofmeansandstds <- newdf[,colnumbers]
        dfwactivities <- cbind(dfofmeansandstds, activity)
        dfwactivities$activity[dfwactivities$activity == 1] <- "Walking"
        dfwactivities$activity[dfwactivities$activity == 2] <- "Walking Upstairs"
        dfwactivities$activity[dfwactivities$activity == 3] <- "Walking Downstairs"
        dfwactivities$activity[dfwactivities$activity == 4] <- "Sitting"
        dfwactivities$activity[dfwactivities$activity == 5] <- "Standing"
        dfwactivities$activity[dfwactivities$activity == 6] <- "Laying"
        dfwsaa <- cbind(dfwactivities, Subject)
        colnames(dfwsaa)[67] <- "Activity"
        meanslist <- list()
        for (i in 1:30){
                vec <- numeric(66)
                for (j in 1:66){
                        vec[j] <- mean(dfwsaa[,j][dfwsaa$Subject == i])
                        
                }
                meanslist[[i]] <- vec        
        }
        meanzlist <- list()
        for (i in 1:6){
                vect <- numeric(66)
                for (j in 1:66){
                        actfromnum <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")
                        vect[j] <- mean(dfwsaa[,j][dfwsaa$Activity == actfromnum[i]])
                        
                }
                meanzlist[[i]] <- vect 
        }
        
        minidf <- do.call("rbind",meanslist)
        minierdf <- do.call("rbind",meanzlist)
        minidf <- data.frame(minidf)
        minierdf <- data.frame(minierdf)
        mdf <- rbind.data.frame(minidf,minierdf)
        columnnames <- colnames(dfofmeansandstds)
        colnames(mdf) <- columnnames
        
        rownameslist <- list()
        for (i in 1:30){rownameslist[i] <- paste("Means for subject number", i)}
        rownameslist <- append(rownameslist, values = c("Means for Walking", "Means for Walking Upstairs", "Means for Walking Downstairs", "Means for Sitting", "Means for Standing", "Means for Laying"))
        rownames(mdf) <- rownameslist
        return(mdf)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
                
        #}
        
}