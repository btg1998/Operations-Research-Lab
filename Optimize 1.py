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
