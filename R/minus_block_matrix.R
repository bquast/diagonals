#' Minus Block matrix
#'
#' @name minus_block_matrix
#' @param x a square matrix
#' @param step the dimensions (width = height) of the block matrix being dropped over the diagonal of matrix x
#' @export
#' @examples
#' # create a square matrix
#' m <- matrix(1:64, nrow=8)
#'
#' # select a block matrix with step=2
#' minus_block_matrix(m, step=2)
#'
#' # select a block matrix with step=4
#' minus_block_matrix(m, step=4)
#'
#' # create a non-square matrix
#' nsm <- matrix(1:27, nrow=9, ncol=3 )
#'
#' # check that both dimensions are multiples of step=3
#' dim(nsm) %% 3 == c(0, 0)
#'
#' # select the diagonal step matrix
#' minus_block_matrix(nsm, step=3)

minus_block_matrix <- function( x, step ) {

  # check if square matrix
  if ( dim(x)[1] == dim(x)[2]) {

    # check that dimensions of this square matrix are a multiple of step
    if(dim(x)[1] %% step != 0) warning("Matrix dimensions are not a multiple of step, problems will occur in the bottom right of the output matrix.")

    # remove square blocks
    for (j in 1:(dim(x)[1] %/% step) ) {
      p <- seq( ((j-1)*step + 1), j*step )
      x[p, p] <- 0
    }

  # check if step multiplied with columns equals rows
  } else if ( dim(x)[1] == (dim(x)[2]*step) ) {

    # remove square blocks
    for (j in 1:(dim(x)[1] %/% step) ) {
      p <- seq( ((j-1)*step + 1), j*step )
      q <- seq( ((j-1)*dim(x)[2]/(dim(x)[1]/step)+1), j*dim(x)[2]/(dim(x)[1]/step ) )
      x[p, q] <- 0
    }

  # check if step multiplied with columns equals rows
  } else if ( (dim(x)[1]*step) == dim(x)[2] ) {

    # remove square blocks
    for (j in 1:(dim(x)[2] %/% step) ) {
      q <- seq( ((j-1)*step + 1), j*step )
      p <- seq( ((j-1)*dim(x)[1]/(dim(x)[2]/step)+1), j*dim(x)[1]/(dim(x)[2]/step ) )
      x[p, q] <- 0
    }

  # if nothing works, return error
  } else {
    stop("dimensions are not equal (matrix is not square), or integer multiples of step")
  }

  # return output
  return(x)

}
