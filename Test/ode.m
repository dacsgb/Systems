[t,y] = ode45(@deriv,[0,0.01],[0,0,0]);

x_analytic = (1.67 - 0.3*exp(-500.*t).*sin(20000.*t + 1.55))/1e5;


figure(1)
plot(t,y(:,1),'b');
hold on
plot(t,x_analytic)
hold off
title('Solution Comparison');
xlabel('Time - [s]');
ylabel('Displacement- [m]');
legend('Simulation','Analytic')



function XDOT = deriv(t,X)
    % System Parameters
    m = 0.002;
    k = 8e5;
    c = 2;
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

