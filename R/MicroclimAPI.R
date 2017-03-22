#' Reference Class for Microclim.org Interaction
#'
#' @description API with all the REST services
#' @details Each service is implemented
#' @author Aji John
#' @keywords API Microclim
#' @importFrom httr GET
#' @importFrom httr POST
#' @importFrom httr content
#' @export
#' @examples
#' \dontrun{
#' mtoken = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')
#' ma <- MicroclimAPI$new(token = mtoken,url_mc='http://localhost:3000/')
#' apis= ma$apis()
#' jsonlite::prettify(apis)
#' }
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
                           apis_json = httr::GET(apis_ep, add_headers(Authorization = auth_hdr))
                           return(httr::content(apis_json)$services)

                         },
                         requests = function() {
                           # use the token to fetch the directory
                           # of the avaliable apis
                           # headers
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/requests',sep = "")
                           rqsts_json = httr::GET(apis_ep, add_headers(Authorization = auth_hdr))
                           return(rqsts_json)
                         },
                         status = function(requestId) {
                           # use the token to fetch status of a request.
                           # Id is passed.
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/status',sep = "")
                           rqst_json = httr::GET(apis_ep,query = list(requestId = requestId),add_headers(Authorization = auth_hdr))
                           return(httr::content(rqst_json))
                         },
                         request = function(mr) {
                           # use the token to fetch status of a request.
                           # Id is passed.
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/request',sep = "")

                           rqst_json = httr::POST(apis_ep, body = mr$mreq_list(), add_headers(Authorization = auth_hdr), encode = "json")

                           return(httr::content(rqst_json))
                         },
                         poke = function(requestId) {
                           # use the token to fetch status of a request.
                           # Id is passed.
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/poke',sep = "")
                           poke = httr::GET(apis_ep,add_headers(Authorization = auth_hdr))
                           return(httr::content(poke_json))
                         },
                         fetch = function(requestId) {
                           # use the token to fetch status of a request.
                           # Id is passed.
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/fetch',sep = "")
                           rqst_json = httr::GET(apis_ep,query = list(requestId = requestId),add_headers(Authorization = auth_hdr))
                           return(httr::content(rqst_json))
                         },
                         download = function(requestId,fileName) {
                           # use the token to fetch the generated file of a request.
                           # Id is passed.
                           auth_hdr = paste('Bearer ',token,sep = "")
                           # set the REST endpoint
                           apis_ep = paste(url_mc,'microclim/download',sep = "")
                           rqst_file = httr::GET(apis_ep,query = list(requestId = requestId,fileKey=fileName),add_headers(Authorization = auth_hdr))
                           #print(http_type(rqst_file))
                           #browser()
                           return(rqst_file$content)
                         }

                       )
)
