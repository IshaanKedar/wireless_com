clc;
clear;
close;

num_samples = 10;
num_antennas = [2,4];
snr_db = 0:1:30;
snr_linear = 10.^(snr_db/10);

for n = num_antennas
    h_coeff = (randn(n,num_samples)+1i*randn(n,num_samples))/sqrt(2);

    w_mrc = abs(h_coeff);
    w_egc = ones(size(h_coeff))./sqrt(n);

    figure;
    stem(1:n,mean(w_mrc,2));
    title('mrc weights for n ',num2str(n));

    figure;
    stem(1:n,w_egc(:,1));
    title('egc weights for n = ',num2str(n));
end
