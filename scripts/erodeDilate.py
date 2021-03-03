import numpy as np
import pylab as pl

from scipy import ndimage

#data = pl.imread("voronoi_lacDuBonnetGranite_EberhardEtAl1999noBoundary_2cm_00.png")
data = pl.imread("../input_files/material_composition/voronoi_lacDuBonnetGranodiorite_EberhardEtAl1999.png")


dd = np.zeros(data.shape, dtype = np.float)

ddA = data == 1

ddB = np.logical_and( data > 0.6666, data < 0.666667)
ddC = np.logical_and( data > 0.333, data < 0.3334)
ddD = data == 0.0



dd[ndimage.binary_dilation(ndimage.binary_dilation(ndimage.binary_dilation(ddA)))] = 1.0
dd[ndimage.binary_dilation(ndimage.binary_dilation(ndimage.binary_dilation(ddB)))] = 0.66
dd[ndimage.binary_dilation(ndimage.binary_dilation(ndimage.binary_dilation(ddC)))] = 0.33
dd[ndimage.binary_dilation(ndimage.binary_dilation(ndimage.binary_dilation(ddD)))] = 0.0

dd[ddA] = 1.0
dd[ddB] = 0.66
dd[ddC] = 0.33
dd[ddD] = 0.0

pl.plot(data[:,7])
pl.plot(dd[:,7],"b-")

pl.figure()

pl.imshow(dd)

pl.imsave("../input_files/material_composition/voronoi_lacDuBonnetGranodiorite_EberhardEtAl1999_sharp_00.png",dd)

pl.show()
