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
}

transformed parameters {
  vector[N] lambda = x1*beta1+x2*beta2+x3*beta3+alpha;
}

model {
  beta1 ~ normal(0, 0.5);
  beta2 ~ normal(0, 0.5);
  beta3 ~ normal(0, 0.5);
  alpha ~ normal(0, 0.5);

  y ~ poisson(exp(lambda));
}

generated quantities {
  int y_ppc[N];
  for (i in 1:N) {
    y_ppc[i] = poisson_rng(exp(lambda[i]));
  }
}