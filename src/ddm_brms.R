rm(list = ls())
library(tidyverse); library(data.table); library(glue); library(brms)
source('utils.R')


fname <- "../data/data_ddm_params.csv"
d <- fread(fname)
d[, unique(condition)]
d <- d[condition %in% c(0, 1)]

d[, Condition := ifelse(condition == 0, "Control", "Treatment")]
setnames(d, "platform", "Platform")
d[, platformEC := ifelse(Platform == "Lucid", 0, 1)]
d[, platformZ := zscore(platformEC)]
d[condition %in% c(0, 1), conditionEC := ifelse(condition == 0, -0.5, 0.5)]




nchains <- 4
samples <- 5000
ctrl <- list(adapt_delta = 0.99)


dv <- "boundary"
(fname <- glue("../models/{dv}"))
(y_sd <- d[conditionEC == -0.5, sd(B)] * 1 / 3) # control group outcome sd
(priors <- c(set_prior(glue("normal(0, {y_sd})"), class = "b")))
m_boundary <- brm(B ~ conditionEC * platformZ + (1 + conditionEC | study), data = d,
          prior = priors,
          cores = nchains,
          chains = nchains,
          sample_prior = TRUE,
          save_pars = save_pars(all = TRUE),
          iter = samples,
          control = ctrl,
          file = fname)
m_boundary








dv <- "driftb1"
(fname <- glue("../models/{dv}"))
(y_sd <- d[conditionEC == -0.5, sd(driftb1)] * 1 / 3) # control group outcome sd
(priors <- c(set_prior(glue("normal(0, {y_sd})"), class = "b")))
m_b1 <- brm(driftb1 ~ conditionEC * platformZ + (1 + conditionEC | study), data = d,
          prior = priors,
          cores = nchains,
          chains = nchains,
          sample_prior = TRUE,
          save_pars = save_pars(all = TRUE),
          iter = samples,
          control = ctrl,
          file = fname)
m_b1













dv <- "driftb0"
(fname <- glue("../models/{dv}"))
(y_sd <- d[conditionEC == -0.5, sd(driftb0)] * 1 / 3) # control group outcome sd
(priors <- c(set_prior(glue("normal(0, {y_sd})"), class = "b")))
m_b0 <- brm(driftb0 ~ conditionEC * platformZ + (1 + conditionEC | study), data = d,
          prior = priors,
          cores = nchains,
          chains = nchains,
          sample_prior = TRUE,
          save_pars = save_pars(all = TRUE),
          iter = samples,
          control = ctrl,
          file = fname)
m_b0







dv <- "nondectime"
(fname <- glue("../models/{dv}"))
(y_sd <- d[conditionEC == -0.5, sd(nondectime)] * 1 / 3) # control group outcome sd
(priors <- c(set_prior(glue("normal(0, {y_sd})"), class = "b")))
m_ndt <- brm(nondectime ~ conditionEC * platformZ + (1 + conditionEC | study), data = d,
          prior = priors,
          cores = nchains,
          chains = nchains,
          sample_prior = TRUE,
          save_pars = save_pars(all = TRUE),
          iter = samples,
          control = ctrl,
          file = fname)
m_ndt













dv <- "x0"
(fname <- glue("../models/{dv}"))
(y_sd <- d[conditionEC == -0.5, sd(x0)] * 1 / 3) # control group outcome sd
(priors <- c(set_prior(glue("normal(0, {y_sd})"), class = "b")))
m_startpoint <- brm(x0 ~ conditionEC * platformZ + (1 + conditionEC | study), data = d,
          prior = priors,
          cores = nchains,
          chains = nchains,
          sample_prior = TRUE,
          save_pars = save_pars(all = TRUE),
          iter = samples,
          control = ctrl,
          file = fname)
m_startpoint
