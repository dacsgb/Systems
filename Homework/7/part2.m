
clc
global c;

c = 0;
[t1,states1] = ode45(@deriv,[0,0.2],[0,0]);
c = 0.01;
[t2,states2] = ode45(@deriv,[0,0.2],[0,0]);
c = 0.1;
[t3,states3] = ode45(@deriv,[0,0.2],[0,0]);

size(states1)

figure(1)
plot(t1,states1(:,2))
hold on
plot(t2,states2(:,2))
hold on
plot(t3,states3(:,2))
hold off
title('Angular Velocity Response')
xlabel('Time - [s]')
ylabel('Angular Velocity - [rad/s]')
legend('c = 0', 'c = 0.01', 'c = 0.1')



function XDOT = deriv(t,X)
    % System Parameters
    Kt = 0.05;   Kb = 0.05;   global c;
    Ra = 0.8;   I = 8e-5;   La = 3e-3;
    Tl = 0;

    % Rename states
    ia = X(1); w = X(2);

    % Initiate forcing function
    va = 1;

    % write the non-trivial equations using nice names
    iad = -(Kb*w + Ra*ia -va)/La;
    a = (Kt*ia -c*w -Tl)/I;

    XDOT = [ iad; a;] ;  %return the derivative values
end