clear all
clc
clf

%% Part 2

t = 0:0.01:10;

e = (t.^2 + 12.*t.*sin(2.*t) + exp(-(4/0.68).*t).*t)/51;
b = (t.^2 - 12.*t.*sin(2.*t) + exp(-(4/0.68).*t).*t)/51;

figure(1)
plot(t,e,'g',t,b,'b--')
xlabel('Time - [s]')
ylabel('Value - [Brinkmans]')


%% Part 3

m = 1; 
c = 9.5; 
k = 100;

num = [1];
den = [m, c, k];
sys = tf(num,den);
[y1,t1] =step(sys);

figure(2)
plot(t1,y1)
xlabel('Time - [s]')
ylabel('Displacement - [m]')

%% Part 4

syms s;
XoverF = 1/(m*s^2 + c*s +k);
F = 1/s;
X = XoverF * F;

symbolic_output = ilaplace(X);
pretty(symbolic_output);

figure(3)
fplot(symbolic_output,[0,1.2])
axis([0,1.2,0,0.012])
title('ilaplace() Response')
xlabel('Time - [s]')
ylabel('Displacement - [m]')

%% Part 5

[t2,y2] = ode45(@deriv,[0,1.2],[0,0]);

figure(4)
plot(t2,y2(:,1),'b');
title('Position of mass');
xlabel('Time - [s]');
ylabel('Displacement- [m]');

figure(5)
plot(t2,y2(:,2),'r');
title('Velocity of mass');
xlabel('Time - [s]');
ylabel('Velocity - [m/s]');

figure(6)
plot(t2,y2(:,1),'b',t2,y2(:,2),'r');
title('Position and Velocity of mass');
xlabel('Time - [s]');
ylabel('Amplitude');


%% Function Definitions 

function XDOT = deriv(t,X)
    % System Parameters
    m = 1; 
    c = 9.5; 
    k = 100;

    % Rename states
    x = X(1); xd = X(2);

    % Initiate forcing function
    f = 1;

    % write the non-trivial equations using nice names
    xdd = (f - c*xd - k*x)/m;

    XDOT = [ xd; xdd;] ;  %return the derivative values
end
