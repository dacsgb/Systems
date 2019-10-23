import numpy as np
import matplotlib.pyplot as plt



Cd = 0.75
A0 = 0.001
rho = 675
P0 = 15000


def q_lin(X):
    q = (Cd*A0*np.sqrt(2/(rho*P0)))/2  * (X-P0) + q_nonlin(P0)
    return q

def q_nonlin(X):
    q = Cd*A0*np.sqrt((2*X)/rho)
    return q

dP = np.linspace(0,30*10**3,500)
Q1 = q_lin(dP)
Q2 = q_nonlin(dP)

#help me here

plt.figure(1)
plt.plot(dP,Q2,'--',label='Nonlinear')
plt.plot(dP,Q1,label='Linear')
plt.xlabel('Pressure')
plt.ylabel('Volumetric Flow Rate')
plt.title('Linearization of Volumetric Flow Rate')
plt.legend()
plt.show()