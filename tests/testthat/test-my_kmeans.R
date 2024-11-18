test_that("my_kmeans works correctly", {
  data <- matrix(rnorm(100), ncol = 2)
  result <- my_kmeans(data, centers = 3, nstart = 10)
  expect_true(is.list(result))
  expect_equal(length(result$cluster), 50)
})
