clc 

global L;

L = 0;
[t1,states1] = ode45(@deriv1,[0,0.015],[0,0]);
L = 10^-3;
[t2,states2] = ode45(@deriv2,[0,0.015],[0,0,0]);


figure(2)
plot(t1,states1(:,1))
hold on
plot(t2,states2(:,1))
hold off
title('Inductance Parameter Study')
xlabel('Time - [s]')
ylabel('displacement - [m]')
legend('L = 0', 'L = 10^-3')

function XDOT = deriv1(t,X)
    % System Parameters
    m = 0.002;  k = 4e5;
    Kf = 16;    Kb = 13;
    R = 12;     global L;
    c = 0;
    
    % Rename states
    x = X(1); xd = X(2);

    % Initiate forcing function
    va = 8*sin(2000*t);

    % write the non-trivial equations using nice names
    xdd = (Kf*va - (c*R +Kf*Kb)*xd -k*R*x)/(m*R);

    XDOT = [ xd; xdd] ;  %return the derivative values
end


function XDOT = deriv2(t,X)
    % System Parameters
    m = 0.002;  k = 4e5;
    Kf = 16;    Kb = 13;
    R = 12;     global L;
    c = 0;
    
    % Rename states
    x = X(1); xd = X(2); xdd = X(3);

    % Initiate forcing function
    va = 8*sin(2000*t);

    % write the non-trivial equations using nice names
    xddd = (Kf*va - (c*L+m*R)*xdd - (k*L + c*R +Kf*Kb)*xd -k*R*x)/(m*L);

    XDOT = [ xd; xdd; xddd] ;  %return the derivative values
end

