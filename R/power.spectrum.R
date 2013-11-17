##' Calculate and plot power spectrum for a wave.
##' 
##' @title Power Spectrum
##' 
##' @param y An object of class \code{"EMG"} or \code{"Wave"}.
##' @param freq The recording frequency. Defaults to 10000 Hz.
##' @param width Width of the window to use for periodogram. See
##'   \code{\link{periodogram}} for additional information. Defaults
##'   to 4096.
##' @param frqRange Frequency range for periodogram. Defaults to -Inf
##'   to 1000 Hz.
##' @param ... Additional parameters passed to
##'   \code{\link{periodogram}} or \code{\link{FF}}
##' 
##' @return A list containing the outputs of \code{\link{periodogram}}
##'   and \code{\link{FF}}
##' 
##' @author Kevin Middleton (middletonk@@missouri.edu)
##' 
##' @export
##' 
##' @examples
##' y <- read.EMG(system.file("extdata",
##'                           "pulse_1.wav",
##'                           package = "EMG"))
##' power.spectrum(y)
##' 
##' no_signal <- read.EMG(system.file("extdata",
##'                                   "amp_on_baseline.wav",
##'                                   package = "EMG"))
##' power.spectrum(no_signal)
power.spectrum <- function(y,
                           freq = 10000,
                           width = 4096,
                           frqRange = c(-Inf, 1000),
                           ...){
  # If y is an EMG, convert to wave
  if (inherits(y, "EMG")) {
    y_wave <- Wave(left = unclass(y), samp.rate = freq, bit = 16)
  }
  
  if (inherits(y, "Wave")) {
    y_wave <- y
  }
  
  Wspecobj<- tuneR::periodogram(y_wave, width = 4096,
                                frqRange = frqRange, ...)
  plot(Wspecobj)
  
  FFobj <- FF(Wspecobj)
  
  return(list(Wspec = Wspecobj, FF = FFobj))
}
