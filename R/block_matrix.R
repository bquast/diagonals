#' Block matrix
#'
#' @name block_matrix
#' @param x a matrix where the dimensions are both multiples of size
#' @param steps the required number of steps (block matrices) across the diagonal
#' @param size the largest dimension of the matrix being selected over the diagonal of matrix
#' @param replacement value to be inserted off the diagonal, by default this is zero (0).
#' @export
#' @examples
#' # create a square matrix
#' m <- matrix(1:64, nrow=8)
#'
#' # select a block matrix with two steps
#' block_matrix(m, steps=2)
#'
#' # select a block matrix with four steps
#' block_matrix(m, steps=4)
#'
#' # create a non-square matrix
#' nsm <- matrix(1:27, nrow=9, ncol=3 )
#'
#' # check that both dimensions are multiples of steps=3
#' dim(nsm) %% 3 == c(0, 0)
#'
#' # select the diagonal matrix
#' block_matrix(nsm, steps=3)

block_matrix <- function( x, steps = NULL, size = NULL, replacement = 0 ) {

  # create the off diagonal matrix (because programatically easier)
  # to be substracted from x to form the output
  y <- minus_block_matrix(x = x, steps = steps, size = size, replacement = replacement )

  # replacement is substracted on the diagonal with y
  # here it is added for the whole of x
  # cancelling out on the diagonal
  # and adding off diagonal
  return(x - y + replacement)

}
