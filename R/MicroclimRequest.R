library(jsonlite)
#' Reference Class for MicroclimRequest for Microclim.org Interaction
#'
#' @description Reference class encapsulating Microclim Request
#' @details MicroclimRequest
#' @author Aji John
#' @keywords API Microclim
#' @export
#' @examples
#'
#' mr <- MicroclimRequest$new(
#'                            latS = 39.40012200014591,
#'                            latN=39.92132255884663,
#'                            lonW=-106.47674560546875,
#'                            lonE=-105.92193603515625,
#'                            variable="ALBEDO",
#'                            shadelevel=0,
#'                            hod=0,
#'                            interval=0,
#'                            aggregation=0,
#'                            stdate="19810101",
#'                            eddate="19810128",
#'                            file="csv")
#'
MicroclimRequest <- setRefClass("MicroclimRequest",
                            fields = list(
                              latS = "numeric",
                              latN="numeric",
                              lonW="numeric",
                              lonE="numeric",
                              variable="character",
                              shadelevel="numeric",
                              hod="numeric",
                              interval="numeric",
                              aggregation="numeric",
                              stdate="character",
                              eddate="character",
                              file="character"
                            ),
                            methods = list(
                              json = function() {
                                # converts the instance fields to JSON
                                mcRqst= toJSON(data.frame(latS=mr$latS,
                                                          latN=mr$latN,
                                                          lonW=mr$lonW,
                                                          lonE=mr$lonE,
                                                          variable=mr$variable,
                                                          shadelevel=mr$shadelevel,
                                                          hod=mr$hod,
                                                          interval=mr$interval,
                                                          aggregation=mr$aggregation,
                                                          stdate=mr$stdate,
                                                          eddate=mr$eddate,
                                                          file=mr$file))
                                return(mcRqst)

                              }
                            )
)
