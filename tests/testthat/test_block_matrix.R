context("block matrix")

# create matrix
m8x8 <- matrix(1:(8*8), nrow = 8)
m9x9 <- matrix(1:(9*9), nrow = 9)

# apply block_matrix()
bm8x8 <- block_matrix(m8x8, 2)
bm9x9 <- block_matrix(m9x9, 3)


test_that("output size matches", {
  expect_equal(dim(bm8x8), c(8, 8) )
  expect_equal(dim(bm9x9), c(9, 9) )
})

test_that("output content matches", {
  expect_equal(rowSums(bm8x8), c(10, 12, 46, 48, 82, 84, 118, 120) )
  expect_equal(rowSums(bm9x9), c(30, 33, 36, 120, 123, 126, 210, 213, 216) )
})

