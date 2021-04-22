data {
   int<lower=0> T;
   int<lower=0> N;
   real<lower=0> alfa;
   real<lower=0> beta;
}
parameters {
   real<lower=0, upper=1> p;
}
model {
    p ~ beta(alfa, beta); // prior for p
    T ~ binomial(N, p);
}