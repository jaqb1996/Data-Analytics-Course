data {
  int M;
  int N[M];
  real X[M];
  int y[M];
}
parameters {
  real alpha;
  real beta;
}

transformed parameters {
  vector[M] theta;
  for (k in 1:M) {
    theta[k] = inv_logit(alpha+beta*X[k]);
  }
}

model {
  target += student_t_lpdf(alpha|5,0,10);
  target += student_t_lpdf(beta|5,0,10);
  for (k in 1:M) {
    target += binomial_lpmf(y[k]|N[k],theta[k]);
  }
}

generated quantities {
  int y_sim[M];
  for (k in 1:M) {
    y_sim[k] = binomial_rng(N[k],theta[k]);
  }
}