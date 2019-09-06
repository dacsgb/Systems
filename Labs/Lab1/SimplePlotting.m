
%   start  stepsize    stop
t=linspace(0,2*pi(),100);   % create array holding discretized time steps
y = sin(t); % create y value array

plot(t, y);  % plot y wrt t 
title('Demo of Simple Plotting');   % title of the figure
xlabel('Time - s'); % label the x axis
ylabel('y - ft');   % label the y axis
pause   % hit enter to go to the next plot

z=exp(-t/2) .* (3*t) .^ 2;  % What are these dots???? Analyse the array element by element
plot(t,z); 
title('Demo of Simple Plotting');
xlabel('Time - s');
ylabel('z - ft');
pause   % hit enter to go to the next plot

plot(t,y,'r',t,z,'g');
title('Demo of Simple Plotting');
xlabel('Time - s');
ylabel('y and z - ft');
legend('sin(x)','(3t)^2  * exp(-t/2)');
pause   % hit enter to go to the next plot
