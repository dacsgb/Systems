import numpy as np
import matplotlib.pyplot as plt


def sys(t):

    m =0.002
    k = 4*10**5
    c = 4.4
    Kb = 13
    Kf = 16
    R = 5.91
    v = 5

    Wn = np.sqrt(k/m)
    Z = ((c*R + Kb*Kf)/(m*R))/(2*Wn)
    Sqr = np.sqrt(1-Z**2)
    Phi = np.arctan(Sqr/Z)
    A = (v*m*Kf)/k

    x = A * (1 - (np.exp(-Z*Wn*t))*np.sin(Wn*Sqr*t + Phi)/Sqr)

    return x

Ti = 0
Tf = 0.001
n = 1000

t = np.linspace(Ti,Tf,n)
x = sys(t)

plt.figure(1)
plt.plot(t,x,label='Response')
plt.xlabel('Time - [s]')
plt.ylabel('Diplacement - [m]')
plt.title('System Response')
plt.legend()
plt.show()