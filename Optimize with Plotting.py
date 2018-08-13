# -*- coding: utf-8 -*-
"""
Created on Thu Aug 24 06:50:50 2017

@author: bharg
"""

import numpy as np
import scipy.optimize 
from scipy.optimize import linprog
c = [-5,2,-3]		
A = [[-2,-2,1],[3,-4,0],[0,1,3]]	
b = [-2,3,5]
x1=[0,None]
x2=[0,None]
x3=[0,None]
res = linprog(c, A, b, bounds=(x1,x2,x3),options={"disp":True},method='Simplex')
print(res)

from mpl_toolkits.mplot3d import Axes3D


from matplotlib import cm


from matplotlib.ticker import LinearLocator, FormatStrFormatter


import matplotlib.pyplot as plt


import numpy as np




fig = plt.figure()


ax = fig.gca(projection='3d')


X = np.arange(0, 10, 0.25)
h=X[:]

Y = np.arange(0, 10, 0.25)
j=Y[:]

X, Y = np.meshgrid(X, Y)
R=[]
for i in range(int(10/0.25)):
    c1=[-2,h[i],j[i]]
    d=linprog(c, A,c1 , bounds=(x1,x2,x3),options={"disp":True},method='Simplex')
    R.append(d.fun)
    
    
surf = ax.plot_surface(X, Y, R, rstride=1, cstride=1, cmap=cm.coolwarm, linewidth=0,

antialiased=False)


ax.set_zlim(None,None)


ax.zaxis.set_major_locator(LinearLocator(10))


ax.zaxis.set_major_formatter(FormatStrFormatter('%.02f'))


fig.colorbar(surf, shrink=0.5, aspect=5)


plt.show()

    




