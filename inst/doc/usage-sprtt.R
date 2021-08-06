## ---- echo = FALSE, message = FALSE-------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
# load the package
library(sprtt)

## -----------------------------------------------------------------------------
# show data frame --------------------------------------------------------------
head(df_income)

# sequential t-test: data argument ---------------------------------------------
seq_ttest(monthly_income ~ sex,     # x argument 
          data = df_income,
          d = 0.2)

## -----------------------------------------------------------------------------
# show data frame --------------------------------------------------------------
head(df_income)

# sequential t-test: data argument ---------------------------------------------
seq_ttest(monthly_income ~ 1,     # x argument 
          mu = 3000,
          d = 0.5,
          data = df_income)

## -----------------------------------------------------------------------------
# show data frame --------------------------------------------------------------
head(df_cancer)

# sequential t-test: $ operator ------------------------------------------------
seq_ttest(df_cancer$treatment_group, # x argument
          df_cancer$control_group,   # y argument
          d = 0.3,                   
          verbose = FALSE)           


# sequential t-test: global variables ------------------------------------------
treatment <- df_cancer$treatment_group
control <- df_cancer$control_group

seq_ttest(treatment,
          control,
          d = 0.3,
          verbose = FALSE)


## -----------------------------------------------------------------------------
# show data frame --------------------------------------------------------------
head(df_cancer)

# sequential t-test: $ operator ------------------------------------------------
seq_ttest(df_cancer$treatment_group,     # x argument
          mu = 3.5,            
          d = 0.2,
          verbose = FALSE)


# sequential t-test: global variables ------------------------------------------
treatment <- df_cancer$treatment_group

seq_ttest(treatment,     # x argument
          mu = 3.5, 
          data = df,
          d = 0.2,                  
          verbose = FALSE)


## -----------------------------------------------------------------------------
# show data frame --------------------------------------------------------------
head(df_stress)

# sequential t-test: $ operator ------------------------------------------------
seq_ttest(df_stress$baseline_stress, # x argument
          df_stress$one_year_stress, # y argument
          d = 0.3,
          paired = TRUE,
          data = df_stress)  

## -----------------------------------------------------------------------------
# show data frame --------------------------------------------------------------
head(df_income)

# sequential t-test: data argument ---------------------------------------------
seq_ttest(monthly_income ~ 1,     # x argument 
          mu = 1000,
          d = 0.3,
          alternative = "two.sided",
          data = df_income)


## -----------------------------------------------------------------------------
# sequential t-test: verbose FALSE ---------------------------------------------
seq_ttest(df_cancer$treatment_group, # x argument
          df_cancer$control_group,   # y argument
          d = 0.3,
          verbose = FALSE)

# sequential t-test: verbose TRUE ----------------------------------------------
seq_ttest(df_cancer$treatment_group, # x argument
          df_cancer$control_group,   # y argument
          d = 0.3,
          verbose = TRUE) 

## -----------------------------------------------------------------------------
# save the resuts in a object 
results <- seq_ttest(df_cancer$treatment_group,
                     df_cancer$control_group,  
                     d = 0.3)
# access the object with the @ operator 
results@decision

# access the object with the [] brackets
results["decision"]

