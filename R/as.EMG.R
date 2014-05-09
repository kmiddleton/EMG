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
                   downsample = TRUE,
                   samp.freq = 11025){

  # If wave isn't a Wave, then make it a wave
  if (is.vector(wave)){
    wave <- Wave(left = wave,
                 right = numeric(0),
                 samp.rate = samp.freq,
                 bit = 16, pcm = TRUE)
  }
  
  x <- as.numeric(wave@left)
  
  if (downsample){
    if (44100 %% samp.freq != 0){
      stop("samp.freq should divide evenly into 44100.\n
           Try 11025 or 22050.")
    }
    x <- x[seq(1, length(x), by = 44100/samp.freq)]
  }
  
  class(x) <- "EMG"
  return(x)
}

print.EMG <- function(x, digits = 4, ...){
  print(head(pulse))
  print(paste("Samples:", length(x)))
}

plot.EMG <- function(x, downsample = 5,
                     type = "l",
                     ...){
  if (!inherits(x, "EMG")) {
    stop('object "x" is not of class "EMG".')
  }
  
  obs_to_keep <- seq(from = 1, to = length(x), by = downsample)
  x_down <- x[obs_to_keep]
  plot(x_down, type = type, ...)
}

scientific_10 <- function(x) {
  parse(text=gsub("e", " %*% 10^", scientific_format()(x)))
}
