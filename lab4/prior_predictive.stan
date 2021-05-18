data {
  int N;
  int n[N];
  real x[N];
}

generated quantities {
  real alpha=normal_rng(0, 10);
  real beta=normal_rng(0,10);

  int y_sim[N];
  for (k in 1:N) {
    y_sim[k] = binomial_rng(n[k],inv_logit(alpha+beta*x[k]));
  }
}