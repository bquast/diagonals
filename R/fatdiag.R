#' Fat Matrix Diagonals
#'
#' @name fatdiag
#' @param x a square matrix where the dimensions are integer multiples of size or integer dividors of steps
#' @param steps the required number of steps (block matrices) across the diagonal
#' @param size the width or height of the matrix being dropped over the diagonal of matrix x
#' @param replacement value to be inserted on the diagonal, by default this is zero (0).
#' @param on_diagonal should the operation be apply to the elements on the fat diagonal.
#' @param byrow should replacement occur by row, alternatively this is done by column (only relevant for replacement vectors).
#' @details Either steps or size is expected to be provided.
#' @export
#' @examples
#' # create a square matrix
#' m <- matrix(111, nrow=8, ncol=8)
#'
#' # select a block matrix with two steps
#' fatdiag(m, steps=2)
#'
#' # select a block matrix with four steps
#' fatdiag(m, steps=4)

fatdiag <- function( x = 1, nrow, ncol, steps, size) {

#       if (is.matrix(x)) {
#       if (nargs() > 1L)
#         stop("'nrow' or 'ncol' cannot be specified when 'x' is a matrix")
#       if ((m <- min(dim(x))) == 0L)
#         return(vector(typeof(x), 0L))
#       y <- c(x)[1 + 0L:(m - 1L) * (dim(x)[1L] + 1)]
#       nms <- dimnames(x)
#       if (is.list(nms) && !any(sapply(nms, is.null)) && identical((nm <- nms[[1L]][seq_len(m)]),
#                                                                   nms[[2L]][seq_len(m)]))
#         names(y) <- nm
#       return(y)
#     }
#     if (is.array(x) && length(dim(x)) != 1L)
#       stop("'x' is an array, but not one-dimensional.")
#     if (missing(x))
#       n <- nrow
#     else if (length(x) == 1L && nargs() == 1L) {
#       n <- as.integer(x)
#       x <- 1
#     }
#     else n <- length(x)
#     if (!missing(nrow))
#       n <- nrow
#     if (missing(ncol))
#       ncol <- n
#     .Internal(diag(x, n, ncol))
    if (length(x) == 1) {
      if ( !is.null(steps) ) {
        # check if fits
        if ( !x %% steps == 0 )
          stop("steps is not an integer divisor of x")
        size <- x %/% steps
        dims <- steps*size
        m <- matrix(0, nrow=dims, ncol = dims)
        fatdiag(m, steps = steps, size = size) <- 1
        return(m)
      }
      }
  else if ( length(dim(x)) == 2) {
        # extract the fat diagonal

        dims <- dim(x)
        size <- dims[1] %/% steps
        # split dimension according to steps
        spl <- split_vector(1:dims[1], steps = steps)
        # create vectors
        a <- vector()
        b <- vector()
        for (i in 1:steps) {
          a <- c(a, rep(spl[[i]], times=size) )
          b <- c(b, rep(spl[[i]], each=size) )
        }
        return( x[cbind(a,b)] )
      }
}


#' @rdname fatdiag
#' @export
`fatdiag<-` <- function( x, value, steps = NULL, size = NULL, on_diagonal=TRUE, byrow = TRUE ) {

  # save dimensions
  dx <- dim(x)
  # save value length
  lr <- length(value)

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
  if(dx[1] %% size != 0)
    stop("Matrix dimensions are not a multiple of size")

  if (as.integer(size^2*steps) %% lr != 0 && lr != 1L)
    stop("value fat diagonals has wrong length")


  # split dimension according to steps
  spl <- split_vector(1:dx[1], steps = steps)

  # create vectors
  a <- vector()
  b <- vector()

  if (!on_diagonal) {
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
  x[cbind(a,b)] <- value

  # transpose back
  if(!byrow) x <- t(x)

  # return output
  x

}
