#' Set Cache Root Path
#'
#' @param path the cache root directory
#' 
#' @examples 
#' setCacheRootPath()
#'
#' @export
setCacheRootPath <- function(path="~/.simpleRCache") {
  if(!file.exists(path)) {
    dir.create(path)
  }

  options("simpleRCacheRoot" = path)
}
