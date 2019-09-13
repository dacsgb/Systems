

num = [1];
den=[1 4 20];

sys=tf(num,den);  %  1/(s^2 + 4s + 20)

step(sys) %very powerful and easy to use
pause

impulse(sys) % also powerful and easy to use
pause

t = 0:0.1:20;   % vector of time samples
u = 3*sin(t);   % the INPUT valuse

lsim(sys,u,t)  %plot the response and the input
pause

y=lsim(sys,u,t);
plot(t,y);