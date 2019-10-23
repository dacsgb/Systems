import numpy as np
import matplotlib.pyplot as plt


def sys(t,u):

    I = 5*10**-4
    c = 5*10**-4
    Kb = 0.0267
    Kt = 0.0267
    Ra = 13.5
    La = 10

    x = (u*Kt)/(Ra*I + c*La) * ( 1- np.exp( -(Ra + Kb*Kt)/(Ra*I + c*La) *t))

    return x

Ti = 0
Tf = 0.01
n = 1000

t = np.linspace(Ti,Tf,n)
u = np.ones_like(t)
u = 5

x = sys(t,u)


plt.figure(1)
plt.plot(t,x,label='Input = 5V')
plt.xlabel('Time - [s]')
plt.ylabel('Angular Velocity - [rad/s]')
plt.title('System Response')
plt.legend()
plt.show()