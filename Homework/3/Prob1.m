function SolveODEs()
clf  %clear any existing plots

% State defined as X = [x,xdot, p1,p2]

[t,y1] = ode45(  @deriv,[0,0.05],[0,0,1e5,1e5]);

plot(t,y1(:,2),'b');
title('Velocity of mass');
xlabel('Time - [s]');
ylabel('Velocity of piston- [m/s]');
pause

plot(t,y1(:,3),'r',t,y1(:,4),'b');
title('Pressure in chamber 1 and 2');
xlabel('Time - [s]');
ylabel('Pressure - [Pa]');
legend('p1','p2')

pause % hit enter to go to the next plot

function XDOT = deriv(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      Kv = 2e-5;

% Rename states
x = X(1); xdot = X(2);   p1 = X(3);   p2 = X(4);

% Initiate forcing function
y = 0.002;

% write the non-trivial equations using nice names
xddot = A*(p1-p2)/m;
p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho));
p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho));

XDOT = [ xdot; xddot;  p1dot;  p2dot] ;  %return the derivative values