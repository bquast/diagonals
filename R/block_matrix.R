#' Block matrix
#'
#' @name block_matrix
#' @param x a matrix where the dimensions are both multiples of size
#' @param steps the required number of steps (block matrices) across the diagonal
#' @param size the largest dimension of the matrix being selected over the diagonal of matrix
#' @export
#' @examples
#' # create a square matrix
#' m <- matrix(1:64, nrow=8)
#'
#' # select a block matrix with size=2
#' block_matrix(m, size=2)
#'
#' # select a block matrix with size=4
#' block_matrix(m, size=4)
#'
#' # create a non-square matrix
#' nsm <- matrix(1:27, nrow=9, ncol=3 )
#'
#' # check that both dimensions are multiples of size=3
#' dim(nsm) %% 3 == c(0, 0)
#'
#' # select the diagonal size matrix
#' block_matrix(nsm, size=3)

block_matrix <- function( x, steps = NULL, size = NULL ) {

  y <- minus_block_matrix(x = x, steps = steps, size = size)

  return(x - y)

}
