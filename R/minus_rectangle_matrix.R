#' Minus Rectangle Matrix
#'
#' @name minus_rectangle_matrix
#' @param x a matrix where the dimensions are both multiples of size
#' @param steps the required number of steps (block matrices) across the diagonal
#' @param size the largest dimension of the matrix being dropped over the diagonal of matrix x
#' @param replacement value to be inserted on the diagonal, by default this is zero (0).
#' @export
#' @examples
#' # create a non-square matrix
#' nsm <- matrix(1:27, nrow=9, ncol=3 )
#'
#' # check that both dimensions are multiples of steps=3
#' dim(nsm) %% 3 == c(0, 0)
#'
#' # select the diagonal matrix
#' minus_block_matrix(nsm, steps=3)


minus_rectangle_matrix <- function( x, steps = NULL, size = NULL, replacement = 0 ) {

  # create a global variable
  wide <- TRUE

  if ( dim(x)[1] > dim(x)[2] ) {

    # set to false if not wide
    wide <- FALSE

  } else if ( dim(x)[1] == dim(x)[2] ) {

    # create a warning
    warning(paste("The matrix", x, "is a square matrix, passing on arguments to the function minus_block_matrix(), in future please use minus_block_matrix() directly.") )

    # pass arguments on to minus_block_matrix()
    x <- minus_block_matrix( x = x, steps = steps, size = size, replacement = replacement )

  }


  if ( !is.null(size) ) {

    # coerce to integer
    size <- as.integer(size)

  } else if ( is.null(size) & !is.null(steps) & wide ) {

    # calculate size using the width
    size <- as.integer( dim(x)[2] %/% steps )

  } else if ( is.null(size) & !is.null(step) & wide==FALSE ) {

    # calculate size using the height
    size <- as.integer( dim(x)[1] %/% steps )

  } else if (is.null(steps) & is.null(size) ) {

    # issue warning
    warning("Both steps and size parameters are NULL, trying to infer a steps size from the dimensions.")

    # try to infer size from dimensions
    if ( wide & dim(x)[2] %% dim(x)[1] == 0 ) {
      # since wide with integer division, use columns to infer size
      size <- as.integer( dim(x)[2] %/% dim(x)[1] )
      # signal inferred size
      message( paste("Setting size to", size) )
    } else if ( wide==FALSE & dim(x)[1] %% dim(x)[2] == 0 ) {
      # since long with integer division, use rows to infer size
      size <- as.integer( dim(x)[1] %/% dim(x)[2] )
      # signal inferred size
      message( paste("Setting size to", size) )
    } else {
      # set size to 1 integer
      size <- 1L
      # issue warning
      warning( paste("No good size good be infered from the dimensions, setting size to", size) )
    }

  }

  if ( wide ) {

    # remove square blocks
    for (j in 1:(dim(x)[2] %/% size) ) {
      q <- seq( ((j-1)*size + 1), j*size )
      p <- seq( ((j-1)*dim(x)[1]/(dim(x)[2]/size)+1), j*dim(x)[1]/(dim(x)[2]/size ) )
      x[p, q] <- replacement
    }

  # check if size multiplied with columns equals rows
  } else {

    # remove square blocks
    for (j in 1:(dim(x)[1] %/% size) ) {
      p <- seq( ((j-1)*size + 1), j*size )
      q <- seq( ((j-1)*dim(x)[2]/(dim(x)[1]/size)+1), j*dim(x)[2]/(dim(x)[1]/size ) )
      x[p, q] <- replacement
    }

  }

  # return output
  return(x)

}
