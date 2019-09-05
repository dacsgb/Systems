A =4.909e-4;    Cd = 0.6;       rho= 850;
V = 1.473e-4;   beta = 2e9;     pa=1e5;
m = 30;         ps =1.4e7;      Kv = 2e-5;

function SolveODEs()
clf  %clear any existing plots

%                        Time range   Initial Conditions
[t,y] = ode45(  @deriv,    [0,20],           [0,0,0,0]         );

%    tvals     yvals     color and style
plot(  t,     y(:,1),        'b');
title('Spring Mass Damper with initial displacement');
xlabel('Time - s');
ylabel('Position of mass 1 - ft');
pause   % hit enter to go to the next plot

plot(  t,     y(:,3),        'g--');
title('Spring Mass Damper with initial displacement');
xlabel('Time - s');
ylabel('Position of mass 2 - ft');  
pause % hit enter to go to the next plot

plot(  t,y(:,1),t,y(:,3)  );
title('Spring Mass Damper with initial displacement');
xlabel('Time - s');
ylabel('Position of both masses - ft');
pause 
end



function XDOT = deriv(t,X)
% define model parameters


% define "nice" names for the state variables (optional)
x=X(1);  xdot=X(2); xddot=X(3); p1=X(4);  p2=X(5); y=X(5)

% write the non-trivial equations using nice names
xddot = A*(p1-p2)
p1dot = (y*Kv*(ps-p1)-rho*A*xdot)*((beta)/(V*rho))
p2dot = (y*Kv*(p2-pa)-rho*A*xdot)*((-beta)/(V*rho))

XDOT = [x1dot  ;x1ddot;  x2dot;  x2ddot;] ;  %return the derivative values
end