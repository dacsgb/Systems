tau = 0.5;

tw = linspace(1e-1,1e1,10000);
m = 20*log(1/tau) +20*log(tw) - 10*log(1 + tw.^2);

figure(1)
semilogx(tw,m)
xlabel('tau*w')
ylabel('m - [dB]')
title('m(tau*omega)')
grid on