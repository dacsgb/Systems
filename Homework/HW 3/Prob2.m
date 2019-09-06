

function SolveODEs()
clf  %clear any existing plots

% State defined as X = [xdot, p1,p2]

[t1,y1] = ode45(  @deriv1,[0,0.1],[0,1e5,1e5]); % derivative, time range, initial conditions
[t2,y2] = ode45(  @deriv2,[0,0.1],[0,1e5,1e5]);
[t3,y3] = ode45(  @deriv3,[0,0.1],[0,1e5,1e5]);
[t4,y4] = ode45(  @deriv4,[0,0.1],[0,1e5,1e5]);

plot(t1,y1(:,2),'r',t2,y2(:,2),'b',t3,y3(:,2),'g',t4,y4(:,2),'y'); %tvals,yvals, color and style
title('Pressure in chamber 1');
xlabel('Time - [s]');
ylabel('Pressure 1 - [Pa]');
legend('Kvalve = 1e-5','Kvalve = 2e-5','Kvalve = 10e-5','Kvalve = 20e-5')
pause   % hit enter to go to the next plot



function XDOT = deriv1(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      Kv = 1e-5;

% Rename states
xdot = X(1);    p1 = X(2);   p2 = X(3);

% Initiate forcing function
y = 0.002;


% write the non-trivial equations using nice names
xddot = A*(p1-p2)/m;
p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho));
p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho));
XDOT = [xddot;  p1dot;  p2dot] ;  %return the derivative values
function XDOT = deriv2(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      Kv = 2e-5;

% Rename states
xdot = X(1);    p1 = X(2);   p2 = X(3);

% Initiate forcing function
y = 0.002;


% write the non-trivial equations using nice names
xddot = A*(p1-p2)/m;
p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho));
p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho));
XDOT = [xddot;  p1dot;  p2dot] ;  %return the derivative values
function XDOT = deriv3(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      Kv = 10e-5;

% Rename states
xdot = X(1);    p1 = X(2);   p2 = X(3);

% Initiate forcing function
y = 0.002;


% write the non-trivial equations using nice names
xddot = A*(p1-p2)/m;
p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho));
p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho));
XDOT = [xddot;  p1dot;  p2dot] ;  %return the derivative values
function XDOT = deriv4(t,X)
% System Parameters
A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      Kv = 20e-5;

% Rename states
xdot = X(1);    p1 = X(2);   p2 = X(3);

% Initiate forcing function
y = 0.002;


% write the non-trivial equations using nice names
xddot = A*(p1-p2)/m;
p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho));
p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho));
XDOT = [xddot;  p1dot;  p2dot] ;  %return the derivative values

