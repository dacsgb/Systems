function SolveODEs()
clf  %clear any existing plots

% State defined as X = [xdot, p1,p2]
start = 0;
finish = 1;
dt = 0.001;
[t,y1] = ode45(  @deriv,[start,finish],[0,1e5,1e5]); % derivative, time range, initial conditions

t1 = start:dt:finish;
p1_analytic = (7-14.*exp(-400.*t1).*sin(800.*t1+1.55)).*10e-6

plot(t,y1(:,2),'r',t1,p1_analytic,'b'); %tvals,yvals, color and style
title('Simulation and analytic solution comparison');
xlabel('Time - [s]');
ylabel('Pressure 1 - [Pa]');
legend('p1','analytic p1')

pause % hit enter to go to the next plot

function XDOT = deriv(t,X)
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