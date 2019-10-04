clear all
clc
clf

%% Problem 2

A = 7.5;    R = 8;  L = 5.3e-3;

num = [L,0];
den = [L, R];
T = tf(num,den);
[vo_sim, t1] = step(T);

vo = A * exp(-R/L .* t1);

figure(1)
title('Simulation')
plot(t1,A*vo_sim)
xlabel('Time - [s]')
ylabel('Voltage - [V]')

figure(2)
title('Analytic Solution')
plot(t1,vo)
xlabel('Time - [s]')
ylabel('Voltage -[V]')

figure(3)
title('Comparison')
plot(t1,A*vo_sim,t1,vo)
xlabel('Time - [s]')
ylabel('Voltage -[V]')
legend('Simulation','Analytical')

%% Problem 3
global R;
global L;
global C1;
global C2;
global A;

R = 4; L = 6e-3; C1 = 6.5e-4; C2 = 6.5e-4; A = 3;

[t2,states] = ode45(@deriv,[0,0.1],[0,0]);

wn = sqrt(((1 + C1/C2))/(L*C2));
z = (R/L)/(2*wn);
sz = sqrt(1-z^2);
phi = atan(sz/z);
ex = -z.*wn.*t2;

C1 = A/(1 + C1/C2);

vl = C1.*(1-(exp(ex).*sin(wn.*sz.*t2+phi))/sz) ;

figure(4)
plot(t2,states(:,1))
title('Simulation')
xlabel('Time - [s]')
ylabel('Voltage - [V]')

figure(5)
plot(t2,vl)
title('Analytical')
xlabel('Time - [s]')
ylabel('Voltage - [V]')

figure(6)
plot(t2,states(:,1),t2,vl)
title('Comparison')
xlabel('Time - [s]')
ylabel('Voltage - [V]')
legend('Simulation','Analytical')

function XDOT = deriv(t,X)
    % System Parameters
    global R;
    global L;
    global C1;
    global C2;
    global A;

    % Rename states
    vo = X(1); vod = X(2);

    % Initiate forcing function
    vs = A;
    % write the non-trivial equations using nice names
    vodd = (vs -R*C2*vod - (1 + C1/C2)*vo )/(L*C2);

    XDOT = [ vod; vodd] ;  %return the derivative values
end