clc;
clear;
close;

num_antenna = [1,2,4];

snr_db = 0:1:30;
snr_linear = 10.^(snr_db/10);
figure;
hold on;
for n = num_antenna
    h_coeff = (randn(n,length(snr_db)) + 1i*randn(n,length(snr_db)))/sqrt(2);
    snr_output = zeros(1,length(snr_db));
    for j = 1:length(snr_db)
        h_i = h_coeff(:,j);
        snr_output(j)=norm(h_i)^2 * snr_linear(j);
    end
    snr_output_db = 10 * log10(snr_output);
    plot(snr_db, snr_output_db,'DisplayName',['mrcwith',num2str(n),'antennas']);
end


xlabel('snr db');
ylabel('output snr ');
title('snr improvement comparision');
legend('show');

