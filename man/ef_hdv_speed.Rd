% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ef_hdv_speed.R
\name{ef_hdv_speed}
\alias{ef_hdv_speed}
\title{Emissions factors for Heavy Duty Vehicles based on average speed}
\usage{
ef_hdv_speed(v, t, g, eu, gr, l, p, k = 1, show.equation = TRUE)
}
\arguments{
\item{v}{Category vehicle: "Coach", "Trucks" or "Ubus"}

\item{t}{Sub-category of of vehicle: "3Axes", "Artic", "Midi", "RT, "Std" and "TT"}

\item{g}{Gross weight of each category: "<=18", ">18", "<=15", ">15 & <=18", "<=7.5",
">7.5 & <=12", ">12 & <=14", ">14 & <=20", ">20 & <=26", ">26 & <=28", ">28 & <=32",
">32", ">20 & <=28", ">28 & <=34", ">34 & <=40", ">40 & <=50" or ">50 & <=60"}

\item{eu}{Euro emission standard: "PRE", "I", "II", "III", "IV" and "V"}

\item{gr}{Gradient or slope of road: -0.06, -0.04, -0.02, 0.00, 0.02. 0.04 or 0.06}

\item{l}{Load of the vehicle: 0.0, 0.5 or 1.0}

\item{p}{Pollutant: "CO", "FC", "NOx" or "HC"}

\item{k}{Multiplication factor}

\item{show.equation}{Option to see or not the equation parameters}
}
\value{
an emission factor function which depends of the average speed V  g/km
}
\description{
This function returns speed dependent emission factors. The emission factors
comes from the guidelines  EMEP/EEA air pollutant emission inventory guidebook
http://www.eea.europa.eu/themes/air/emep-eea-air-pollutant-emission-inventory-guidebook
}
\examples{
\dontrun{
# Do not run
V <- 0:130
ef1 <- ef_hdv_speed(v = "Trucks",t = "RT", g = "<=7.5", e = "I", gr = 0,l = 0.5, p = "CO")
plot(1:130, ef1(1:130))
ef2 <- ef_hdv_speed(v = "Trucks",t = "RT", g = "<=7.5", e = "II", gr = 0,l = 0.5, p = "THC")
plot(1:130, ef2(1:130))
ef3 <- ef_hdv_speed(v = "Trucks",t = "RT", g = "<=7.5", e = "II", gr = 0,l = 0.5, p = "PM")
plot(1:130, ef3(1:130))
}
}
\keyword{emission}
\keyword{factors}
\keyword{speed}
