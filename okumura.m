clc;

hte = 40:20:160;
hre = input('enter the height of the recevier');
d = input('enter the distance from base station');
f = input('enter the freauency');
amu = input('enter the attenuation value in dB');
kcorr = input('enter the correlation factor');
c = 3*10^8;
lambda = c/(f*10^6);

lf = -10*log10((lambda^2/((4*pi)^2*(d*1000)^2)));

ghte = 20*log10(hte/200);
if(hre<=3)
    ghre = 10*log10(hre/3);
else
    ghre = 20*log10(hre/3);
end
l50_okumura = lf + amu -ghte -ghre -kcorr;

fprintf('%s %f %s\n','the median path loss the given data using okumura model :', l50_okumura, 'db');
plot(hte,l50_okumura,'LineWidth',1.5);
title('okumura model analysis');
xlabel('transmitter antenna height');
ylabel('propagation path loss at 50 km');
grid on;
