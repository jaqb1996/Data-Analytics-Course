data {
   int<lower=0> T;
   int<lower=0> N;
}
parameters {
   real<lower=0, upper=1> p;
}
model {
    p ~ uniform(0, 1); // prior for p
    T ~ binomial(N, p);
}