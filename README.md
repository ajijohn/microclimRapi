microclimRapi
=============



[![Build Status](https://travis-ci.org/trenchproject/microclimRapi.svg?branch=master)](https://travis-ci.org/trenchproject/microclimRapi)



`microclimRapi` gives you the ability to interact with [MCLIM](http://www.microclim.org/) via their REST APIs. `microclimRapi` implements all the APIs provided by MCLIM. It is designed to be a convenience package shielding the user from the API internals.

Tutorials:

* [Getting started vignette - the intro to the package](vignettes/Usage.Rmd)

## Package API

The `microclimRapi` package API follows the MCLIM API, which has the following sections:
`microclim_request()` -
`microclim_fetch()` -
`microclim_poke()` -
`microclim_requests()` -
`microclim_download()` -


The MCLIM API documentation is a (<http://microclim.org/APIs>).

## Installation


```r
install.packages("microclimRapi")
```

Alternatively, install development version


```r
install.packages("devtools")
devtools::install_github("trenchproject/microclimRapi")
```

## Housekeeping
```r
library("microclimRapi")
library("jsonlite")
```


## Get the token

```r
  api_token = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')
  ma <- MicroclimAPI$new(token = api_token,url_mc='http://localhost:3000/')
```

## Put in extraction request

Gives the bounding box as region of interest, with date range and choice of variable.


```r

  mr <- microclimRapi:::MicroclimRequest$new(
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
  print(toJSON(ext_req))
```

## Checking the status of a request

Pass a request(aka tracking Id)


```r
  requestId = '589292b9fccaf97e5a3cf472'
  request_status= ma$status(requestId)
  print(toJSON(request_status))
```


## Meta

* Please [report any issues or bugs](https://github.com/trenchproject/microclimRapi/issues).
* License: MIT
* Get citation information for `microclimRapi` in R doing `citation(package = 'microclimRapi')`

