data {
  int N;
  real x[N];
  real<lower=0> sigma_beta;
  real<lower=0> lambda_alpha;
}

generated quantities {
  real alpha = exponential_rng(lambda_alpha);
  real<lower=0> beta = normal_rng(0, sigma_beta);
  int y[N];
  for (i in 1:N) {
    y[i] = poisson_rng(exp(-alpha+beta*x[i]));
  }
}