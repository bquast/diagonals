#' Minus Block matrix
#'
#' @name minus_block_matrix
#' @param x a square matrix
#' @param step the dimensions (width = height) of the block matrix being dropped over the diagonal of matrix x
#' @export

minus_block_matrix <- function( x, step ) {

  if (!dim(x)[1] == dim(x)[2]) stop("x is not a square matrix")

  for (j in 1:(dim(x)[1] %/% step) ) {
    p <- seq( ((j-1)*step + 1), j*step )
    x[p, p] <- 0
  }

  return(x)
}
