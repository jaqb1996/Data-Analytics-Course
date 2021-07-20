data {
  int N;
  vector[N] x;
  int y[N];
  real<lower=0> lambda_alpha;
  real<lower=0> sigma_beta;
}

parameters {
  real alpha;
  real<lower=0> beta;
}

transformed parameters {
  vector[N] lambda = x*beta-alpha;
}

model {
  alpha ~ exponential(lambda_alpha);
  beta ~ normal(0, sigma_beta);
  y ~ poisson(exp(lambda));
}

generated quantities {
  vector[N] log_lik;
  int y_ppc[N];
  for (i in 1:N) {
    log_lik[i] = poisson_lpmf(y[i] | exp(lambda[i]));
    y_ppc[i] = poisson_rng(exp(lambda[i]));
  }
}