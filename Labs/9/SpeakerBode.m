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
sys=tf(num,den);

data = readmatrix('Data.xlsx');

[magn, phase, freq] = bode(sys,data(:,2));
magn = magn(1:size(magn),:);
mdB = 20*log10(magn);

figure(1)
semilogx(freq,mdB)
hold on
semilogx(data(:,2),data(:,6))
hold off
title('Frequency Response of Speaker')
ylabel('Magnitude - [dB]')
xlabel('Frequency - [rad/s]')
legend('Bode Plot' , 'Collected Data')
grid on
