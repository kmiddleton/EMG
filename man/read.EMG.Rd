\name{read.EMG}
\alias{read.EMG}
\title{Read EMG File}
\usage{
  read.EMG(filename, ...)
}
\arguments{
  \item{filename}{File name to be read}

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
y <- read.EMG(system.file("extdata",
                          "wav_file.wav",
                          package = "EMG"))
str(y)
}
\author{
  Kevin Middleton (middletonk@missouri.edu)
}
\seealso{
  \code{\link{readWave}}, \code{\link{as.EMG}}
}

