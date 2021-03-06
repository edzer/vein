#' Calculate speeds of traffic network
#'
#' Creates a dataframe of speeds fir diferent hours and each link based on
#' morning rush traffic data
#'
#' @param q Data-frame of traffic flow to each hour (veh/h)
#' @param ps Peak speed (km/h)
#' @param ffs Free flow speed (km/h)
#' @param cap Capacity of link (veh/h)
#' @param lkm Distance of link (km)
#' @param alpha Parameter of BPR curves
#' @param beta Parameter of BPR curves
#' @param isList Logical to specify type of return, list or data-frame
#' @param distance Character specifying the units for distance. Default is "km"
#' @param time Character specifying the units for time Default is "h"
#' @return dataframe or list of speeds with units
#' @export
#' @examples \dontrun{
#' # Do not run
#' data(net)
#' data(pc_profile)
#' qq <- as.matrix(net$ldv+net$hdv) %*% matrix(unlist(pc_profile), nrow=1)
#' df <- netspeed(qq, net$ps, net$ffs, net$capacity, net$lkm)
#' }
netspeed <- function (q, ps, ffs, cap, lkm, alpha=0.15, beta=4, isList=FALSE,
                      distance = "km", time="h"){
  if(missing(q) | is.null(q)){
    stop(print("No vehicles"))
  q <- as.data.frame(q)
  for (i  in 1:ncol(q) ) {
    q[,i] <- as.numeric(q[,i])
  }
  ps <- as.numeric(ps)
  ffs <- as.numeric(ffs)
  cap <- as.numeric(cap)
  lkm <- as.numeric(lkm)
  } else if (isList==FALSE){
    dfv <- as.data.frame(do.call("cbind",(lapply(1:ncol(q), function(i) {
      lkm/(lkm/ffs*(1 + alpha*(q[,i]/cap)^beta))
    }))))
    # dfv[,8] <- ps
    names(dfv) <- unlist(lapply(1:ncol(q), function(i) paste0("S",i)))
    dfv <- Speed(dfv, distance = distance, time = time)
    return(dfv)
  }else if (isList==TRUE){
    dfv <- as.data.frame(do.call("cbind",(lapply(1:ncol(q), function(i) {
      lkm/(lkm/ffs*(1 + alpha*(q[,i]/cap)^beta))
    }))))
    # dfv[,8] <- ps
    names(dfv) <- unlist(lapply(1:ncol(q), function(i) paste0("S",i)))
    ldfv <- lapply(0:(ncol(dfv)/24-1),function(i) {
      as.list(dfv[,(1:24)+i*24])
    })
    return(ldfv)
  }
}
