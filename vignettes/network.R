## ----m1------------------------------------------------------------------
# generate a dyadic matrix for 3 individuals
m <- matrix(sample(0:1, 9, replace=TRUE), nrow=3, ncol=3)
m

## ----M-------------------------------------------------------------------
M <- m %x% m
M

## ----minus_block_matrix--------------------------------------------------
# load the library
library(diagonals)

# remove the elements along the diagonal of width 2
minus_block_matrix(M, size=2)

