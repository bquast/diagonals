context("square block matrix")

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

context("wide block matrix")

# create matrix
m4x8 <- matrix(1:(4*8), nrow = 4)
m3x9 <- matrix(1:(3*9), nrow = 3)

# apply block_matrix()
bm4x8 <- block_matrix(m4x8, 2)
bm3x9 <- block_matrix(m3x9, 3)


test_that("output size matches", {
  expect_equal(dim(bm4x8), c(4, 8) )
  expect_equal(dim(bm3x9), c(3, 9) )
})

test_that("output content matches", {
  expect_equal(rowSums(bm4x8), c(6, 24, 42, 60) )
  expect_equal(rowSums(bm3x9), c(12, 42, 72) )
})

context("long block matrix")

# create matrix
m8x4 <- matrix(1:(8*4), nrow = 8)
m9x3 <- matrix(1:(9*3), nrow = 9)

# apply block_matrix()
bm8x4 <- block_matrix(m8x4, 2)
bm9x3 <- block_matrix(m9x3, 3)


test_that("output size matches", {
  expect_equal(dim(bm8x4), c(8, 4) )
  expect_equal(dim(bm9x3), c(9, 3) )
})

test_that("output content matches", {
  expect_equal(rowSums(bm8x4), c(1, 2, 11, 12, 21, 22, 31, 32) )
  expect_equal(rowSums(bm9x3), c(1, 2, 3, 13, 14, 15, 25, 26, 27) )
})
