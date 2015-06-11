#' Minus Block Matrix
#'
#' @name minus_block_matrix
#' @param x a square matrix where the dimensions are integer multiples of size or integer dividors of steps
#' @param steps the required number of steps (block matrices) across the diagonal
#' @param size the width or height of the matrix being dropped over the diagonal of matrix x
#' @param replacement value to be inserted on the diagonal, by default this is zero (0).
#' @param off_diagonal should the operation be apply to the elements off the fat diagonal.
#' @param byrow should replacement occur by row, alternatively this is done by column (only relevant for replacement vectors).
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


minus_block_matrix <- function( x, steps = NULL, size = NULL, replacement = 0, off_diagonal=FALSE, byrow = TRUE ) {

  # save dimensions
  dx <- dim(x)
  # save replacment length
  lr <- length(replacement)

  # square if dimensions are right
  if (length(dx) != 2L)
    stop("not a matrix")

  # check if square matrix
  if ( dx[1] != dx[2])
    stop("not a square matrix")

  # determine the size of the step
  if ( !is.null(size) ) {

    # coerce to integer
    size <- as.integer(size)

    # create steps
    steps <- dx[1] %/% size

  } else if ( is.null(size) & !is.null(steps) ) {

    # calculate size
    size <- floor( dx[1] %/% steps )

  } else if (is.null(steps) & is.null(size) ) {

    # issue warning
    warning("Both steps and size parameters are NULL, trying to guess size")

    if (dx[1] %% sqrt(dx[1]) == 0 ) {

      size  <- sqrt(dx[1])
      steps <- sqrt(dx[1])
      warning("using the square root as steps and size")

    } else {

    # set to unit
    size <- 1L


    # create steps
    steps <- dx[1] %/% size
    }

  }

  # check that dimensions of this square matrix are a multiple of size
  if(dx[1] %% size != 0) warning("Matrix dimensions are not a multiple of size, problems will occur in the bottom right (South-East) of the output matrix.")

  if (as.integer(size^2*steps) %% lr != 0 && lr != 1L)
    stop("replacment fat diagonals has wrong length")


  # split dimension according to steps
  spl <- split_vector(1:dx[1], steps = steps)

  # create vectors
  a <- vector()
  b <- vector()

  if (!off_diagonal) {
    for (i in 1:steps) {
      a <- c(a, rep(spl[[i]], times=dx[1]-size) )
      b <- c(b, rep(setdiff(1:dx[1], spl[[i]]), each=size) )
      }
    } else {
    # insert combinations
    for (i in 1:steps) {
      a <- c(a, rep(spl[[i]], times=size) )
      b <- c(b, rep(spl[[i]], each=size) )
      }
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
