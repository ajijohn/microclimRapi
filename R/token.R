library(httr)
#' Get the API token
#'
#' @description API wrapper to interact with microclim.org.
#' @details Token is 167 characters in length, it has the user id encoded as part of it
#' @author Aji John
#' @param apikey API Key
#' @param apisec API Secret
#' @param url_endpoint Microclim Authentication endpoint
#' @return API token (valid for 2 hours)
#' @keywords API Microclim
#'
#' @export
#' @examples
#' mtoken = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')
getToken <- function(apikey,apisec,url_endpoint){

  url_site <- paste(url_endpoint, "api/auth",sep = "")
  body <- list(apikey = apikey, apisecret = apisec)

  # JSON encoded for keys
  r <- POST( url_site, body = body, encode = "json")

  return(content(r)$token)

}
