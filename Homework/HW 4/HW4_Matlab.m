clear all
clc

% Analytical Solution

t = 0:0.01:10;

m = 2; c = 4; k1 = 100; k2 = 50; 

z = c/m;

wn = (k1+k2)/m;
sz = sqrt(1-z^2);
phi = atan(sz/z);

ex = exp(-z*wn.*t);
s1 = sin(wn*sz.*t + phi);
s2 = sin(wn*sz.*t);

d1 = k1*wn^2/m;
d2 = z*wn^2;

x = 3.*(1-ex.*s1/sz)/d1 + 3.*(wn.*ex.*s2)/(d2*sz);

plot(t,x,'b')
xlabel('Time - [s]')
ylabel('Displacement - [s]')
title('Analytical Solution')
pause;

% Transfer Function Solution

num = [c,k1];
den = [m,c,k1+k2];

T = tf(num,den);
opt = stepDataOptions('StepAmplitude',3);
[xsim, t] = step(T,t,opt);
plot(t,xsim,'k')
xlabel('Time - [s]')
ylabel('Displacement - [m]')
title('Simulation Solution')
pause;

% Solution Comparison

plot(t,x,'b',t,xsim,'k')
xlabel('Time - [s]')
ylabel('Displacement - [m]')
title('Solution Comparison')
legend('Analytical Solution','Simulation Solution')
pause;