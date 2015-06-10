`diag<-` <- function (x, value) {
  dx <- dim(x)
  if (length(dx) != 2L)
    stop("only matrix diagonals can be replaced")
  len.i <- min(dx)
  len.v <- length(value)
  if (len.v != 1L && len.i %% len.v != 0)
    stop("replacement diagonal has wrong length")
  if (len.i) {
    i <- seq_len(len.i)
    x[cbind(i, i)] <- value
  }
  x
}
