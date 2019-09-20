clear all
clc
clf

% Analytical Solution

t = 0:0.01:10;

m = 2; c = 4; k1 =0; k2 = 50; A = 3;

ke = k1+k2;
z = c/(2*sqrt(ke*m))
wn = sqrt(ke/m)
sz = sqrt(1-z^2)
phi = atan(sz/z^2)

ex = exp(-z.*wn.*t);
s1 = sin(wn.*sz.*t);
s2 = sin(wn.*sz.*t + phi);

C1 = A*c/(k1+k2);
C2 = A*k1/(k1+k2);

x = C1.*((wn.*ex.*s1)/(sz)) + C2.*(1-(ex.*s2)/sz);

plot(t,x,'b')
xlabel('Time - [s]')
ylabel('Displacement - [s]')
title('Analytical Solution')
pause;

% Transfer Function Solution

num = [c,k1];
den = [m,c,k1+k2];

T = tf(num,den);
opt = stepDataOptions('StepAmplitude',A);
[xsim, t] = step(T,t,opt);
plot(t,xsim,'k')
xlabel('Time - [s]')
ylabel('Displacement - [m]')
title('Simulation Solution')
pause;

% Solution Comparison

plot(t,x,'b',t,xsim,'o')
xlabel('Time - [s]')
ylabel('Displacement - [m]')
title('Solution Comparison')
legend('Analytical Solution','Simulation Solution')
pause;

clear all
clc
clf