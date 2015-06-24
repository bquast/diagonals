# load the package
library(diagonals)


# define context
context("fatdiag: create")

# create objects
f1 <- fatdiag(12, steps=3)
f2 <- fatdiag(12, size=4)
f3 <- fatdiag(12, size=c(3,4) )
f4 <- fatdiag(12, nrow=12, ncol=4, steps=4)

# test output format
test_that("output format matches", {
  expect_equal( dim(f1), c(12, 12) )
  expect_equal( dim(f2), c(12, 12) )
  expect_equal( dim(f3), c(9, 12) )
  expect_equal( dim(f4), c(12, 4) )
})

# test output values
test_that("output values match", {
  expect_equal( sum(f1), 48)
  expect_equal( sum(f2), 48)
  expect_equal( sum(f3), 36)
})


# define context
context("fatdiag: extract")

e1 <- fatdiag(f1, steps=3)
e2 <- fatdiag(f2, steps=4)
e3 <- fatdiag(f3, steps=3)
e4 <- fatdiag(f4, steps=3)

test_that("output size matches", {
  expect_equal( dim(e1), 48 )
  expect_equal( dim(e2), 36 )
  expect_equal( dim(e3), 36 )
  expect_equal( dim(e4), 12 )
})
