clc

A = 5;
Z = 1.0;
Rl = 109.75;
L = 5; 
C = 10e-6;
R1 = 109.998;
R = R1 + Rl;

num = [1];
den = [L*C, R*C, 1];

TF_actual = tf(num,den);
[v_act, t_act] = step(TF_actual);

A = 5;
Z = 0.15;
Rl = 105;
L = 5; 
C = 10e-6;
R1 = 2*Z*L*sqrt(1/(L*C)) - Rl;
R = R1 + Rl;

num = [1];
den = [L*C, R*C, 1];

TF_sim = tf(num,den);
[v_sim, t_sim] = step(TF_sim);

MSE_vect = (v_sim-v_act).^2;
MSE = sum(MSE_vect)/127


figure(1)
plot(t_act,A*v_act,'-.r*')
hold on
plot(t_sim,A*v_sim)
hold off
xlabel('Time - [s]')
ylabel('Voltage - [s]')
title('System Response')
legend('Actual System','Simulated System')