clc;
clear all;
close all;

hte = 40:20:160;
f =1;
t = input('enter type of city 1-small or medium, 2 -large');
u = input('enter type of city 1-urban, 2suburban, 3 rural');

hre = input('enter height of receiving antenna in meter');
d = input('distance from base station in km');
f = input('enter the frequency in MHz');

if(t==1)
    ahre = (1.1*log10(f)-0.7)*hre-(1.56*log10(f)-0.8);
elseif f<=300
    ahre = 8.29*(log10(1.54*hre))^2-1.1;
else
    ahre = 3.2*(log10(11.75*hre))^2-4.97;
end
l50_hata = 69.66+26.6*log10(f)-13.82*log10(hte)-ahre + (44.9 - 6.55*log10(hte))*log10(d);

if u == 2
    l50_hata = l50_hata - (2*(log10(f/28))^2)-5.4;
elseif u ==3
    l50_hata = l50_hata - (4.78*(log10(f))^2)+18.33*log10(f)-40.94;
end

fprintf("%s %f %s",'median path loss using hata: ',l50_hata,'db');
plot(hte, l50_hata);
title('hata model analysis');
xlabel('transmitter height');
ylabel('prpagation loss');
grid on;




