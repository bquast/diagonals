#' Minus Block Matrix
#'
#' @name minus_block_matrix
#' @param x a square matrix where the dimensions are integer multiples of size or integer dividors of steps
#' @param steps the required number of steps (block matrices) across the diagonal
#' @param size the width or height of the matrix being dropped over the diagonal of matrix x
#' @param replacement value to be inserted on the diagonal, by default this is zero (0).
#' @details Either steps or size is expected to be provided.
#' @export
#' @examples
#' # create a square matrix
#' m <- matrix(1:64, nrow=8)
#'
#' # select a block matrix with two steps
#' minus_block_matrix(m, steps=2)
#'
#' # select a block matrix with four steps
#' minus_block_matrix(m, steps=4)


minus_block_matrix <- function( x, steps = NULL, size = NULL, replacement = 0 ) {


  # check if square matrix
  if ( dim(x)[1] != dim(x)[2]) {

    # give warning
    warning(paste("The matrix", x, "is not a square matrix, passing on arguments to the function minus_rectangle_matrix(), in future, please use this function directly."))

    # pass on arguments
    x <- minus_rectangle_matrix( x = x, steps = steps, size = size, replacement = replacement)

  }

  # determine the size of the step
  if ( !is.null(size) ) {

    # coerce to integer
    size <- as.integer(size)

  } else if ( is.null(size) & !is.null(steps) ) {

    # calculate size
    size <- as.integer( dim(x)[1] %/% steps )

  } else if (is.null(steps) & is.null(size) ) {

    # issue warning
    warning(paste("Both steps and size parameters are NULL, setting step size to 1 (one). ") )

    # set to unit
    size <- 1L

  }

  # check that dimensions of this square matrix are a multiple of size
  if(dim(x)[1] %% size != 0) warning("Matrix dimensions are not a multiple of size, problems will occur in the bottom right (South-East) of the output matrix.")

  # remove square blocks
  for (j in 1:(dim(x)[1] %/% size) ) {
    p <- seq( ((j-1)*size + 1), j*size )
    x[p, p] <- replacement
  }

  # return output
  return(x)

}
