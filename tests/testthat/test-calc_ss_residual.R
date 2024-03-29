context("calc_ss_residual")

# ANOVA ------------------------------------------------------------------------
test_that("calc_ss_residual", {
  # 3.ed edition necessary for expect_snapshot
  testthat::local_edition(3)
  set.seed(333)

  seq_anova_arguments <- build_prototype_seq_anova_arguments()
  seq_anova_arguments@data <-
    calc_group_means(
      seq_anova_arguments
    )

  expect_snapshot(
    show(
      calc_ss_residual(seq_anova_arguments)
    )
  )
})
