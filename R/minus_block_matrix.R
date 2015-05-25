#' Minus Block matrix
#'
#' @name minus_block_matrix
#' @param x a matrix where the dimensions are both multiples of size
#' @param steps the required number of steps (block matrices) across the diagonal
#' @param size the largest dimension of the matrix being dropped over the diagonal of matrix x
#' @export
#' @examples
#' # create a square matrix
#' m <- matrix(1:64, nrow=8)
#'
#' # select a block matrix with size=2
#' minus_block_matrix(m, size=2)
#'
#' # select a block matrix with size=4
#' minus_block_matrix(m, size=4)
#'
#' # create a non-square matrix
#' nsm <- matrix(1:27, nrow=9, ncol=3 )
#'
#' # check that both dimensions are multiples of size=3
#' dim(nsm) %% 3 == c(0, 0)
#'
#' # select the diagonal size matrix
#' minus_block_matrix(nsm, size=3)

minus_block_matrix <- function( x, steps = NULL, size = NULL ) {


  if (!is.null(size)) {
    #nothing
  } else if ( is.null(size) & !is.null(steps) ) {

    # choose longest edge to set size of step
    if (dim(x)[1] >= dim(x)[2]) {
      size <- dim(x)[1] %/% steps
    } else {
      size <- dim(x)[2] %/% steps
    }

  } else if (is.null(steps) & is.null(size) ) {

    # issue warning
    warning("Both steps and size are missing, trying to infer a steps size from the dimensions.")

    if (dim(x)[1] > dim(x)[2] & dim(x)[1] %% dim(x)[2] == 0) {
      size <- dim(x)[1] %/% dim(x)[2]
      message( paste("Setting step size to", size) )
    } else if (dim(x)[2] > dim(x)[1] & dim(x)[2] %% dim(x)[1] == 0 ) {
      size <- dim(x)[2] %/% dim(x)[1]
      message( paste("Setting step size to", size) )
    } else {
      # set size to 1 integer
      size <- 1L
      warning( paste("No good step size good be infered from the dimensions, setting step size to", size) )
    }

  }

  # check if square matrix
  if ( dim(x)[1] == dim(x)[2]) {

    # check that dimensions of this square matrix are a multiple of size
    if(dim(x)[1] %% size != 0) warning("Matrix dimensions are not a multiple of size, problems will occur in the bottom right of the output matrix.")

    # remove square blocks
    for (j in 1:(dim(x)[1] %/% size) ) {
      p <- seq( ((j-1)*size + 1), j*size )
      x[p, p] <- 0
    }

  # check if size multiplied with columns equals rows
  } else if ( dim(x)[1] == (dim(x)[2]*size) ) {

    # remove square blocks
    for (j in 1:(dim(x)[1] %/% size) ) {
      p <- seq( ((j-1)*size + 1), j*size )
      q <- seq( ((j-1)*dim(x)[2]/(dim(x)[1]/size)+1), j*dim(x)[2]/(dim(x)[1]/size ) )
      x[p, q] <- 0
    }

  # check if size multiplied with columns equals rows
  } else if ( (dim(x)[1]*size) == dim(x)[2] ) {

    # remove square blocks
    for (j in 1:(dim(x)[2] %/% size) ) {
      q <- seq( ((j-1)*size + 1), j*size )
      p <- seq( ((j-1)*dim(x)[1]/(dim(x)[2]/size)+1), j*dim(x)[1]/(dim(x)[2]/size ) )
      x[p, q] <- 0
    }

  # if nothing works, return error
  } else {
    stop("dimensions are not equal (matrix is not square), or integer multiples of size")
  }

  # return output
  return(x)

}
