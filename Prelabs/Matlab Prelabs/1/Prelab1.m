% System 1

num = [0.61,0.2];
den = [0.61,0.2,150];

sys1 = tf(num,den)
sys1 = ss(sys1);
x0 = [1,0];
t = 0:0.02:20;
F = 0*t;
lsim(sys1,F,t,x0)
x = lsim(sys1,F,t,x0);
pause

% System 2

num = [1.13,0.2];
den = [1.13,0.2,150];

sys2 = tf(num,den)
sys2 = ss(sys2);
x0 = [1,0];
t = 0:0.02:20;
F = 0*t;
lsim(sys2,F,t,x0)
x = lsim(sys2,F,t,x0);
pause