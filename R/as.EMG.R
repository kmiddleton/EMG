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
as.EMG <- function(wave){
  if (!inherits(wave, "Wave")) {
    stop('object "wave" is not of class "Wave".')
  }

  x <- as.numeric(wave@left)
  class(x) <- "EMG"
  return(x)
}

print.EMG <- function(x, digits = 4, ...){
  print(x, digits = digits, ...)
}

plot.EMG <- function(x, downsample = 10,
                     type = "l",
                     ...){
  if (!inherits(x, "EMG")) {
    stop('object "x" is not of class "EMG".')
  }
  
  obs_to_keep <- seq(from = 1, to = length(x), by = downsample)
  x_down <- x[obs_to_keep]
  plot(x_down, type = type, ...)
}