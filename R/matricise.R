#' Matricise
#'
#' @name matricise
#' @param x a higher-order array (length(dim(x)) >= 3)
#' @param long should the output matrix be expanded along the rows, creating a long matrix, if FALSE then the output matrix is expanded along the columns, creating a wide matrix.
#' @return a matrix (length(dim(x)) == 2 )
#' @export

matricise <- function(x, row_dim = NULL, col_dim = NULL) {

  # save dimensions
  dx <- dim(x)

  # create row and col dims
  if (!is.null(row_dim)) {
    dr <- dx[row_dim]
  } else {
    dr <- 1L
  }
  if (!is.null(col_dim)) {
    dl <- dx[col_dim]
  } else {
    dl <- 1L
  }

  # create matrix
  m <- matrix(nrow=(dx[1]*dr), ncol=(dx[2]*dl) )

  # sort in lists
  s1 <- split_vector( 1:(dx[1]*dr), steps=dx[dr] )
  # fill output matrix
  for (i in 1:length(s1) ) {
    m[s1[[i]], ] <- x[,,i]
  }

  # sort in lists
  s2 <- split_vector( 1:(dx[2]*dl), steps=dl )

  # fill output matrix
  for (i in 1:length(s2) ) {
    m[, s2[[i]] ] <- x[,,i]
  }

  # return output matrix
  return(m)

}
