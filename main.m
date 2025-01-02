clear all;
close all;
clc;

load("ClockSync.mat");

estimator = tau + tx_timestamps - rx_timestamps;
for i = 1:1:6 % different noise variances
    for j = 1:1:10000 % realisations
        MSE(j,i) = (-mean(estimator(:, j, i)) - phi_2)^2;
    end
end
figure;
plot(noise_var, noise_var/10, LineWidth=2)
hold on
plot(noise_var, mean(MSE, 1), LineWidth=2)
grid on
xlabel("Noise variance")
ylabel("Error")
legend("CRLB", "MSE")