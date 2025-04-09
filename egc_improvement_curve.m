clc;
clear;
close;

num_antenna = [1,2,4];
snr_db = 0:1:30;
snr_linear = 10.^(snr_db/10);
p = 1; %power value;
sigma2 = 0.1;

figure;
hold on;

for l = num_antenna
    h_coeff = (randn(l,length(snr_db))+1i*randn(l,length(snr_db)))/sqrt(2);
    snr_output = zeros(1,length(snr_db));
    for j = 1:length(snr_db)
        h_i = h_coeff(:,j);
        snr_output(j) = abs(sum(h_i).^2*snr_linear(j));
    end
    snroutput_db = 10*log10(snr_output);
    plot(snr_db, snroutput_db,'DisplayName',['ecg with',num2str(l),'antennas']);
end
hold off;
title('snr improvement curve for egc')
legend('show')


