##' EMG Analysis in R 
##' 
##' The \code{EMG} package contains functions for reading, plotting, 
##' and analyzing EMG data collected as \code{wav} files such as are 
##' recorded by Backyard Brains \url{https://backyardbrains.com/} EMG
##' SpikerBox and the iPhone/Android/Adobe Air app.
##' 
##' Several example \code{wav} files are included in the
##' \code{extdata} directory.
##' 
##' \tabular{ll}{ Package: \tab EMG\cr 
##'               Type: \tab Package\cr 
##'               Version: \tab 0.0.3\cr 
##'               Date: \tab 2013-11-17\cr 
##'               License: \tab GPL-2\cr 
##'               LazyLoad: \tab yes\cr 
##'               LazyData: \tab yes\cr }
##' 
##' @name EMG-package
##' @aliases EMG-package EMG
##' @docType package
##' @author Kevin M. Middleton (\url{middletonk@@missouri.edu})
##' @references Backyard Brains \url{https://backyardbrains.com/}
##' @keywords package
##' 
NULL


##' Amplifier Off
##' 
##' File recorded with the Backyard Brains EMG SpikerBox off.
##' 
##' @name amp_off
##' 
##' @docType data
##' 
##' @format A \code{\link{Wave-class}} object of EMG (audio) data
##'   recorded with the amplifier off. Useful for checking noise in
##'   the recording system.
##' \tabular{ll}{ Number of Samples: \tab 76288\cr 
##'               Duration (seconds): \tab 1.73\cr 
##'               Samplingrate (Hertz): \tab 44100\cr 
##'               Channels (Mono/Stereo): \tab Mono\cr 
##'               PCM (integer format): \tab TRUE\cr 
##'               Bit (8/16/24/32/64): \tab 16}
##' 
##' @references Backyard Brains \url{https://backyardbrains.com/}
##' 
##' @source Recorded by Kevin Middleton.
##' 
##' @keywords datasets
##' 
##' @examples
##' 
##' amp_off
##' plot(amp_off)
##' 
NULL


##' Amplifier On Baseline
##' 
##' File recorded with the Backyard Brains EMG SpikerBox on with 
##' surface elecrodes on the biceps brachii to determine baseline
##' noise.
##' 
##' @name amp_on_baseline
##' 
##' @docType data
##' 
##' @format A \code{\link{Wave-class}} object of EMG (audio) data 
##'   recorded with the amplifier on and surface electrodes connected
##'   to the biceps brachii.
##' \tabular{ll}{ Number of Samples: \tab 60928\cr 
##'               Duration (seconds): \tab 1.38\cr 
##'               Samplingrate (Hertz): \tab 44100\cr 
##'               Channels (Mono/Stereo): \tab Mono\cr 
##'               PCM (integer format): \tab TRUE\cr 
##'               Bit (8/16/24/32/64): \tab 16}
##' 
##' @references Backyard Brains \url{https://backyardbrains.com/}
##' 
##' @source Recorded by Kevin Middleton.
##' 
##' @keywords datasets
##' 
##' @examples
##' 
##' amp_on_baseline
##' plot(amp_on_baseline)
##' 
NULL


##' Submaximal Contractions
##' 
##' File recorded with the Backyard Brains EMG SpikerBox on with 
##' surface elecrodes on the biceps brachii with a series of
##' submaximal contractions.
##' 
##' @name pulse_1
##' 
##' @docType data
##' 
##' @format A \code{\link{Wave-class}} object of EMG (audio) data 
##'   recorded with the amplifier on and surface electrodes connected
##'   to the biceps brachii.
##' \tabular{ll}{ Number of Samples: \tab 94208\cr 
##'               Duration (seconds): \tab 2.14\cr 
##'               Samplingrate (Hertz): \tab 44100\cr 
##'               Channels (Mono/Stereo): \tab Mono\cr 
##'               PCM (integer format): \tab TRUE\cr 
##'               Bit (8/16/24/32/64): \tab 16}
##' 
##' @references Backyard Brains \url{https://backyardbrains.com/}
##' 
##' @source Recorded by Kevin Middleton.
##' 
##' @keywords datasets
##' 
##' @examples
##' 
##' pulse_1
##' plot(pulse_1)
##' 
NULL


##' Maximal Contractions
##' 
##' File recorded with the Backyard Brains EMG SpikerBox on with 
##' surface elecrodes on the biceps brachii with a series of
##' maximal contractions.
##' 
##' @name pulse_max
##' 
##' @docType data
##' 
##' @format A \code{\link{Wave-class}} object of EMG (audio) data 
##'   recorded with the amplifier on and surface electrodes connected
##'   to the biceps brachii.
##' \tabular{ll}{ Number of Samples: \tab 70144\cr 
##'               Duration (seconds): \tab 1.59\cr 
##'               Samplingrate (Hertz): \tab 44100\cr 
##'               Channels (Mono/Stereo): \tab Mono\cr 
##'               PCM (integer format): \tab TRUE\cr 
##'               Bit (8/16/24/32/64): \tab 16}
##' 
##' @references Backyard Brains \url{https://backyardbrains.com/}
##' 
##' @source Recorded by Kevin Middleton.
##' 
##' @keywords datasets
##' 
##' @examples
##' 
##' pulse_max
##' plot(pulse_max)
##' 
NULL

