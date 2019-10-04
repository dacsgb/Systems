clf
clc

[t,states] = ode45(@deriv,[0,0.5],[0,0,0]);

figure(1)
plot(t,states(:,1))
title('Displacement of Speaker')
xlabel('Time - [s]')
ylabel('Displacement - [m]')

figure(2)
plot(t,states(:,2))
title('Velocity of Speaker')
xlabel('Time - [s]')
ylabel('Velocity - [m/s]')

figure(3)
plot(t,states(:,3))
title('Current through Speaker')
xlabel('Time - [s]')
ylabel('Current - [I]')


function XDOT = deriv(t,X)
    % System Parameters
    m = 0.002;  k = 4e5;    Kf = 16;
    Kb = 13;    R = 12;     L = 20e-3;
    c = 0.5;

    % Rename states
    x = X(1); xd = X(2); i = X(3);

    % Initiate forcing function
    v = 5*sin(20*pi*t);
    % write the non-trivial equations using nice names
    xdd = (Kf*i - k*x - c*xd)/m;
    id = (v - R*i - Kb*xd)/L;

    XDOT = [ xd; xdd; id] ;  %return the derivative values
end