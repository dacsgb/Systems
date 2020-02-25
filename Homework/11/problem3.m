z = 0.5;

r = linspace(1e-1,1e1,10000);
m = -10.*log( (1-r.^2).^2 + (2.*z.*r).^2);

figure(1)
semilogx(r,m)
xlabel('w/wn')
ylabel('m - [dB]')
title('Normalized Bode Plot')
grid on