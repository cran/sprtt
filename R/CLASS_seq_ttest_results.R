setClassUnion("numericORnull", c("numeric","NULL"))


#' An S4 class to represent the results of a sequential t-test.
#'
#' @slot likelihood_ratio_log the logarithmic test statistic.
#' @slot decision the test decision: "accept H1", "accept H0",
#' or "continue sampling".
#' @slot A_boundary_log the lower logarithmic boundary of the test.
#' @slot B_boundary_log the upper logarithmic boundary of the test.
#' @slot d a number indicating the specified effect size (Cohen's d).
#' @slot mu a number indicating the true value of the mean
#' (or difference in means if you are performing a two sample test).
#' @slot alpha the type I error. A number between 0 and 1.
#' @slot power 1 - beta (beta is the type II error probability). A number
#' between 0 and 1.
#' @slot likelihood_ratio the likelihood ratio of the test without logarithm.
#' @slot likelihood_1 the likelihood of the alternative Hypothesis (H1).
#' @slot likelihood_0 the likelihood of the null Hypothesis (H0).
#' @slot likelihood_1_log the logarithmic likelihood of the alternative
#' Hypothesis (H1).
#' @slot likelihood_0_log the logarithmic likelihood of the null
#' Hypothesis (H0).
#' @slot non_centrality_parameter parameter to calculate the likelihoods
#' @slot t_value the t-value of the t-statistic.
#' @slot p_value the p-value of the t-test.
#' @slot df degrees of freedom.
#' @slot mean_estimate the estimated mean or difference in means depending on
#' whether it was a one-sample test or a two-sample test.
#' @slot alternative a character string specifying the alternative hypothesis:
#'       "two.sided" (default), "greater" or "less".
#' @slot one_sample "true" if it is a one-sample test, "false" if it is a
#' two-sample test.
#' @slot ttest_method a character string indicating what type of t-test was
#' performed.
#' @slot data_name a character string giving the name(s) of the data.
#' @slot verbose a logical value whether you want a verbose output or not.
#'
#' @keywords internal
setClass(
  "seq_ttest_results",
  slots = c(
    likelihood_ratio_log = "numeric",
    decision = "character",
    A_boundary_log = "numeric",
    B_boundary_log = "numeric",
    d = "numeric",
    mu = "numericORnull",
    alpha = "numeric",
    power = "numeric",
    likelihood_ratio = "numeric",
    likelihood_1 = "numeric",
    likelihood_0 = "numeric",
    likelihood_1_log = "numeric",
    likelihood_0_log = "numeric",
    non_centrality_parameter = "numeric",
    t_value = "numeric",
    p_value = "numeric",
    df = "numeric",
    mean_estimate = "list",
    alternative = "character",
    one_sample = "logical",
    ttest_method = "character",
    data_name = "character",
    verbose = "logical",
    plot = "ANY"
  )
)

#' Method to retrieve the contents of a slot of an object of the
#'  [`seq_ttest_results-class`] class.
#'
#' @param seq_ttest_results the corresponding class to this method.
#' @param x the seq_ttest_results object.
#' @param i indices indicating elements to extract.
#' @param j not used.
#' @param drop not used.
#'
#' @return Returns the contents of the specified slot. For more information,
#' see the documentation for the [`seq_ttest_results-class`] class.
#' @export
#'
#' @keywords internal
# #' @examples
setMethod(
  f = "[",
  signature = "seq_ttest_results",
  function(x, i, j, drop){ # must be this names!
    if (i == "likelihood_ratio") {return(x@likelihood_ratio)}
    if (i == "likelihood_ratio_log") {return(x@likelihood_ratio_log)}
    if (i == "decision") {return(x@decision)}
    if (i == "A_boundary_log") {return(x@A_boundary_log)}
    if (i == "B_boundary_log") {return(x@B_boundary_log)}
    if (i == "d") {return(x@d)}
    if (i == "mu") {return(x@mu)}
    if (i == "alpha") {return(x@alpha)}
    if (i == "power") {return(x@power)}
    if (i == "likelihood_1") {return(x@likelihood_1)}
    if (i == "likelihood_0") {return(x@likelihood_0)}
    if (i == "likelihood_1_log") {return(x@likelihood_1_log)}
    if (i == "likelihood_0_log") {return(x@likelihood_0_log)}
    if (i == "non_centrality_parameter") {return(x@non_centrality_parameter)}
    if (i == "t_value") {return(x@t_value)}
    if (i == "p_value") {return(x@p_value)}
    if (i == "df") {return(x@df)}
    if (i == "mean_estimate") {return(x@mean_estimate)}
    if (i == "alternative") {return(x@alternative)}
    if (i == "one_sample") {return(x@one_sample)}
    if (i == "ttest_method") {return(x@ttest_method)}
    if (i == "data_name") {return(x@data_name)}
    if (i == "verbose") {return(x@verbose)}
    stop(paste("Wrong slot name: '", i, "' is not a slot name of the class 'seq_ttest_results'"))
  }
)


