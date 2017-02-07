library(httr)
#' Reference Class for Microclim.org Interaction
#'
#' @description API with all the REST services
#' @details Each service is implemented
#' @author Aji John
#' @keywords API Microclim
#'
#' @export
#' @examples
#' mtoken = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')
#' ma <- MicroclimAPI$new(token = mtoken,url_mc='http://localhost:3000/')
#' apis= ma$apis()
#' jsonlite::prettify(apis)
#'

MicroclimAPI <- setRefClass("MicroclimAPI",
                       fields = list(token = "character",url_mc="character"),
                       methods = list(
                         apis = function() {
                           # use the token to fetch the directory
                           # of the avaliable apis
                           # set the headers
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/apis',sep = "")
                           apis_json = GET(apis_ep, add_headers(Authorization = auth_hdr))
                           return(content(apis_json)$services)

                         },
                         requests = function() {
                           # use the token to fetch the directory
                           # of the avaliable apis
                           # headers
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/requests',sep = "")
                           rqsts_json = GET(apis_ep, add_headers(Authorization = auth_hdr))
                           return(rqsts_json)
                         },
                         status = function(requestId) {
                           # use the token to fetch status of a request.
                           # Id is passed.
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/status',sep = "")
                           rqst_json = GET(apis_ep,query = list(requestId = requestId),add_headers(Authorization = auth_hdr))
                           return(content(rqst_json))
                         }

                       )
)
