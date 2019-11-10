import numpy as np
import matplotlib.pyplot as plt
import numpy as np
import scipy.integrate as integrate
import matplotlib.pyplot as plt

def sys_exp():
    T_act, X_act = np.loadtxt('Labs/test/Data.txt',unpack = True)
    return T_act, X_act

def deriv_full(X,t):
    x = X[0]
    xd = X[1]
    xdd = X[2]

    xddd = (Kf*V -(c*L+m*R)*xdd - (k*L +c*R +Kb*Kf)*xd -k*R*x)/(m*L)
    return np.array([xd,xdd,xddd])

def deriv_red(X,t):
    x = X[0]
    xd = X[1]

    xdd = (Kf*V - (c*R+Kb*Kf)*xd -k*R*x)/(m*R)

    return np.array([xd,xdd])

m = 0.030
R = 6
c = 1.532
Kf = 9.62
Kb = 5.71
k = 885
L = 199.3e-3
V = 3

ic_red = np.array([0,0]) 
ic_full = np.array([0,0,0])

t_act, x_act = sys_exp()
t = np.linspace(0,t_act[-1],100)
X_red = integrate.odeint(deriv_red,ic_red,t) 
X_full = integrate.odeint(deriv_full,ic_full,t)

plt.figure(1)
plt.plot(t,X_red[:,0],'x-',label='Simulated: reduced order')
plt.plot(t,X_full[:,0],label='Simulated: full oder')
plt.plot(t_act,x_act*(1/56),'--',label='Experimental')
plt.xlabel('Time - [s]')
plt.ylabel('Displacement - [m]')
plt.title('System Response')
plt.legend()
plt.show()