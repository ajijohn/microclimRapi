library(testthat)
library(jsonlite)
library(ncdf4)


#' We will chain the tests here; get the token
#' and download artifacts of an extract request
#'
context("Download request artifacts")
test_that('artifact was downloaded',{

  api_token = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')
  expect_that(nchar(api_token),
              equals(167))
  ma <- microclimRapi:::MicroclimAPI$new(token = api_token,url_mc='http://localhost:3000/')
  expect_that(typeof(ma), equals("S4"))

  requestId = '589ce9a4b2df447c910f7d59'
  fileName='ALBEDO_output_interval-hourly_aggregation-inst_times-19810101-19810131_created-2017-02-09-2214.nc'

  #output <- file(tmp <- tempfile(), open = "wb")
  # download the request artifact
  ncD <-  ma$download(requestId,fileName)
  writeBin(ncD, fileName)

    # open a NetCDF file
  ncin <- nc_open(fileName)
  print(ncin)
  lon <- ncvar_get(ncin, "lon")
  nlon <- dim(lon)
  print(nlon)

  #The dimemsions of lat/long is always two
  expect_that(2,equals(2))

})
