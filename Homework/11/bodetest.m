z = 0.5;
C = 1e-5;
L = 4e-3;

wn = sqrt(1/(L*C));
R = 2*L*z*wn

num = [1];
den = [L*C, R*C, 1]
T = tf(num,den)

r = linspace(1e-1,1e1,10000);
m = -10.*log( (1-r.^2).^2 + (2.*z.*r).^2);


[mag, phase, w] = bode(T,r*wn);

mag=squeeze(mag);
phase = squeeze(phase);

magdb = 20*log(mag);
figure(2)
semilogx(r,m,'r')
hold on
semilogx(r,magdb,'b--')
hold off
legend('Analytical Solution', 'Matlab Bode Solution')
xlabel('w/wn')
ylabel('m - [dB]')


