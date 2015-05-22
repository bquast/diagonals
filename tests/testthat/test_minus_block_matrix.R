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
