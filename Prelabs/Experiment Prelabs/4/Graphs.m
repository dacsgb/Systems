%% Part 1.4

A = 5;
R = 470;
C = 3300e-6;

t = linspace(0,2,500);
v0 = 5.*exp(-t/(R*C));

figure(1)
plot(t,v0)
title('Part 1.4')
xlabel('Time - [s]')
ylabel('Voltage - [V]')

%% Part 2.4.a
A = 5;
Z = 0.15;
Rl = 105;
L = 5; 
C = 10e-6;
R1 = 2*Z*L*sqrt(1/(L*C)) - Rl;
R = R1 + Rl;

num = [1];
den = [L*C, R*C, 1];
T1 = tf(num,den);
[v01, t1] = step(T1);

figure(2)
plot(t1,A*v01)
title('Part 2.4.a')
xlabel('Time - [s]')
ylabel('Voltage - [V]')

%% Part 2.4.b
A = 5;
Z = 1.0;
Rl = 105;
L = 5; 
C = 10e-6;
R1 = 2*Z*L*sqrt(1/(L*C)) - Rl;
R = R1 + Rl;


num = [1];
den = [L*C, R*C, 1];
T2 = tf(num,den);
[v02, t2] = step(T2);

figure(3)
plot(t2,A*v02)
title('Part 2.4.b')
xlabel('Time - [s]')
ylabel('Voltage - [V]')