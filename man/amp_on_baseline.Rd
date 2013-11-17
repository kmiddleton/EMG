\docType{data}
\name{amp_on_baseline}
\alias{amp_on_baseline}
\title{Amplifier On Baseline}
\format{A \code{\link{Wave-class}} object of EMG (audio) data
  recorded with the amplifier on and surface electrodes connected
  to the biceps brachii.
\tabular{ll}{ Number of Samples: \tab 60928\cr
              Duration (seconds): \tab 1.38\cr
              Samplingrate (Hertz): \tab 44100\cr
              Channels (Mono/Stereo): \tab Mono\cr
              PCM (integer format): \tab TRUE\cr
              Bit (8/16/24/32/64): \tab 16}}
\source{
  Recorded by Kevin Middleton.
}
\description{
  File recorded with the Backyard Brains EMG SpikerBox on
  with surface elecrodes on the biceps brachii to determine
  baseline noise.
}
\examples{
amp_on_baseline
plot(amp_on_baseline)
}
\references{
  Backyard Brains \url{https://backyardbrains.com/}
}
\keyword{datasets}

