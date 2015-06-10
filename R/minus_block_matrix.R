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


minus_block_matrix <- function( x, steps = NULL, size = NULL, replacement = 0, byrow = TRUE ) {

  # save dimensions
  dx <- dim(x)
  # save replacment length
  lr <- length(replacement)

  if (length(dx) != 2L)
    stop("only matrix (two dimensions) diagonals can be replaced")

  # check if square matrix
  if ( dx[1] != dx[2]) {

    # give warning
    warning(paste("The matrix", x, "is not a square matrix, passing on arguments to the function minus_rectangle_matrix(), in future, please use this function directly."))

    # pass on arguments
    x <- minus_rectangle_matrix( x = x, steps = steps, size = size, replacement = replacement)

  }

  # determine the size of the step
  if ( !is.null(size) ) {

    # coerce to integer
    size <- as.integer(size)

    # create steps
    steps <- dx[1] %/% size

  } else if ( is.null(size) & !is.null(steps) ) {

    # calculate size
    size <- as.integer( dx[1] %/% steps )

  } else if (is.null(steps) & is.null(size) ) {

    # issue warning
    warning("Both steps and size parameters are NULL, trying to guess size")

    if (dx[1] %% sqrt(dx[1]) == 0 ) {

      size  <- sqrt(dx[1])
      steps <- sqrt(dx[1])
      warning("The dimensions of x have a square root, using this as size (and steps). If future, please declare steps or size")

    } else {


    # set to unit
    size <- 1L
    }

  }

  # check that dimensions of this square matrix are a multiple of size
  if(dx[1] %% size != 0) warning("Matrix dimensions are not a multiple of size, problems will occur in the bottom right (South-East) of the output matrix.")


  if (as.integer(size^2*steps) %% lr != 0 && lr != 1L)
    stop("replacment fat diagonals has wrong length")

  spl <- split_vector(1:dx[1], steps = steps)

  # create vectors
  a <- vector()
  b <- vector()

  # insert combinations
  for (i in 1:steps) {
    a <- c(a, rep(spl[[i]], times=size) )
    b <- c(b, rep(spl[[i]], each=size) )
  }

  # transpose matrix if byrow is false (transpose back after replacement)
  if(!byrow) x <- t(x)

  # replace
  x[cbind(a,b)] <- replacement

  # transpose back
  if(!byrow) x <- t(x)

  # return output
  return(x)

}
