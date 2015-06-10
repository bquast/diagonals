#' Matrix Diagonals
#'
#' @description A small extension of the `diag<-` function from the base package, allowing for replacement vectors smaller than the diagonal.
#' @param x a matrix, vector or 1D array, or missing.
#' @param value either a single value or a vector of length equal to that of the current diagonal. Should be of a mode which can be coerced to that of x.
#' @details The `diag<-` function in the base package allows for two type of value, either of length 1, or of length equal to the length of the diagonal
#' This function extends that by allowing
#' @export


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
