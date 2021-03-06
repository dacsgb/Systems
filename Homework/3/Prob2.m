function SolveODEs()
clf  %clear any existing plots

global Kv

% State defined as X = [x, xdot, p1, p2]

Kv = 1e-5;
[t1,y1] = ode45(@deriv,[0,0.1],[0,0,1e5,1e5]); % derivative, time range, initial conditions
Kv = 2e-5;
[t2,y2] = ode45(@deriv,[0,0.1],[0,0,1e5,1e5]);
Kv = 10e-5;
[t3,y3] = ode45(@deriv,[0,0.1],[0,0,1e5,1e5]);
Kv = 20e-5;
[t4,y4] = ode45(@deriv,[0,0.1],[0,0,1e5,1e5]);


plot(t1,y1(:,3),'r',t2,y2(:,3),'g',t3,y3(:,3),'b',t4,y4(:,3),'k');
title('Pressure in chamber 1');
xlabel('Time - [s]');
ylabel('Pressure 1 - [Pa]');
legend('Kvalve = 1e-5','Kvalve = 2e-5','Kvalve = 10e-5','Kvalve = 20e-5')
pause



function XDOT = deriv(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      global Kv

% Rename states
x = X(1); xdot = X(2);   p1 = X(3);   p2 = X(4);

% Initiate forcing function
y = 0.002;

% write the non-trivial equations using nice names
xddot = A*(p1-p2)/m;
p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho));
p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho));

XDOT = [ xdot; xddot;  p1dot;  p2dot] ;  %return the derivative values


