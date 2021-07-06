data {
  int<lower=0> N;
  vector[N] x1;
  vector[N] x2;
  vector[N] x3;
  int y[N];
}

parameters {
  real alpha;
  real beta1;
  real beta2;
  real beta3;
  real<lower=0> inv_phi;
}

transformed parameters {
  real<lower=0> phi = 1 / inv_phi;
}

model {
  beta1 ~ normal(0, 0.5);
  beta2 ~ normal(0, 0.5);
  beta3 ~ normal(0, 0.5);
  alpha ~ normal(0, 0.5);
  inv_phi ~ exponential(1);

  y ~ neg_binomial_2(exp(x1*beta1+x2*beta2+x3*beta3+alpha), phi);
}

generated quantities {
  int y_ppc[N];
  for (i in 1:N) {
    y_ppc[i] = neg_binomial_2_rng(exp(x1[i]*beta1+x2[i]*beta2+x3[i]*beta3+alpha), phi);
  }
}