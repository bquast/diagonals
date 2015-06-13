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

fatdiag <- function( x = 1, nrow=NULL, ncol=NULL, steps, size) {

    if (length(x) == 1) {

      if ( !is.null(nrow) && !is.null(ncol) ) {
        dx <- as.vector( c(nrow,ncol) )
      } else if ( !is.null(nrow) && is.null(ncol)) {
        if ("common denominator x and nrow")
          stop("nrow and x do not havea common denominator")
        dx <- as.vector(c(nrow, x))
      } else if ( is.null(nrow) && !is.null(ncol)) {
        if ("common denominator x and ncol")
          stop("ncol and x do not havea common denominator")
        dx <- as.vector(c(x, ncol))
      } else {
        dx <- as.vector( c(x, x) )
      }

      if (is.null(steps)) {
        steps <- max(dx) %/% size
      }

      # create a fat diagonal matrix
      # if ( dx[1] %% steps != 0 ) ## THIS NEEDS TO HOLD FOR BOTH
      #  stop("steps is not an integer divisor of x on all dimensions")
      size <- dx %/% steps
      m <- matrix(0, nrow=dx[1], ncol = dx[2])
      fatdiag(m, steps = steps, size = size[1]) <- 1
      return(m)

    } else if ( length(dim(x)) == 2) {

        # extract the fat diagonal

        dx <- dim(x)
        size <- dx %/% steps
        # split dimension according to steps
        spl1 <- split_vector(1:dx[1], steps = steps)
        spl2 <- split_vector(1:dx[2], steps = steps)
        # create vectors
        a <- vector()
        b <- vector()
        for (i in 1:steps) {
          a <- c(a, rep(spl1[[i]], times = size[2]) )
          b <- c(b, rep(spl2[[i]], each  = size[1]) )
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
  lv <- length(value)

  # square if dimensions are right
  if (length(dx) != 2L)
    stop("not a matrix")

  # determine the size of the step
  if ( is.null(steps) && !is.null(size) ) {

    # coerce to integer
    size <- floor(size)

    # create steps
    steps <- max(dx) %/% max(size)

  } else if ( !is.null(steps) & is.null(size) ) {

    # calculate size
    size <- dx %/% steps

  } else if (is.null(steps) & is.null(size) ) {

    # issue warning
    warning("Both steps and size parameters are NULL, trying to guess size")

    if ( all(sqrt(dx) %% 1 == 0) ) {
      size  <- sqrt(dx)
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
  if( !all(dx %% size == 0) )
    stop("Matrix dimensions are not a multiple of size")

  if (as.integer(size[1]^size[2]*steps) %% lv != 0 && lv != 1L)
    stop("value fat diagonals has wrong length")


  # split dimension according to steps
  spl1 <- split_vector(1:dx[1], steps = steps)
  spl2 <- split_vector(1:dx[2], steps = steps)

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
      a <- c(a, rep(spl1[[i]], times = size[2]) )
      b <- c(b, rep(spl2[[i]], each  = size[1]) )
      }
    }


  # transpose matrix if byrow is false (transpose back after replacement)
  if(!byrow) x <- t(x)

  # replace
  x[cbind(a,b)] <- value

  # transpose back
  if(!byrow) x <- t(x)

  # return output
  return(x)

}
