flag <- as.logical(Sys.getenv('R_CHECK_TESTS'))
if(!is.na(flag)) {
  if(flag == TRUE) {
    library('testthat')
    test_check('microclimRapi')
  }
} else {
  message('Intentionally set to FALSE, Set the system variable R_CHECK_TESTS to TRUE to run all the tests.')
}
