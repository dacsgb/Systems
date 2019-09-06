function SolveODEs()
clf  %clear any existing plots

% State defined as X = [x, xdot, p1,p2]
global lin; global Kv;

lin = 1; Kv = 2e-5;
[t_lin,y_lin] = ode45(  @deriv,[0,0.1],[0,0,1e5,1e5]); % derivative, time range, initial conditions

lin = 0; Kv = 0.074;
[t_nonlin,y_nonlin] = ode45(  @deriv,[0,0.1],[0,0,1e5,1e5]);

plot(t_lin,y_lin(:,3),'r',t_nonlin,y_nonlin(:,3),'b');
title('Linear and Nonlinear model comparison');
xlabel('Time - [s]');
ylabel('Pressure 1 - [Pa]');
legend('Linear solution','Non-linear solution')
pause 

function XDOT = deriv(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      global Kv
global lin

% Rename states
x = X(1); xdot = X(2);   p1 = X(3);   p2 = X(4);

% Initiate forcing function
y = 0.002;

% write the non-trivial equations using nice names
if lin == 1
    xddot = A*(p1-p2)/m;
    p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho));
    p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho));
end

% write the non-trivial equations using nice names
if lin == 0
    xddot = A*(p1-p2)/m;
    p1dot = (y*Kv*sign(ps-p1)*sqrt(abs(ps-p1))-rho*A*xdot)*((beta)/(V*rho));
    p2dot = (y*Kv*sign(p2-pa)*sqrt(abs(p2-pa))-rho*A*xdot)*((-beta)/(V*rho));
end

XDOT = [xdot; xddot;  p1dot;  p2dot] ;  %return the derivative values