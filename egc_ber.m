clc;
clear;
close all;

num_antenna = [1, 2, 4];
snr_db = 0:1:30;
snr_linear = 10.^(snr_db / 10);
p = 1; % Transmit power
sigma2 = 0.1;

% Plot 1: SNR Improvement
figure(1);
hold on;

% Plot 2: BER
figure(2);
hold on;

for l = num_antenna
    h_coeff = (randn(l, length(snr_db)) + 1i * randn(l, length(snr_db))) / sqrt(2);
    snr_output = zeros(1, length(snr_db));
    ber = zeros(1, length(snr_db));
    
    for j = 1:length(snr_db)
        h_i = h_coeff(:, j);
        
        % Equal Gain Combining (EGC)
        y_comb = sum(h_i); % Sum all antenna outputs (EGC assumes phase alignment)
        snr_output(j) = abs(y_comb).^2 * snr_linear(j);
        
        % BER for BPSK
        ber(j) = qfunc(sqrt(2 * snr_output(j)));
    end
    
    % Plot SNR Improvement
    figure(1);
    snroutput_db = 10 * log10(snr_output);
    plot(snr_db, snroutput_db, 'DisplayName', ['EGC with ', num2str(l), ' antennas']);
    
    % Plot BER
    figure(2);
    semilogy(snr_db, ber, 'DisplayName', ['EGC with ', num2str(l), ' antennas']);
end

% Finalize SNR Plot
figure(1);
title('SNR Improvement Curve for EGC');
xlabel('Input SNR (dB)');
ylabel('Output SNR (dB)');
legend('show');
grid on;

% Finalize BER Plot
figure(2);
title('BER vs SNR for EGC with BPSK');
xlabel('SNR (dB)');
ylabel('BER (log scale)');
legend('show');
grid on;
