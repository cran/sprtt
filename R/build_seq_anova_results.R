build_seq_anova_results <- function(
  seq_anova_arguments,
  likelihoods,
  boundaries,
  decision,
  non_centrality_parameter,
  ss_effect,
  ss_residual,
  ss_total,
  F_statistic,
  effect_sizes
){

  seq_anova_results <-
    new(
      "seq_anova_results",
      likelihood_ratio = likelihoods["ratio"][[1]],
      likelihood_ratio_log = likelihoods["ratio_log"][[1]],
      decision = decision,
      A_boundary_log = boundaries["A"][[1]],
      B_boundary_log = boundaries["B"][[1]],
      f = seq_anova_arguments["f"],
      effect_sizes = effect_sizes,
      alpha = seq_anova_arguments["alpha"],
      power = seq_anova_arguments["power"],
      likelihood_1 = likelihoods["likelihood_1"][[1]],
      likelihood_0 = likelihoods["likelihood_0"][[1]],
      likelihood_1_log = likelihoods["likelihood_1_log"][[1]],
      likelihood_0_log = likelihoods["likelihood_0_log"][[1]],
      non_centrality_parameter = non_centrality_parameter,
      F_value = F_statistic["F_value"][[1]],
      df_1 = F_statistic["df_1"][[1]],
      df_2 = F_statistic["df_2"][[1]],
      ss_effect = ss_effect,
      ss_residual = ss_residual,
      ss_total = ss_total,
      total_sample_size = seq_anova_arguments["total_sample_size"],
      data_name = seq_anova_arguments["data_name"],
      verbose = seq_anova_arguments["verbose"]
    )
  seq_anova_results
}
