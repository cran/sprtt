#* @testing build_seq_ttest_arguments

context("build_seq_ttest_arguments: Check structure of the class object")

test_that("build_seq_ttest_arguments: errors", {
  input1 <- TRUE
  mu <- 0
  d <- 0.8
  alpha <- .05
  power <- .80
  alternative <- "two.sided"
  paired <- FALSE
  data_name <- "testname"
  expect_error(
    build_seq_ttest_arguments(input1, y = NULL, data = NULL,
                          mu, d, alpha, power, alternative, paired, data_name, na.rm),
    "argument hast to be either 'formula' or 'numeric'"
  )
})

test_that("build_seq_ttest_arguments: numeric", {
  input1 <- rnorm(10)
  mu <- 0
  d <- 0.8
  alpha <- .05
  power <- .80
  alternative <- "two.sided"
  paired <- FALSE
  data_name <- "test name"
  na.rm <- TRUE
  test <- build_seq_ttest_arguments(input1, y = NULL, data = NULL,
                                    mu, d, alpha, power, alternative, paired, data_name, na.rm)
  expect_equal(test@x, input1)
  expect_equal(test@y, NULL)
  expect_equal(test@mu, mu)
  expect_equal(test@d, d)
  expect_equal(test@alpha, alpha)
  expect_equal(test@power, power)
  expect_equal(test@alternative, alternative)
  expect_equal(test@paired, paired)
  expect_equal(test@one_sample, TRUE)
  # expect_equal(test@one_sided, FALSE)


  y <- rnorm(10)
  alternative <- "less"
  paired <- FALSE
  test <- build_seq_ttest_arguments(input1, y, data = NULL,
                                mu, d, alpha, power, alternative, paired, data_name, na.rm)
  expect_equal(test@x, input1)
  expect_equal(test@y, y)
  expect_equal(test@mu, mu)
  expect_equal(test@d, d)
  expect_equal(test@alpha, alpha)
  expect_equal(test@power, power)
  expect_equal(test@alternative, alternative)
  expect_equal(test@paired, paired)
  expect_equal(test@one_sample, FALSE)
  # expect_equal(test@one_sided, TRUE)

  y <- rnorm(10)
  alternative <- "greater"
  paired <- TRUE
  test <- build_seq_ttest_arguments(input1, y = NULL, data = NULL,
                                mu, d, alpha, power, alternative, paired, data_name, na.rm)

  expect_equal(test@alternative, alternative)
  expect_equal(test@one_sample, TRUE)
  # expect_equal(test@one_sided, TRUE)

})

test_that("build_seq_ttest_arguments: formula", {
  input1 <- a~b
  a_1 <- rnorm(5)
  a_2 <- rnorm(5)
  a <- c(a_1, a_2)
  b <- as.factor(c(rep(1,5),rep(2,5)))

  mu <- 0
  d <- 0.8
  alpha <- .05
  power <- .80
  alternative <- "two.sided"
  paired <- FALSE
  data_name <- "test name"
  na.rm <- TRUE
  test <- build_seq_ttest_arguments(input1, y = NULL, data = NULL,
                        mu, d, alpha, power, alternative, paired, data_name, na.rm)
  expect_equal(test@x, a_1)
  expect_equal(test@y, a_2)
  expect_equal(test@mu, mu)
  expect_equal(test@d, d)
  expect_equal(test@alpha, alpha)
  expect_equal(test@power, power)
  expect_equal(test@alternative, alternative)
  expect_equal(test@paired, paired)
  expect_equal(test@one_sample, FALSE)
  # expect_equal(test@one_sided, FALSE)



  c <- rnorm(10)
  data <- data.frame(a,c,b)
  test <- build_seq_ttest_arguments(input1, y = NULL, data,
                        mu, d, alpha, power, alternative, paired, data_name, na.rm)
  expect_equal(test@x, a_1)
  expect_equal(test@y, a_2)

  a_1 <- c(NA, 1:5, NA)
  a_2 <- c(NA, 6:10, NA)
  a <- c(a_1, a_2)
  b <- as.factor(c(rep(1,7),rep(2,7)))

  data <- data.frame(a,b)
  test <- build_seq_ttest_arguments(input1, y = NULL, data,
                                mu, d, alpha, power, alternative, paired, data_name, na.rm)
  expect_equal(test@x, 1:5)
  #expect_equal(test@y, 6:10)

})

# context("")
# test_that("", {
#
#
# })
