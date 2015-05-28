## ---- matrix-------------------------------------------------------------
m <- matrix(1:64, nrow=8)
m

## ---- block_matrix-------------------------------------------------------
library(diagonals)
block_matrix(m, steps=4)

## ---- minus_block_matrix-------------------------------------------------
minus_block_matrix(m, steps=2)

## ---- steps--------------------------------------------------------------
block_matrix(m, size=2)

## ----create-non-square---------------------------------------------------
# create the matrix
nsm <- matrix(1:27, nrow=9, ncol=3 )

# test if the dimensions are multiples of size
# i.e. there are no remainders after the modulo division of dimensions by steps
dim(nsm) %% 3 # we will use 3 (three) steps

## ----apply-non-square----------------------------------------------------
rectangle_matrix(nsm, steps=3)

## ------------------------------------------------------------------------
rectangle_matrix( t(nsm), steps=3 )

## ------------------------------------------------------------------------
block_matrix(m, steps=4, replacement=-1)

## ------------------------------------------------------------------------
minus_rectangle_matrix(nsm, steps=3, replacement=666)

