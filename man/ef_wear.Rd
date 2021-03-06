% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ef_wear.R
\name{ef_wear}
\alias{ef_wear}
\title{Emissions factors from tyre, break and road surface wear}
\usage{
ef_wear(wear, type, pol = "TSP", speed, load = 0.5, axle = 2)
}
\arguments{
\item{wear}{Type of wear: "tyre", "break" and "road"}

\item{type}{TYpe of vehicle: "2W", "PC", "LCV", 'HDV"}

\item{pol}{Pollutant: "TSP", "PM10", "PM2.5", "PM1" and "PM0.1"}

\item{speed}{List of speeds}

\item{load}{Load of the HDV}

\item{axle}{Number of axle of the HDV}
}
\value{
emission factors grams/km
}
\description{
Estimation of wear emissions. The sources are tyres, breaks
and road surface.
}
\examples{
\dontrun{
# Do not run
}
}
\references{
Ntziachristos and Boulter 2016. Automobile tyre and break wear
and road abrasion. In: EEA, EMEP. EEA air pollutant emission inventory
guidebook-2009. European Environment Agency, Copenhagen, 2016
}
