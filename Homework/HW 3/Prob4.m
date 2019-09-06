function SolveODEs()
clf  %clear any existing plots

% State defined as X = [xdot, p1,p2]
start = 0;
finish = 0.1;
[t_lin,y_lin] = ode45(  @deriv_lin,[start,finish],[0,1e5,1e5]); % derivative, time range, initial conditions
[t_nonlin,y_nonlin] = ode45(  @deriv_nonlin,[start,finish],[0,1e5,1e5]);

plot(t_lin,y_lin(:,2),'r',t_nonlin,y_nonlin(:,2),'b'); %tvals,yvals, color and style
title('Pressure in chamber 1 and 2');
xlabel('Time - [s]');
ylabel('Pressure 1 - [Pa]');
legend('Linear solution','Non-linear solution')
pause % hit enter to go to the next plot

function XDOT = deriv_lin(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      Kv = 2e-5;

% Rename states
xdot = X(1);   p1 = X(2);   p2 = X(3);

% Initiate forcing function
y = 0.002;

% write the non-trivial equations using nice names
xddot = A*(p1-p2)/m;
p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho));
p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho));

XDOT = [ xddot;  p1dot;  p2dot] ;  %return the derivative values

function XDOT = deriv_nonlin(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      Kv = 2e-5;

% Rename states
xdot = X(1);   p1 = X(2);   p2 = X(3);

% Initiate forcing function
y = 0.002;

% write the non-trivial equations using nice names
xddot = A*(p1-p2)/m;
p1dot = (y*Kv*sign(ps-p1)*sqrt(abs(ps-p1))-rho*A*xdot)*((beta)/(V*rho));
p2dot = (y*Kv*sign(p2-pa)*sqrt(abs(p2-pa))-rho*A*xdot)*((-beta)/(V*rho));

XDOT = [ xddot;  p1dot;  p2dot] ;  %return the derivative values