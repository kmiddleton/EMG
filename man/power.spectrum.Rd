\name{power.spectrum}
\alias{power.spectrum}
\title{Power Spectrum}
\usage{
  power.spectrum(y, freq = 10000, width = 4096,
    frqRange = c(-Inf, 1000), ...)
}
\arguments{
  \item{y}{An object of class \code{"EMG"} or
  \code{"Wave"}.}

  \item{freq}{The recording frequency. Defaults to 10000
  Hz.}

  \item{width}{Width of the window to use for periodogram.
  See \code{\link{periodogram}} for additional information.
  Defaults to 4096.}

  \item{frqRange}{Frequency range for periodogram. Defaults
  to -Inf to 1000 Hz.}

  \item{...}{Additional parameters passed to
  \code{\link{periodogram}} or \code{\link{FF}}}
}
\value{
  A list containing the outputs of
  \code{\link{periodogram}} and \code{\link{FF}}
}
\description{
  Calculate and plot power spectrum for a wave.
}
\examples{
pulse <- read.EMG(system.file("extdata",
                              "pulse_1.wav",
                              package = "EMG"))
power.spectrum(pulse)

no_signal <- read.EMG(system.file("extdata",
                                  "amp_on_baseline.wav",
                                  package = "EMG"))
power.spectrum(no_signal)
}
\author{
  Kevin Middleton (middletonk@missouri.edu)
}

