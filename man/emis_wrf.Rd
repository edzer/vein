% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/emis_wrf.R
\name{emis_wrf}
\alias{emis_wrf}
\title{Generates emissions dataframe to generate WRF-Chem inputs}
\usage{
emis_wrf(sdf, nr, dmyhm, tz, utc, islist)
}
\arguments{
\item{sdf}{Grid emissions, which can be a SpatialPolygonsDataFrame, or a list
of  SpatialPolygonsDataFrame}

\item{nr}{Number of repetitions of the emissions period}

\item{dmyhm}{String indicating Day Month Year Hour and Minute in the format
"d-m-Y H:M" e.g.: "01-05-2014 00:00" It represents the time of the first
hour of emissions in Local Time}

\item{tz}{Time zone as required in for function \code{\link{as.POSIXct}}}

\item{utc}{interger indicating the difference between local and GMT time}

\item{islist}{logical value to indicate if sdf is a list or not}
}
\value{
data-frame of gridded emissions  g/h
}
\description{
It returns a dataframes with columns lat, long, id, pollutants, local time
and GMT time. This dataframe has the proper format to be used with WRF
assimilation system: "Another Asimilation System 4 WRF (AAS4WRF)" as published
by Vera-Vala et al (2016)
}
\note{
The reference of the emissions assimilation system is Vara-Vela, A.,
Andrade, M. F., Kumar, P., Ynoue, R. Y., and Munoz, A. G.: Impact of
vehicular emissions on the formation of fine particles in the Sao Paulo
Metropolitan Area: a numerical study with the WRF-Chem model, Atmos. Chem.
Phys., 16, 777-797, doi:10.5194/acp-16-777-2016, 2016.
A good website with timezones is http://www.timezoneconverter.com/cgi-bin/tzc
}
\examples{
\dontrun{
# Do not run
}
}
