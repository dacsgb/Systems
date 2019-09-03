% System 1

num = [0,1];
den = [0.61,0.2,150];

sys = tf(num,den)
sys1 = ss(sys);
x0 = [1,0];
t = 0:0.02:20;
F = 0*t;
lsim(sys1,F,t,x0)
x = lsim(sys1,F,t,x0);

% System 2

num = [0,1];
den = [1.13,0.2,150];

sys = tf(num,den)
sys1 = ss(sys);
x0 = [1,0];
t = 0:0.02:20;
F = 0*t;
lsim(sys1,F,t,x0)
x = lsim(sys1,F,t,x0);