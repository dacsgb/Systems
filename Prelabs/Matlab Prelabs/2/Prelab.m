%% Part2

x=linspace(0,6*pi(),500);
y1 = exp(-x).*(sin(x)).^2;
y2 = exp(-x).*(cos(x)).^2;


plot(x, y1);
title('exp(-x)sin(x)^2');
xlabel('X Value');
ylabel('Y value');
pause

plot(x,y2); 
title('exp(-x)cos(x)^2');
xlabel('X Value');
ylabel('Y value');
pause

plot(x,y1,'r',x,y2,'g');
title('Graph Comparison');
xlabel('X Value');
ylabel('Y value');
legend('exp(-x)sin(x)^2','exp(-x)cos(x)^2');
pause

%% Part 3

num = [1];
den = [1,4,6,8];
T = tf(num,den)
step(T);
title('Step Response');
xlabel('Time - ');
ylabel('Amplitude');
pause

%% Part 4

syms s;
F = (2*s+1)/(3*s^3+4*s^2+20*s);
ilaplace(F)

%% Part 5

[t,y1] = ode45(@deriv,[0,10],[0,0,0]);

plot(t,y1(:,1),'b');
title('Position of mass');
xlabel('Time - [s]');
ylabel('Displacement- [m]');
pause

plot(t,y1(:,2),'r');
title('Velocity of mass');
xlabel('Time - [s]');
ylabel('Velocity - [m/s]');
pause

clear all
clc
clf
%% Function Definitions 

function XDOT = deriv(t,X)
    % System Parameters

    % Rename states
    x = X(1); xd = X(2); xdd = X(3);

    % Initiate forcing function
    f = 1;

    % write the non-trivial equations using nice names
    xddd = f - 4*xdd - 6*xd - 8*x;

    XDOT = [ xd; xdd; xddd] ;  %return the derivative values
end

