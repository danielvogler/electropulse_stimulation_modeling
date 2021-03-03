import csv
import collections
import numpy as np
import matplotlib
import matplotlib.pyplot as pl
import sys
import glob, os
import math
import warnings
import re
import matplotlib.colors as mcolors
import matplotlib.cm as cm

### plot settings
markerSize = 50.0
lineStyle = 'none'
lineWidth = 5
fontSize = 60
font = {'size'   : fontSize}
matplotlib.rc('font', **font)



### DATA
time = [0.0, 0.4, 0.8, 1.2, 1.6, 2.0]
voltage = [120, 240, 360, 480, 600]
fragmented_area = [
		[0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
		[0.0, 0.0, 0.0, 0.0, 0.0, 6.41e-9],
		[0.0, 0.0, 0.0, 9.62e-9, 4.49e-8, 1.28e-7],
		[0.0, 0.0, 9.62e-9, 1.06e-7, 3.72e-7, 7.0e-7 ], 
		[0.0, 0.0, 6.41e-8, 1.28e-7, 7.01e-7, 1.93e-6] 
		]
labels = ["120 kV", "240 kV", "360 kV", "480 kV", "600 kV"]
markerColor = ["-k*", "-y^", "-gv", "-bo", "-rs"]



### FIGURE - FRAGMENTATION VS VOLTAGE
fig, ax1 = pl.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )

for fileCounter in range(len(fragmented_area) ):

	scalingFactor = 1e4 
	damage = []
	damage = np.array(fragmented_area[fileCounter]) * scalingFactor
	
	pl.plot(voltage[fileCounter], damage[-1], markerColor[fileCounter], markersize=markerSize, markeredgecolor='None')

pl.xlabel('Voltage [kV]')
pl.ylabel('Fragmentation [$cm^2$]')
pl.legend(loc=2)
pl.xlim([0.0,650])
pl.ylim([-0.001, 0.021])
pl.savefig( str("pulseEfficiency_vs_voltage.png") , bbox_inches='tight' )



### FIGURE - FRAGMENTATION VS TIME
fig, ax1 = pl.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )

for fileCounter in range(len(fragmented_area) ):

        scalingFactor = 1e4
        damage = []
        damage = np.array(fragmented_area[fileCounter]) * scalingFactor

        pl.plot(time, damage, markerColor[fileCounter], markersize=markerSize, markeredgecolor='None', 
		linewidth=lineWidth, label=labels[fileCounter])

pl.xlabel('Time [$\mu s$]')
pl.ylabel('Fragmentation [$cm^2$]')
pl.legend(loc=2)
pl.xlim([-0.1,2.1])
pl.ylim([-0.001, 0.021])
pl.savefig( str("pulseEfficiency_and_voltage_vs_time.png") , bbox_inches='tight' )





pl.show()
exit()
