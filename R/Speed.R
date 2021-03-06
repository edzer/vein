#' Construction function for class "Speed"
#'
#' @description Returns a tranformed object with class "Speed" and units
#'  km/h. This functions includes two arguments, distance and time. Therefore,
#'  it is posibel to change the units of the speed to "m" to "s" for example.
#'  This function returns a dataframe with units for speed. When this function
#'  is applied to numeric vectors it add class "units".
#'
#' @return Constructor for class "Speed" or "units"
#'
#' @param ... ignored
#' @param spd Object with class "Speed"
#' @param distance Character specifying the units for distance. Default is "km"
#' @param time Character specifying the units for time Default is "h"
#' @seealso \code{\link{units}}
#'
#' @rdname Speed
#' @name Speed
#' @title Speed
#' @aliases NULL
NULL
#' @examples \dontrun{
#' data(net)
#' speed <- as.Speed(net$ps)
#' class(speed)
#' plot(speed)
#' }
#' @export
Speed <- function(spd, distance = "km", time = "h", ...) {
  if  (is.matrix(spd)) {
    spd <- as.data.frame(spd)
    for(i in 1:ncol(spd)){
      spd[,i] <- spd[,i] * units::parse_unit(paste0(distance," ", time,"-1"))
    }
    class(spd) <- c("Speed",class(spd))
  } else if (is.data.frame(spd)) {
    for(i in 1:ncol(spd)){
      spd[,i] <- spd[,i] * units::parse_unit(paste0(distance," ", time,"-1"))
    }
    class(spd) <- c("Speed",class(spd))
  } else if (is.list(spd) && is.list(spd[[1]])) {
    for (i in 1:length(spd) ) {
      for (j in 1:length(spd[[1]]) ) {
        spd[[i]][[j]] <- spd[[i]][[j]] * units::parse_unit(paste0(distance," ", time,"-1"))
      }
    }
    #SpeedList?
  } else {
    units(spd) <- spd * units::parse_unit(paste0(distance," ", time,"-1"))
  }
  return(spd)
}
