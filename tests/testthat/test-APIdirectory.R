library(testthat)
library(jsonlite)

#' We will chain the tests here; get the token
#' and list the avaliable APIs, and other APIs in sucession
#'
context("get API dump")
  test_that('list of avaliable APIs & status of a request is returned',{

    api_token = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')
    expect_that(nchar(api_token),
                equals(167))
    ma <- MicroclimAPI$new(token = api_token,url_mc='http://localhost:3000/')
    expect_that(typeof(ma), equals("S4"))

    apis= ma$apis()
    expect_true(validate(toJSON(apis)))
    # get status of a request - 589292b9fccaf97e5a3cf472
    requestId = '589292b9fccaf97e5a3cf472'
    request_status= ma$status(requestId)
    expect_true(validate(toJSON(request_status)))
  })




