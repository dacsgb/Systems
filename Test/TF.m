m = 0.002;
k = 8e5;
c = 2;
Kf = 16;
Kb = 16;
La = 2e-3;
R = 12;
Va = 10;

num = [Kf];
den = [(m*La),(c*La+m*R),(k*La + c*R + Kf*Kb),(k*R)];
T = tf(num,den)
[y,t] = step(T);

plot(t,y*Va)
title('System Response')
xlabel('Time - [s]')
ylabel('response')
