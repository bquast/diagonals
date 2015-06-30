# Matricise

matricise <- function(x) {
  dx <- dim(x)
  s <- split_vector( 1:(dx[2]*dx[3]), steps=dx[3] )

  m <- matrix( nrow=dx[1], ncol=(dx[2]*dx[3]) )

  for (i in 1:length(s) ) {
    m[, s[[i]] ] <- x[,,i]
  }

}
