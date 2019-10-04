clf
clc


[t,states] = ode45(@deriv,[0,0.1],[0,20*pi]);

figure(1)
plot(t,states(:,1))
title('Current Response')
xlabel('Time - [s]')
ylabel('Current - [Amps]')

figure(2)
plot(t,states(:,2))
title('Angular Velocity Response')
xlabel('Time - [s]')
ylabel('Angular Velocity - [rad/s]')


function XDOT = deriv(t,X)
    % System Parameters
    Kt = 0.2;   Kb = 0.2;   c = 5e-4;
    Ra = 0.8;   I = 5e-4;   La = 4e-3;
    Tl = 0;

    % Rename states
    ia = X(1); w = X(2);

    % Initiate forcing function
    va = 0;
    % write the non-trivial equations using nice names
    iad = -(Kb*w + Ra*ia -va)/La;
    a = (Kt*ia -c*w -Tl)/I;

    XDOT = [ iad; a;] ;  %return the derivative values
end