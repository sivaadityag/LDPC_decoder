import numpy as np

a = np.array([[1,2,3]])
b = np.array([[1,0,0]])
#print(a.shape,b.shape,np.matmul(a,b.T).shape)
print(np.all(np.multiply(a,b)==0))
if np.all(np.multiply(a,b)==0) == True:
    print("Hello")
