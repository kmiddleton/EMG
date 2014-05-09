##' Convert wave file into single channel EMG file.
##' 
##' This function takes as imput an audio wave file read in using the 
##' readWave function from the \code{\link{tuneR}} package. The 
##' returned wave has print and plot methods. By default, plotting 
##' reduces the number of points to 1/10 of the original wave using 
##' the \code{downsample} parameter.
##' 
##' @title Convert wave of class \code{"Wave"} to EMG vector of class 
##'   \code{"EMG"}.
##'   
##' @param wave An audio wave of class \code{"Wave"} read in by 
##'   \code{\link{readWave}}.
##' @param downsample logical. If \code{TRUE} (default), then the wave
##'   will be downsampled to \code{samp.freq}.
##' @param samp.freq numeric. The new sample frequency. Defaults to
##'   11025.
##'   
##' @return Vector of class "EMG". Class "EMG" has print and plot 
##'   methods.
##'   
##' @author Kevin Middleton (middletonk@@missouri.edu)
##'   
##' @seealso \code{\link{readWave}}
##'   
##' @export
##' 
##' @S3method print EMG
##' @S3method plot EMG
##'   
##' @examples
##' wav <- readWave(system.file("extdata",
##'                             "pulse_1.wav",
##'                             package = "EMG"))
##' y <- as.EMG(wav)
##' str(y)
as.EMG <- function(wave,
                   downsample = FALSE,
                   samp.freq){

  # If wave isn't a Wave, then make it a wave
  if (is.vector(wave)){
    wave <- Wave(left = wave,
                 right = numeric(0),
                 samp.rate = samp.freq,
                 bit = 16, pcm = TRUE)
  }
  
  # Extract left channel as EMG signal.
  y <- as.numeric(wave@left)
  
  # Construct x time vector
  x <- (1:length(y))/samp.freq
  
  if (downsample){
    if (44100 %% samp.freq != 0){
      stop("samp.freq should divide evenly into 44100.\n
           Try 11025 or 22050.")
    }
    y <- y[seq(1, length(y), by = 44100/samp.freq)]
    x <- x[seq(1, length(x), by = 44100/samp.freq)]
  }
  
  # Make out data.frame
  dd <- data.frame(x, y)
  
  class(dd) <- "EMG"
  attr(dd, 'samp.freq') <- samp.freq
  return(dd)
}

print.EMG <- function(x, digits = 4, ...){
  print(paste("Samples:", length(x$x)))
}

plot.EMG <- function(x, downsample = 5,
                     type = "l",
                     ...){
  if (!inherits(x, "EMG")) {
    stop('object "x" is not of class "EMG".')
  }
  
  y_to_keep <- seq(from = 1, to = length(x$y), by = downsample)
  x_to_keep <- seq(from = 1, to = length(x$x), by = downsample)
  y_down <- x$y[y_to_keep]
  x_down <- x$x[x_to_keep]
  
  p <- ggplot(data.frame(x_down, y_down), aes(x_down, y_down)) +
    geom_line() +
    xlab("Time (s)") +
    ylab("V")
  print(p)
}

scientific_10 <- function(x) {
  parse(text=gsub("e", " %*% 10^", scientific_format()(x)))
}
