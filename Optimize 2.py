import numpy as np
import scipy.optimize 
from scipy.optimize import linprog
c = [-3,1,1]		
A = [[1,-2,1],[4,-1,-2]]
aa=[[-2,0,1]]
b = [11,-3]
bb=[1]
x1=[0,None]
x2=[0,None]
x3=[0,None]
res = linprog(c,A_ub=A,b_ub=b,A_eq=aa,b_eq=bb, bounds=(x1,x2,x3),options={"disp":True},method='Simplex')
print(res)
