data {
  int N;
  real x1[N];
  real x2[N];
  real x3[N];
  real<lower=0> sigma;
}

generated quantities {
  real alpha = normal_rng(0,sigma);
  real beta1 = normal_rng(0,sigma);
  real beta2 = normal_rng(0,sigma);
  real beta3 = normal_rng(0,sigma);
  int y[N];
  for (i in 1:N) {
    y[i] = poisson_rng(exp(x1[i]*beta1+x2[i]*beta2+x3[i]*beta3+alpha));
  }
}
