#' Call a Memoized Function
#'
#' @param fcn a function
#' @param ... the arguments to the function
#'
#' @return result of memoized function
#'
#' @note If the environment variable DEBUG_SIMPLERCACHE is set, then the
#' keyHash will be outputted. This can be used to identify cache RDS files.
#'
#' @importFrom digest digest
memoizedCall <- function(fcn, ...) {
  # 1. Look for memoized results
  key <- list(fcn=deparse(fcn), ...)

  keyHash <- digest(key)
  filename <- keyHash

  if(Sys.getenv("DEBUG_SIMPLERCACHE") != "") {
    cat("keyHash: ", keyHash, "\n")
  }
  
  if(Sys.getenv("PREFIX_SIMPLERCACHE") != "") {
    filename <- paste0(Sys.getenv("PREFIX_SIMPLERCACHE"), "_", keyHash)
  }

  pathname <- file.path(getOption("simpleRCacheRoot"), paste0(filename, ".rds"))

  if(file.exists(pathname)) {
    res <- readRDS(pathname)
  } else {
    # 2. Otherwise, call method with arguments
    res <- do.call(fcn, args=list(...))

    # 3. Memoize results
    saveRDS(res, file=pathname)
  }

  # 4. Return results
  return(res)
}
