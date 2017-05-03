#' Plot of Vehicles
#'
#' @description The object with class "Vehicles" is esentially a data.frame
#' with columns as type of vehicles and rows as streets. Therefore the plot
#' seeks to inform the total number by type of vehicles
#'
#' @return Define vehicle classes inhetis of data.frame
#' @export
#' @examples \dontrun{
#' data(net)
#' lt <- as.Vehicles(net$hdv)
#' class(lt)
#' plot(lt)
#' }
plot.Vehicles <- function(veh, by = "col", mean = TRUE, default = FALSE, ...) {
  if (default == TRUE) {
    plot.default(veh, ...)
  } else if (by=="col" && mean == FALSE){
    Veh <- as.Vehicles(colSums(veh))
    plot(Veh, type="l")
  } else if (by=="col" && mean == TRUE){
    avage <- sum(seq(1,ncol(veh)) * colSums(veh)/sum(veh))
    units(avage) <- with(ud_units, 1/h)
    # avage <- Hmisc::wtd.mean(x = 1:ncol(veh), weights = colSums(veh))
    # quage <- Hmisc::wtd.quantile(x = 1:ncol(veh), weights = colSums(veh))
    Veh <- as.Vehicles(colSums(veh))
    plot(Veh, type="l", main=paste(deparse(substitute(veh))), ...)
    abline(v = avage, col="red")
    cat("\nAverage = ",round(avage,2))
    # abline(v = quage)
  } else if (by=="streets" && mean == FALSE){
    Veh <- as.Vehicles(rowSums(veh))
    plot(Veh, type="l", ...)
  } else if (by=="streets" && mean == TRUE){
    avveh <- mean(rowSums(veh), na.rm=T)
    # quveh <- quantile(rowSums(veh), c(.2, .4, .6, .8, 1))
    # quveh <- Hmisc::wtd.quantile(x = colSums(veh), weights = 1:ncol(veh))
    Veh <- as.Vehicles(rowSums(veh))
    plot(Veh, type="l", main=paste(deparse(substitute(veh))), ...)
    abline(h =  avveh, col="red")
    cat("\nAverage = ",round(avveh,2))
    # abline(h = quveh)
  }
}
##example
plot(LightTrucks,mean=F)
plot(LightTrucks, by="col", mean=T)
text(x = 21, y = 100,"Average =  17.12")
plot(LightTrucks, default = T)
plot(LightTrucks, by="streets", mean=F)
plot(LightTrucks, by="streets", mean=T)