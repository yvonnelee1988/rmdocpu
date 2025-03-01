
#  the following scripts show how to use r to upload summary.txt to the opencpu server as the imput to render an html report
#  then download the report to local storage
#  This function could be done by any script languange, sucha as java, perl or bash
#  by doing this, metalab can have the report easily, without the need to setup the r enviroment, but easily get all the report, especially with
#  various data visualization in the report
#  these report are all html based and could be linked/iframed on the website.


# curl way to make any opencpu request is detailed here: https://www.opencpu.org/api.html


#library(jsonlite)
#library(httr)


# summary.txt----

url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_MQsummary_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")



# upload file and do the rendering
# in this case, the summary.txt is in the working dir. it can be anywhere with the path
# meta file is optional

r <- httr::POST(url_api, body = list(file = httr::upload_file("final_summary.txt")))
#r <- httr::POST(url_api, body = list(file = httr::upload_file("summary1_simple.txt"), meta = httr::upload_file("summary1_meta.txt")))

# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]

# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "maxquant_result_summary.html")









# proteingroups.txt----


url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_proteinGroups_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")


# upload file and do the rendering
# in this case, the proteinGroups.txt is in the working dir. it can be anywhere with the path
# variable r is the returning information from the curl function
r <- httr::POST(url_api, body = list(file = httr::upload_file("final_proteins.txt")))

# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]

path_target

# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "proteinGroups_summary.html")






# peptide.txt test ----


url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_peptides_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")

# upload file and do the rendering
# in this case, the proteinGroups.txt is in the working dir. it can be anywhere with the path
# variable r is the returning information from the curl function
r <- httr::POST(url_api, body = list(file = httr::upload_file("final_peptides.txt")))
r$status_code

# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]
path_target
# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "peptides_summary.html")





# MetaLab_taxonomy.csv ----


url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_taxon_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")

# upload file and do the rendering
# in this case, the proteinGroups.txt is in the working dir. it can be anywhere with the path
# variable r is the returning information from the curl function
r <- httr::POST(url_api, body = list(file = httr::upload_file("BuiltIn.taxa.refine.csv")))

# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]

# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "taxon_summary.html")





# function.csv ----


url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_function_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")

# upload file and do the rendering
# in this case, the proteinGroups.txt is in the working dir. it can be anywhere with the path
# variable r is the returning information from the curl function
r <- httr::POST(url_api, body = list(file = httr::upload_file("function.csv")))

# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]

# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "function_summary.html")
















# R has the “feature” of turning character strings automatically into factor variables.
# This is great, when doing actual statistical work. It is this magic that allows R to turn multinomial variables into
# dummy variables in regression models and produce nice cross tables. When working with APIs, however,
# this “feature” becomes a hinderance. Let’s just turn it off. Note: this call only affects the current session;
# when you restart R, all settings will be back to normal.




#summary_file  <- read_tsv("summary.txt", col_names = TRUE)

#summary_file_json <- toJSON(summary_file)

#tt <- paste0("data = '", t,"'")
#writeLines(tt, "mydata.json")


# test of the file converted back remains the same structure
# mq_smmary <- fromJSON(t)







# url_Server <- "https://cloud.opencpu.org/"
# url <- "https://cloud.opencpu.org/ocpu/library/stats/R/rnorm"


# this is the way hwo to use r to do the  POST job
# r <- RCurl::postForm(url, n=10)
# for parametr
# r <- httr::POST(url, body = list(n=10, mean =5))
# for file uploading
# r <- httr::POST("https://cloud.opencpu.org/ocpu/library/utils/R/read.csv", body = list(file = upload_file("summary.txt")))

# parse the response to get the path
# rawToChar(r$content) # or use toString(r)

#paths <- strsplit(rawToChar(r$content), "\n")[[1]]
#path_target <- paths[grep("DESCRIPTION",paths)]

# download file
#curl::curl_download(paste0(url_Server, path_target), "DESCRIPTION")


# POSt usage examples
# b2 <- "http://httpbin.org/post"
# POST(b2, body = "A simple text string")
# POST(b2, body = list(x = "A simple text string"))
# POST(b2, body = list(y = upload_file(system.file("CITATION"))))
# POST(b2, body = list(x = "A simple text string"), encode = "json")

















