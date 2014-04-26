# run_analysis.R

source("lib_run_analysis.R")

#define data folder name
datafolder <- "UCI HAR Dataset"

#check if samsung data folder exists in the working directory
errormsg <- paste0('\n\nATTENTION!\nSamsung data folder NOT FOUND in the working directory.',
       '\nCurrent name for data folder is: \"',datafolder, '\"',
       '\nCreate data folder or change \"datafolder\" variable value',
       '\nin the script for another Samsung data folder name and run again.')
if( !file.exists(paste0("./",datafolder)) ) {
        stop(errormsg)
} else {

        message("Found Samsung data folder \"UCI HAR Dataset\".\nStart working...")
        data <- runAnalysis(datafolder)
        tidydata <- createTidyData (data)
}

