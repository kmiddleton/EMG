\name{read.EMG}
\alias{read.EMG}
\title{Read EMG File}
\usage{
  read.EMG(filename, downsample = TRUE, samp.rate = 11025,
    ...)
}
\arguments{
  \item{filename}{File name to be read}

  \item{downsample}{Should the wave be downsampled.}

  \item{samp.rate}{The sample rate for downsampling.
  Defaults to 10000 Hz.}

  \item{...}{Additional parameters passed along to
  \code{\link{readWave}}.}
}
\value{
  Wave of class \code{"EMG"}.
}
\description{
  Read EMG file.
}
\details{
  This function reads in a wave file and converts to and
  \code{"EMG"} class vector.
}
\examples{
pulse <- read.EMG(system.file("extdata",
                              "pulse_1.wav",
                              package = "EMG"))
str(pulse)
}
\author{
  Kevin Middleton (middletonk@missouri.edu)
}
\seealso{
  \code{\link{readWave}}, \code{\link{as.EMG}}
}

