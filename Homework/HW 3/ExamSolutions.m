% Define constants for RCL Ciruit
R1 = 8000;
R2 = 8000;
L = 200;
C = 2.5*10^-6;

% Initialize Transfer Function
num = [R2];
den = [R2*C*L, R1*R2*C+L, R1+R2];
T = tf(num,den);

% Step Response
opt = stepDataOptions('InputOffset',0,'StepAmplitude',12);
step(T,opt)
pause