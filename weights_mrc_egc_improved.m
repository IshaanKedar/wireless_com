clc;
clear;
close all;

num_samples = 10;
num_antennas = [2, 4];
snr_db = 0:1:30;                      % Defined but unused in this code
snr_linear = 10.^(snr_db/10);         % Defined but unused in this code

for n = num_antennas
    % Random channel coefficients (Rayleigh fading)
    h_coeff = (randn(n, num_samples) + 1i * randn(n, num_samples)) / sqrt(2);

    % MRC Weights: Proportional to channel magnitude
    w_mrc = abs(h_coeff);

    % EGC Weights: Unit magnitude, equal gain
    w_egc = ones(n, num_samples) / sqrt(n);

    % Plot average MRC weights per antenna
    figure;
    stem(1:n, mean(w_mrc, 2), 'filled');
    title(sprintf('Average MRC Weights (n = %d)', n));
    xlabel('Antenna Index');
    ylabel('Weight Magnitude');
    grid on;

    % Plot EGC weights (any sample, they’re all same)
    figure;
    stem(1:n, w_egc(:,1), 'filled');
    title(sprintf('EGC Weights (n = %d)', n));
    xlabel('Antenna Index');
    ylabel('Weight Magnitude');
    grid on;
end
