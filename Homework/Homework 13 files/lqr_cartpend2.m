clear all, close all, clc

m = 1;
M = 5;
L = 2;
g = -10;
d = 1;

s = 1; % pendulum up (s=1)

A = [0 1 0 0;
    0 -d/M -m*g/M 0;
    0 0 0 1;
    0 -s*d/(M*L) -s*(m+M)*g/(M*L) 0];

B = [0; 1/M; 0; s*1/(M*L)];


K = [0  0  0  0];

tspan = 0:.0003:10;
    y0 = [-3; 0; pi-0.1; 0];

    [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[2; 0; pi; 0])),tspan,y0);

for k=1:100:length(t)
    drawcartpend_bw(y(k,:),m,M,L);
end

% function dy = pendcart(y,m,M,L,g,d,u)