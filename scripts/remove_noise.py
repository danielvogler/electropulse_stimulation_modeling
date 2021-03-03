from scipy import ndimage
from scipy import misc
import matplotlib.pyplot as plt
from sklearn.feature_extraction import image
from sklearn.cluster import spectral_clustering
import numpy as np
import skimage.morphology

### plot settings
markerSize = 30.0
lineStyle = 'none'
lineWidth = 4
fontSize = 40


image_file = '/home/davogler/projects/electropulse_stimulation_modeling/input_files/material_composition/voronoi_lacDuBonnetGranite_EberhardEtAl1999noBoundary_2cm_2_00.png'

save_image_file = '/home/davogler/projects/electropulse_stimulation_modeling/input_files/material_composition/electro_pulse_material_00.png'


f = misc.imread(image_file)

# fig, ax1 = plt.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )
# plt.imshow(f)
#
# # opened = skimage.morphology.opening(f)
# # eroded = skimage.morphology.erosion(f)
# # reconstructed = skimage.morphology.propagation(eroded, mask=f)
#
# opened = ndimage.binary_opening(f)
# eroded = ndimage.binary_erosion(f)
# reconstructed = ndimage.binary_propagation(eroded, mask=f)
#
# print eroded
# fig, ax1 = plt.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )
# plt.imshow(eroded, cmap=plt.cm.gray, interpolation='nearest')
#
#
# fig, ax1 = plt.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )
# plt.imshow(reconstructed, cmap=plt.cm.gray, interpolation='nearest')

# import cv2
# kernel = np.ones((5,5), np.uint8)
# img_erosion = cv2.erode(f, kernel, iterations=1)
# img_dilation = cv2.dilate(f, kernel, iterations=1)
# cv2.imshow('Input', f)
# cv2.imshow('Erosion', img_erosion)
# cv2.imshow('Dilation', img_dilation)

filterSize = 5

im = misc.imread(image_file, flatten=True).astype(np.uint8)
er0 = ndimage.grey_erosion(im, size=(filterSize,filterSize))
er85 = ndimage.grey_erosion(im-85, size=(filterSize,filterSize))
er170 = ndimage.grey_erosion(im-170, size=(filterSize,filterSize))
er255 = ndimage.grey_erosion(im-255, size=(filterSize,filterSize))

di0 = ndimage.grey_dilation(er0, size=(filterSize,filterSize))
di85 = ndimage.grey_dilation(er85, size=(filterSize,filterSize))
di170 = ndimage.grey_dilation(er170, size=(filterSize,filterSize))
di255 = ndimage.grey_dilation(er255, size=(filterSize,filterSize))


fig, ax1 = plt.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )
plt.imshow(di0)

fig, ax1 = plt.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )
plt.imshow(di85)

fig, ax1 = plt.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )
plt.imshow(di170)

fig, ax1 = plt.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )
plt.imshow(di255)

fig, ax1 = plt.subplots( num=None, figsize=(30, 20), dpi=80, facecolor='w', edgecolor='k',linewidth=lineWidth )

plt.np.histogram(di255)

# misc.imsave(save_image_file, im0)

plt.show()
