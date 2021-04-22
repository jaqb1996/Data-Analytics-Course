data {
    int<lower=1> N;
    int passengerDeaths[N];
}
parameters {
    real<lower=0> lambda;
}
model {
    passengerDeaths ~ poisson(lambda);
    lambda ~ normal(700, 30);
}