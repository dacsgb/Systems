clear all
clc

I = 1.8;    L1 = 0.6;   L2 = 0.6;
L3 = 1.5;   m = 3;      c = 5;
k = 100;    g = 9.81;   A = 0.25;
It = I + m*L3^2;

num = [L1*k];
den = [It, L2^2*c, (m*g*L3+L1^2*k)];
THETA = tf(num,den)
[theta2, t] = step(THETA);

wn = sqrt((m*g*L3+k*L1^2)/It);
z = (c*L2^2)/(2*wn*It);
sz = sqrt(1-z^2);
phi = atan(sz/z);
C1 = (A*L1*k)/(It*wn^2);
ex = -z.*wn.*t;
theta1 = C1.*(1-(exp(ex).*sin(wn.*sz.*t+phi))/sz) ;


figure(1)
plot(t,theta1)
title('Analytical Solution')
xlabel('Time - [s]')
ylabel('Angular Displacent - [rad]')


figure(2);
plot(t,A.*theta2)
title('Step Response')
xlabel('Time - [s]')
ylabel('Angular Displacent - [rad]')

figure(3)
plot(t,theta1,'b',t,0.25.*theta2,'k--')
title('Solution Comparison')
xlabel('Time - [s]')
ylabel('Angular Displacent - [rad]')
legend('Analytical Solution','Step Response')
pause

clc
clf(1)
clf(2)
clf(3)
