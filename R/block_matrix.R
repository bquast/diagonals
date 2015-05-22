#' Block matrix
#'
#' @name block_matrix
#' @param x a square matrix
#' @param step the dimensions (width = height) of the block matrix being selected over the diagonal of matrix x
#' @export

block_matrix <- function( x, step ) {

  y <- minus_block_matrix(x, step)

  return(x - y)

}
