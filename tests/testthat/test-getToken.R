library(testthat)

#' Might be a rudimentary test, but what are esuring is that there is a token
#' which is returened by the REST endpoint.

context('getToken')
test_that('token fetched',{
  expect_that(nchar(getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')),
  equals(167))

})
