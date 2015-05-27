#' Rectangle Matrix
#'
#' @name rectangle_matrix
#' @param x a matrix where the dimensions are both multiples of size
#' @param steps the required number of steps (block matrices) across the diagonal
#' @param size the largest dimension of the matrix being selected over the diagonal of matrix
#' @param replacement value to be inserted off the diagonal, by default this is zero (0).
#' @export
#' @examples
#' # create a non-square matrix
#' nsm <- matrix(1:27, nrow=9, ncol=3 )
#'
#' # check that both dimensions are multiples of steps=3
#' dim(nsm) %% 3 == c(0, 0)
#'
#' # select the diagonal matrix
#' rectangle_matrix(nsm, steps=3)


rectangle_matrix <- function( x, steps = NULL, size = NULL, replacement = 0 ) {

  # create the off diagonal matrix (because programatically easier)
  # to be substracted from x to form the output
  y <- minus_rectangle_matrix(x = x, steps = steps, size = size, replacement = replacement )

  # replacement is substracted on the diagonal with y
  # here it is added for the whole of x
  # cancelling out on the diagonal
  # and adding off diagonal
  return(x - y + replacement)

}
