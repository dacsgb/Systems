import numpy as np
import matplotlib.pyplot as plt
import numpy as np
import scipy.integrate as integrate
import matplotlib.pyplot as plt

def sys_exp():
    T_act, W_act = np.loadtxt('Labs/test/Data6.txt',unpack = True)
    T_act = T_act
    return T_act, W_act

def deriv(X,t):
    w = X[0]
    R = 13.5
    I = 47.82e-6
    c = 7.274e-6
    Kt = 0.0267
    Kb = 0.0267
    L = 0.1
    V = 5

    wd = (V*Kt - (c*R + Kb*Kt)*w)/(R*I+c*L)


    Xd = np.array([wd])
    return Xd

ic = np.array([0]) # (position, velocity, pressure 1, pressure 2)

t_act, w_act = sys_exp()
X = integrate.odeint(deriv,ic,t_act) # solve system

t_act, w_act = sys_exp()

plt.figure(1)
plt.plot(t_act,X,label='Simulated')
plt.plot(t_act,w_act,'--',label='Experimental')
plt.xlabel('Time - [s]')
plt.ylabel('Angular Velocity - [rad/s]')
plt.title('System Response')
plt.legend()
plt.show()