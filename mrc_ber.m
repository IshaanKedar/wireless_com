clc;
clear;
close all;

num_antenna = [1, 2, 4];
snr_db = 0:1:30;
snr_linear = 10.^(snr_db / 10);

% Plot 1: SNR improvement
figure(1);
hold on;

% Plot 2: BER
figure(2);
hold on;

for n = num_antenna
    h_coeff = (randn(n, length(snr_db)) + 1i * randn(n, length(snr_db))) / sqrt(2);
    snr_output = zeros(1, length(snr_db));
    ber = zeros(1, length(snr_db));
    
    for j = 1:length(snr_db)
        h_i = h_coeff(:, j);
        
        % MRC combining: output SNR is sum of individual SNRs
        snr_output(j) = norm(h_i)^2 * snr_linear(j);
        
        % BER for BPSK
        ber(j) = qfunc(sqrt(2 * snr_output(j)));
    end
    
    % Plot SNR improvement
    figure(1);
    snr_output_db = 10 * log10(snr_output);
    plot(snr_db, snr_output_db, 'DisplayName', ['MRC with ', num2str(n), ' antennas']);
    
    % Plot BER
    figure(2);
    semilogy(snr_db, ber, 'DisplayName', ['MRC with ', num2str(n), ' antennas']);
end

% Finalize SNR plot
figure(1);
xlabel('Input SNR (dB)');
ylabel('Output SNR (dB)');
title('SNR Improvement Comparison (MRC)');
legend('show');
grid on;

% Finalize BER plot
figure(2);
xlabel('Input SNR (dB)');
ylabel('BER (log scale)');
title('BER vs SNR for MRC with BPSK');
legend('show');
grid on;
