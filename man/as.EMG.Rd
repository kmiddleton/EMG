\name{as.EMG}
\alias{as.EMG}
\title{Convert wave of class \code{"Wave"} to EMG vector of class
  \code{"EMG"}.}
\usage{
  as.EMG(wave, downsample = TRUE, samp.rate = 11025)
}
\arguments{
  \item{wave}{An audio wave of class \code{"Wave"} read in
  by \code{\link{readWave}}.}
}
\value{
  Vector of class "EMG". Class "EMG" has print and plot
  methods.
}
\description{
  Convert wave file into single channel EMG file.
}
\details{
  This function takes as imput an audio wave file read in
  using the readWave function from the \code{\link{tuneR}}
  package. The returned wave has print and plot methods. By
  default, plotting reduces the number of points to 1/10 of
  the original wave using the \code{downsample} parameter.
}
\examples{
wav <- readWave(system.file("extdata",
                            "pulse_1.wav",
                            package = "EMG"))
y <- as.EMG(wav)
str(y)
}
\author{
  Kevin Middleton (middletonk@missouri.edu)
}
\seealso{
  \code{\link{readWave}}
}

