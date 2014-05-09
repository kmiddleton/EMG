##' Read EMG file.
##'
##' This function reads in a wave file and converts to and
##' \code{"EMG"} class vector.
##' 
##' @title Read EMG File
##' 
##' @param filename File name to be read
##' @param downsample Should the wave be downsampled.
##' @param samp.rate The sample rate for downsampling. Defaults to
##'   10000 Hz.
##' @param ... Additional parameters passed along to
##'   \code{\link{readWave}}.
##' 
##' @return Wave of class \code{"EMG"}.
##' 
##' @author Kevin Middleton (middletonk@@missouri.edu)
##' 
##' @seealso \code{\link{readWave}}, \code{\link{as.EMG}}
##'   
##' @export
##' 
##' @examples
##' pulse <- read.EMG(system.file("extdata",
##'                               "pulse_1.wav",
##'                               package = "EMG"))
##' str(pulse)
read.EMG <- function(filename,
                     downsample = TRUE,
                     samp.rate = 11025, ...){
  
  x <- readWave(filename, ...)
  
  if (downsample){
    x <- x[seq(1, length(x), by = 44100/samp.rate)]
  }
  
  x <- as.EMG(x, samp.rate)
  return(x)
}
