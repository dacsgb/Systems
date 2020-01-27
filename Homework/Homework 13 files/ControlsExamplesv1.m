%Testing control of a first order system
function SolveODEs()
clc; %clear any existing plots

global kp  kd  ki  sp_x   
sp_x = 2; 

kp = 200;   kd =25;   ki=185; 
  
tfinal=25;  
[t1,y1] = ode45(  @derivPID,    [0,tfinal],           [1,0,1]     );

F=kp * (sp_x - y1(:,1)) + kd*( - y1(:,2));
maxforce = max(F)

plot(  t1, y1(:,1));
axis([0 tfinal -0.75 sp_x+1]);

title('Time Response of a Dynamic System');
xlabel('Time - s');
ylabel('Response');


function XDOT = deriv(      t,        X)
global kp   kd  ki  sp_x   
%define model parameters
m=1;  k=16;  c=1;
%define the states as "nice" names
x=X(1);  xdot=X(2);
%PID controller
F = 0;
F=kp * (sp_x - x) + kd*(0 - xdot);

%write the non-trivial equations using the nice names
xddot= (1/m) * (  -c*xdot - k*x +F);
XDOT = [xdot;  xddot] ;  %return the derivative value


function XDOT = derivPID(      t,        X)
global kp   kd  ki  sp_x   
%define model parameters
m=1;  k=16;  c=1;
%define the states as "nice" names
x=X(1);  xdot=X(2); intx = X(3);  

%PID controller
F=kp * (sp_x - x) + kd*( - xdot) + ki*(sp_x* t - intx);

%write the non-trivial equations using the nice names
xddot= (1/m) * (  -c*xdot - k*x +F);
XDOT = [ xdot;  xddot; x] ;  %return the derivative value