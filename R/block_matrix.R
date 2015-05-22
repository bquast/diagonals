#' Block matrix
#'
#' @name block_matrix
#' @param x a matrix where the dimensions are both multiples of step
#' @param step the dimensions of the block matrix being selected over the diagonal of matrix x
#' @export
#' @examples
#' # create a square matrix
#' m <- matrix(1:64, nrow=8)
#'
#' # select a block matrix with step=2
#' block_matrix(m, step=2)
#'
#' # select a block matrix with step=4
#' block_matrix(m, step=4)
#'
#' # create a non-square matrix
#' nsm <- matrix(1:27, nrow=9, ncol=3 )
#'
#' # check that both dimensions are multiples of step=3
#' dim(nsm) %% 3 == c(0, 0)
#'
#' # select the diagonal step matrix
#' block_matrix(nsm, step=3)

block_matrix <- function( x, step ) {

  y <- minus_block_matrix(x, step)

  return(x - y)

}
