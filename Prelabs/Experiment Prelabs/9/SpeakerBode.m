%Frequency Response of a Speaker

%define parameters
m = 0.03;       % [kg]
c = 1.532;      % [Ns/m]
k = 885;        % [N/m]
Kb = 5.71;      % [T.m]
Kf = 9.62;      % [T.m]
R = 5.91;       % [ohms]
L = 8.17*10^-4;   % [H]
%L=0;

%create transfer function
num=[Kf*1000];      %multipled by 1000 to convert from m to mm
den=[(m*L), (c*L+m*R), (k*L+c*R+Kf*Kb), (k*R)];
sys1=tf(num,den);

L = 0;
num=[Kf*1000];      %multipled by 1000 to convert from m to mm
den=[(m*L), (c*L+m*R), (k*L+c*R+Kf*Kb), (k*R)];
sys2=tf(num,den);

%plot bode plot of TF
figure (1)
bode(sys1);
title('Frequency Response of Speaker L = 8.17e-4 H')
grid on

figure (2)
bode(sys2);
title('Frequency Response of Speaker L = 0')
grid on
