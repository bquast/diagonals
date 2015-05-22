context("square minus block matrix")

# create matrix
m8x8 <- matrix(1:(8*8), nrow = 8)
m9x9 <- matrix(1:(9*9), nrow = 9)

# apply block_matrix()
mbm8x8 <- minus_block_matrix(m8x8, 2)
mbm9x9 <- minus_block_matrix(m9x9, 3)


test_that("output size matches", {
  expect_equal(dim(mbm8x8), c(8, 8) )
  expect_equal(dim(mbm9x9), c(9, 9) )
})

test_that("output content matches", {
  expect_equal(rowSums(mbm8x8), c(222, 228, 202, 208, 182, 188, 162, 168) )
  expect_equal(rowSums(mbm9x9), c(303, 309, 315, 240, 246, 252, 177, 183, 189) )
})

context("wide minus block matrix")

# create matrix
m4x8 <- matrix(1:(4*8), nrow = 4)
m3x9 <- matrix(1:(3*9), nrow = 3)

# apply minus_block_matrix()
mbm4x8 <- minus_block_matrix(m4x8, 2)
mbm3x9 <- minus_block_matrix(m3x9, 3)


test_that("output size matches", {
  expect_equal(dim(mbm4x8), c(4, 8) )
  expect_equal(dim(mbm3x9), c(3, 9) )
})

test_that("output content matches", {
  expect_equal(rowSums(mbm4x8), c(114, 104, 94, 84) )
  expect_equal(rowSums(mbm3x9), c(105, 84, 63) )
})

context("long minus block matrix")

# create matrix
m8x4 <- matrix(1:(8*4), nrow = 8)
m9x3 <- matrix(1:(9*3), nrow = 9)

# apply minus_block_matrix()
mbm8x4 <- minus_block_matrix(m8x4, 2)
mbm9x3 <- minus_block_matrix(m9x3, 3)


test_that("output size matches", {
  expect_equal(dim(mbm8x4), c(8, 4) )
  expect_equal(dim(mbm9x3), c(9, 3) )
})

test_that("output content matches", {
  expect_equal(rowSums(mbm8x4), c(51, 54, 49, 52, 47, 50, 45, 48) )
  expect_equal(rowSums(mbm9x3), c(29, 31, 33, 26, 28, 30, 23, 25, 27) )
})
