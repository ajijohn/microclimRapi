library(testthat)
library(jsonlite)



#' We will chain the tests here; get the token
#' and download artifacts of an extract request
#'
context("Download request artifacts")
test_that('artifact was downloaded',{

  # key, secret and rest endpoint url
  # Endpoint - URL - 'microclim.org/' when used with the service
  api_token = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')

  expect_that(nchar(api_token),
              equals(167))
  ma <- microclimRapi:::MicroclimAPI$new(token = api_token,url_mc='http://localhost:3000/')

  requestId = '589ce9a4b2df447c910f7d59'

  # place a request to fetch the files
  ftch_req= ma$fetch(requestId)

  #output <- file(tmp <- tempfile(), open = "wb")
  ncD <-  ma$download(requestId,ftch_req$files[[1]]$Key)

  #File name has request id as part of it
  writeBin(ncD, strsplit(ftch_req$files[[1]]$Key, "/")[[1]][2])

  expect_true(file.exists(strsplit(ftch_req$files[[1]]$Key, "/")[[1]][2]))
  # delete the temporary file..
  file.remove( strsplit(ftch_req$files[[1]]$Key, "/")[[1]][2])

  #should be in teardown to remove the file

})
