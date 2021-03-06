#' Plot of EmissionFactors
#'
#' @description The object with class "EmissionFactors" is esentially a
#' data.frame with columns as type of vehicles and rows as age. Therefore plot
#' seeks to inform the emission factor producing a panel of plots of emission
#' factors, each panel to each type of vehicle. When the emission factors
#' are functions, other methods should be used.
#'
#' @param ef Object with class "EmissionFactors"
#' @param xlab Labs for horizontal axe
#' @param ... ignored
#' @rdname plot.EmissionFactors
#' @name plot.EmissionFactors
#' @title plot
#' @aliases NULL
NULL
#' @examples \dontrun{
#' data(fe2015)
#' names(fe2015)
#' df <- fe2015[fe2015$Pollutant=="CO", c(ncol(fe2015)-1,ncol(fe2015))]
#' ef1 <- as.EmissionFactors(df)
#' plot(ef1)
#' }
#' @export
plot.EmissionFactors <- function(ef, xlab = "Index", ...) {
  if (mode(ef)=="numeric" || ncol(ef) > 12) {
    graphics::plot(ef, xlab = xlab, ...)
  } else if (ncol(ef) >= 2 & ncol(ef) <= 3) {
    graphics::par(mfrow=c(1, ncol(ef)), tcl = -0.5)
  } else if (ncol(ef) == 4) {
    graphics::par(mfrow=c(2, 2), tcl = -0.5)
  } else if (ncol(ef) >= 5 && ncol(ef) >= 6 ) {
    graphics::par(mfrow=c(2, 3), tcl = -0.5)
  } else if (ncol(ef) >= 7 && ncol(ef) >= 9 ) {
    graphics::par(mfrow=c(3, 3), tcl = -0.5)
  } else if (ncol(ef) >= 10 && ncol(ef) >= 12 ) {
    graphics::par(mfrow=c(3, 4), tcl = -0.5)
  }
  for (i in 1:ncol(ef)) {
    graphics::plot(ef[,i], type = "l", xlab = xlab, ...)
  }
  graphics::par(mfrow=c(1,1))
}
