t = linspace(0,4,100);

wn = sqrt((4)/(7));
z = (4)/(2*wn);
sz = sqrt(1-z^2);
phi = atan(sz/z);
ex = -z.*wn.*t;

A = 5;

%y = A*(1-(exp(ex).*sin(wn.*sz.*t+phi))/sz) ;
y = A*(-(exp(ex).*sin(wn.*sz.*t+phi))/sz) ;

figure(1)
plot(t,y)
title('Analytic Response')
xlabel('Time - [s]')
ylabel('Response')