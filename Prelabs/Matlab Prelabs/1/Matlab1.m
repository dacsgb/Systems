% Matlab Exercise 1
% MAE 3724
% Colón, Diego
% 9/5/19

%% Part 1,2,3

% Create time,position and velocity vectors
t = 0:0.01:3;
y = 5*sin(4*pi*t);
vel = 20*pi*cos(4*pi*t);

% Plot y & v wrt t
plot(t,y,'r')
title('Positon Plot');
xlabel('Time - [s]');
ylabel('Positon - [m]');
pause

plot(t,vel,'b--')
title('Velocity Plot');
xlabel('Time - [s]');
ylabel('Velocity - [m/s]');
pause

plot(t,y,'r',t,vel,'b--')
title('Positon and Velocity Plot');
xlabel('Time - [s]');
ylabel('Amplitude');
legend('y - [m]','vel - [m/s]');
pause

%% Part 4,5

% Create Transfer Function
num = [1];
den = [1,9.5,100];
sys = tf(num,den);

% Create Forcing Function
f = 10*sin(10*t);

% Plot system response
lsim(sys,f,t);
pause

% Plot of system by itself
x = lsim(sys,f,t);
plot(t,x)
title('Positon of mass wrt t');
xlabel('Time - [s]');
ylabel('Position - [m]');
pause
