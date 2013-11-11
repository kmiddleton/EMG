\name{as.EMG}
\alias{as.EMG}
\title{Convert wav to EMG}
\usage{
  as.EMG(wave)
}
\arguments{
  \item{wave}{An audio wave file read in by readWave().}
}
\value{
  Vector of class "EMG". Class "EMG" has print and plot
  methods.
}
\description{
  Convert wave file into single channel EMG file.
}
\details{
  Details go here.
}
\examples{
wav <- readWave(system.file("extdata",
                            "wav_file.wav",
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

