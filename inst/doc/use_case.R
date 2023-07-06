## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(sprtt)

## ---- echo=TRUE---------------------------------------------------------------
d <- 0.2

## ---- echo=TRUE---------------------------------------------------------------
alpha <- 0.05
power <- 0.95

## ---- echo=TRUE---------------------------------------------------------------
paired <- TRUE

## ---- echo=TRUE---------------------------------------------------------------
alternative <- "greater"

## ---- echo=TRUE---------------------------------------------------------------
# first data from the Human Resources department ---
# current sample size
n_person <- 2

# get data
df <- df_stress[1:n_person,]

# print data
df

# sequential t-test
results <- seq_ttest(df$one_year_stress,
                     df$baseline_stress,
                     alpha = alpha,
                     power = power,
                     d = d,
                     paired = paired,
                     alternative = alternative,
                     verbose = FALSE)

# print results: console output
results

## ---- echo=TRUE---------------------------------------------------------------
results@decision

## ---- echo=TRUE---------------------------------------------------------------
# new data from the Human Resources department ---
# get one more person
n_person <- n_person + 1
df <- df_stress[1:n_person,]

# print new data
df

# sequential t-test
results <- seq_ttest(df$one_year_stress,
                     df$baseline_stress,
                     alpha = alpha,
                     power = power,
                     d = d,
                     paired = paired,
                     alternative = alternative,
                     verbose = FALSE)

# print results
results@decision

## ---- echo=TRUE---------------------------------------------------------------
# define the starting point
decision <- "continue sampling"
n_person <- 3

# simulation of the sequential procedure
while(decision == "continue sampling") {
  # get the current data
  df <- df_stress[1:n_person,]
  
  # run the sequential test and save the results
  results <- seq_ttest(df$one_year_stress,
                       df$baseline_stress,
                       alpha = alpha,
                       power = power,
                       d = d,
                       paired = paired,
                       alternative = alternative)
  # save the current desicion
  decision <- results@decision
  
  # add a new person
  n_person <- n_person + 1
  
  # break if the maximum of the data is reached
  if (n_person > nrow(df_stress)) {
    break
  }
}

# console output
results

## ---- echo=TRUE---------------------------------------------------------------
# Required results for the report

# likelihood ratio (LR)
LR <- round(results@likelihood_ratio, digits = 2)
LR

# sample size (N) = degrees of freedom +2 (two-samples) or +1 (one-sample & paired)
N <- results@df + 1
N

# baseline stress (M and SD)
mean_t1 <- round(mean(df$baseline_stress), digits = 2)
mean_t1
sd_t1 <- round(sd(df$baseline_stress), digits = 2)
sd_t1

# after one year stress (M and SD)
mean_t2 <- round(mean(df$one_year_stress), digits = 2)
mean_t2
sd_t2 <- round(sd(df$one_year_stress), digits = 2)
sd_t2

# NOT INCLUDED IN THE PACKAGE 

# calculate effect size: Cohen´s d
d_results <- effsize::cohen.d(df$one_year_stress,
                 df$baseline_stress,
                 paired = TRUE)
d <- round(d_results$estimate, digits = 2)
d

# confidence intervall
d_lower <- round(d_results$conf.int[[1]], digits = 2)
d_lower
d_upper <- round(d_results$conf.int[[2]], digits = 2)
d_upper

