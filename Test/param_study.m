clc
global c;

c = 2;
[t1,states1] = ode45(@deriv,[0,0.01],[0,0,0]);
c = 10;
[t2,states2] = ode45(@deriv,[0,0.01],[0,0,0]);
c = 20;
[t3,states3] = ode45(@deriv,[0,0.01],[0,0,0]);
c = 50;
[t4,states4] = ode45(@deriv,[0,0.01],[0,0,0]);


figure(1)
plot(t1,states1(:,1))
hold on
plot(t2,states2(:,1))
hold on
plot(t3,states3(:,1))
hold on
plot(t4,states4(:,1))
hold off
title('C Parameter Study')
xlabel('Time - [s]')
ylabel('Position - [m]')
legend('c = 2', 'c = 10', 'c = 20','c = 50')

function XDOT = deriv(t,X)
    % System Parameters
    m = 0.002;
    k = 8e5;
    global c;
    Kf = 16;
    Kb = 16;
    La = 2e-3;
    R = 12;

    % Rename states
    x = X(1); xd = X(2); i = X(3); 

    % Initiate forcing function
    v = 10;

    % write the non-trivial equations using nice names
    xdd = (-c*xd - k*x + Kf*i)/m;
    i_dot = (v - R*i -Kb*xd)/La;

    XDOT = [ xd; xdd; i_dot] ;  %return the derivative values
end
