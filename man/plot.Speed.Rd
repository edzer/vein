% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.Speed.R
\name{plot.Speed}
\alias{plot.Speed}
\title{plot}
\usage{
plot.Speed(spd, by = "col", mean = TRUE, distance = "km", time = "h",
  xlab = "Index", ...)
}
\arguments{
\item{spd}{Object of class "Speed"}

\item{by}{Character that determines the type of plot. It accept the values:
"col", "streets" and "default". When by is "col" it is shown a plot of the
mean of the columns (See \code{\link{colMeans}}) and also the standard
deviation. When by is "streets" performs  sum of the streets via
\code{\link{rowSums}}. When by is "default" it plots the default method
for plot (See \code{\link{plot}}).}

\item{mean}{a logical value. When mean is TRUE and by is "col" it adds
the weighted mean with and when by is "streets" the mean.}

\item{distance}{Character specifying the units for distance. Default is "km"}

\item{time}{Character specifying the units for time Default is "h"}

\item{xlab}{xlab}

\item{...}{ignored}
}
\description{
The object with class "Speed" is esentially a data.frame
with columns as type of vehicles and rows as streets. Therefore the plot
seeks to inform the total number by type of vehicles. This functions
plot the mean speed and the standard deviation.
}
\details{
Plot of Speed
}
\examples{
\dontrun{
data(net)
data(pc_profile)
pcw <- temp_fact(net$ldv+net$hdv, pc_profile)
class(pcw)
df <- netspeed(pcw, net$ps,net$ffs, net$capacity, net$lkm, alpha = 1,isList=F)
class(df)
}
}
