data {
    int<lower=1> N;
    vector[N] miles;
    int passengerDeaths[N];
}
parameters {
    real<lower=0> theta;
}
model {
    theta ~ normal(0.1, 0.044);
    for (i in 1:N) {
       passengerDeaths[i] ~ poisson(miles[i]*theta);
    }
}