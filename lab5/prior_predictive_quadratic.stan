data {
  int N;
  real weight[N];
}

generated quantities {
  real alpha = normal_rng(150, 20);
  real beta1 = lognormal_rng(0,1);
  real beta2 = lognormal_rng(0,1);
  real sigma = exponential_rng(0.067);
  real height[N];
  for (i in 1:N) {
    height[i] = normal_rng(weight[i]*beta1+weight[i]^2*(-beta2)+alpha,sigma);
  }

}