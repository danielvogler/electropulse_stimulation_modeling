import csv
import collections
import numpy as np
import matplotlib
import matplotlib.pyplot as pl
import sys
import glob, os
import math as m
import warnings
import re
import matplotlib.colors as mcolors
import matplotlib.cm as cm

b_0 = 2.633
b_1 = -64.80
b_2 = 0.005799
b_3 = 6.741*10**(-5)
b_4 = -2.136*10**(-7)

T_start = 25.0
T_end = 1500.0#375.0
T = np.linspace(T_start, T_end, 10)

rho_w = b_0 + b_1*T**(-1) + b_2*T + b_3*T**2 + b_4*T**3

print "Rho_w from Eq. 2 in Ucok et al. 1980"
print rho_w
print "\n\n"

### plot settings
markerSize = 30.0
lineStyle = 'none'
lineWidth = 4
fontSize = 40
### settings
font = {'size'   : fontSize}
matplotlib.rc('font', **font)

# fig, ax1 = pl.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )
#
# pl.plot( T , rho_w, 'o', markersize=markerSize, color='k')#, label="(1) Tensile failure")
#
# pl.xlabel('T [C]', fontsize=fontSize)
# pl.ylabel('Resistivity []', fontsize=fontSize)


B = [ [3.470, -6.650, 2.633] , [-59.21, 198.1, -64.80] , [0.4551, -0.2058, 0.005799] , [-9.346*10**(-5), 7.368*10**(-5), 6.741*10**(-5)] , [-1.766*10**(-6), 8.768*10**(-7), -2.136*10**(-7)] ]

c_matrix = [0.513, 1.7, 3.4]
c = c_matrix[0]

T = 100.0

def compute_lambda(B,c):
	Lambda = B[0] - B[1] * c**(0.5) + B[2] * c*m.log(c)
	return Lambda

Lambda = c*compute_lambda(B[0][:],c)


#rho_w = 10.0 / ( Lambda * c)
def compute_electrical_resistivity(B,c,T):
	B = np.array(B).transpose()
	C = [c, c*c**(0.5), c*c*m.log(c)]
	T_matrix = [1, 1/T, T, T*T, T*T*T]

	D = np.matmul( C , B )
	O = np.matmul( D , T_matrix )
	er = 1/O#/10

	return er

T = np.linspace(T_start, T_end, 100)
er = []

fig, ax1 = pl.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )

for j in c_matrix:
	er = []
	c = j
	for i in T:
		er_tmp = compute_electrical_resistivity( B , c , i )
		er.append(er_tmp)

	pl.plot( T, er, 'o', markersize=markerSize,  label=j)

pl.xlabel('Temperature [C]', fontsize=fontSize)
pl.ylabel('Resistivity [$\Omega*m$]', fontsize=fontSize)
pl.legend(loc=1)
pl.yscale('log')
pl.grid();

print er

### write temperature profile to file
# fileToSave = str("e_conductivity_profile.txt")
# with open(fileToSave, 'w') as csvfile:
#     writer = csv.writer(csvfile,delimiter=' ',quoting = csv.QUOTE_NONE,escapechar='\\',quotechar='')
#     writer.writerow(['%s' %('AXIS Y')])
#     writer.writerow(['%1.4f' %(y_location)])
#     writer.writerow(['%s' %('AXIS X')])
#     writer.writerow(['{:1.4f}'.format(x) for x in location])
#     writer.writerow(['%s' %('AXIS T')])
#     writer.writerow(['{:1.4f}'.format(x) for x in times])
#     writer.writerow(['%s' %('DATA')])
#     writer.writerow([T_min for x in temp_initial])
#     #writer.writerow(['{:1.4f}'.format(x) for x in temp_intermediate])
#     writer.writerow(['{:1.4f}'.format(x) for x in temp_final])
#
# mp.show()

pl.show()
exit()
