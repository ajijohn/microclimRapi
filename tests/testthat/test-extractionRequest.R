library(testthat)
library(jsonlite)

#' We will chain the tests here; get the token
#' and place a request
#'
context("Place extraction request")
test_that('request was placed',{

  api_token = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')
  expect_that(nchar(api_token),
              equals(167))
  ma <- MicroclimAPI$new(token = api_token,url_mc='http://localhost:3000/')
  expect_that(typeof(ma), equals("S4"))

  #prepare the request
  mr <<- MicroclimRequest$new(
                  latS = 39.40012200014591,
                  latN=39.92132255884663,
                  lonW=-106.47674560546875,
                  lonE=-105.92193603515625,
                  variable="ALBEDO",
                  shadelevel=0,
                  hod=0,
                  interval=0,
                  aggregation=0,
                  stdate="19810101",
                  eddate="19810128",
                  file="csv")

  # place a request
  ext_req= ma$request(mr)
  expect_true(validate(toJSON(ext_req)))

})



