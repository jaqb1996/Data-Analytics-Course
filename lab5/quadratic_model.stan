data {
  int N;
  vector[N] weight;
  real heights[N];
}

parameters {
  real alpha;
  real beta1;
  real beta2;
  real<lower=0> sigma;
}

transformed parameters {
  vector[N] mu;
  for (i in 1:N) {
    mu[i] = weight[i]*beta1+weight[i]^2*(-beta2)+alpha;
  }
}

model {
  alpha ~ normal(150, 20);
  beta1 ~ lognormal(0,1);
  beta2 ~ lognormal(0,1);
  sigma ~ exponential(0.067);
  heights ~ normal(mu,sigma);
}

generated quantities {
  real height[N];
  for (i in 1:N) {
    height[i] = normal_rng(mu[i],sigma);
  }
}

