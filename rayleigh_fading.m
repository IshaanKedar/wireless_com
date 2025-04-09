clc;
clear;
close;


numsamples = 10000;

x = randn(numsamples,1);
y = randn(numsamples,1);

z = sqrt(x.^2+y.^2);

figure;
[rx,ry] = hist(z,100);
rx = rx/trapz(ry,rx);
plot(ry,rx,'b','LineWidth',2);

title('simulated pdf rayleigh');
sigma = 1;
x = linspace(0,5,1000);
pdf_theo = (x/sigma^2).*exp(-x.^2/(2*sigma^2));

hold on;
plot(x,pdf_theo,'r',LineWidth=2);
legend('simulated','thoeretical');
hold off;

%rician

a = 2;
sigma = 1;

x = sigma*randn(numsamples,1)+a;
y = sigma*randn(numsamples,1);

R = sqrt(x.^2 + y.^2);

figure;
[ricx,ricy] = hist(R,100);
ricx = ricx/trapz(ricy,ricx);
plot(ricy,ricx,'b','LineWidth',2);
%histogram(R, 'Normalization', 'pdf');
title('Simulated PDF of Rician Random Variable');
xlabel('r');
ylabel('Probability Density Function');

% Theoretical PDF of Rician distribution
r = linspace(0, 5, 1000);
pdf_rician = (r/sigma^2).*exp(-(r.^2+a^2)/(2*sigma^2)).*besseli(0,(a.*r)/sigma^2);
hold on;
plot(r, pdf_rician, 'r', 'LineWidth', 2);
legend('Simulated', 'Theoretical');
hold off;



