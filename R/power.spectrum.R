##' Calculate and plot power spectrum for a wave.
##' 
##' @title Power Spectrum
##' 
##' @param y An object of class \code{"EMG"} or \code{"Wave"}.
##' @param samp.freq The recording frequency. Defaults to 11025 Hz.
##' @param plot logical. Should the power spectrum be plotted?
##'   Defaults to \code{TRUE}.
##' @param plot_range numeric vector. The range for plotting. Defaults
##'   to 0 to samp.freq / 2.
##' 
##' @return A \code{data.frame} containing the \code{intensity} at
##'   each \code{frequency} from 0 to \code{samp.freq / 2}.
##' 
##' @author Kevin Middleton (middletonk@@missouri.edu)
##' 
##' @export
##' 
##' @examples
##' pulse <- read.EMG(system.file("extdata",
##'                               "pulse_1.wav",
##'                               package = "EMG"))
##' power.spectrum(pulse)
##' 
##' no_signal <- read.EMG(system.file("extdata",
##'                                   "amp_on_baseline.wav",
##'                                   package = "EMG"))
##' power.spectrum(no_signal)
power.spectrum <- function(y,
                           samp.freq = 11025,
                           plot = TRUE,
                           plot_range = NULL){
  if (inherits(y, "Wave")) {
    message("Converting y to class EMG")
    y <- as.EMG(y, samp.freq = samp.freq)
  }
  
  # Check that y is of class EMG
  if (!inherits(y, "EMG")) {
    stop("y should be class 'EMG'.")
  }
  
  # See http://tolstoy.newcastle.edu.au/R/help/05/08/11270.html
  Y <- fft(as.numeric(y))
  
  ## Find the sample period
  delta <- 1/samp.freq
  
  ## Calculate the Nyquist frequency
  f.Nyquist <- 1 / 2 / delta
  
  ## Calculate the frequencies
  Freqs <- f.Nyquist * c(seq(length(y)/2),
                         -rev(seq(length(y)/2)))/(length(y)/2)
  
  out <- data.frame(frequency = Freqs, power = Mod(Y))
  out <- out[out$frequency >= 0, ]
  
  if (plot){
    if (is.null(plot_range)){
      xlow <- 0
      xhigh <- samp.freq / 2
    } else {
      xlow <- plot_range[1]
      xhigh <- plot_range[2]
    }
    p <- ggplot(out, aes(x = frequency, y = power)) + geom_line() +
      xlab("Frequency (Hz)") + ylab("Intensity") +
      xlim(xlow, xhigh) +
      scale_y_continuous(label = scientific_10)
    suppressWarnings(print(p))
  }

  return(out)
}
