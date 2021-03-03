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

### abbreviations
### phase 1 - quartz
### phase 2 - plagioclase
### phase 3 - kfeldspar
### phase 4 - biotite

sigma_name = ['Quartz', 'Plagioclase', 'Kfeldspar', 'Biotite']
sigma_minerals = [3.05*10**(-14), 5.49*10**(-15), 5.88*10**(-15), 1.0*10**(-6)] # [S/m]
phi = [0.009, 0.018, 0.009, 0.009] #[0.0007, 0.007, 0.0029, 0.011] # [-]

sigma_f = 1/0.03 #2.0 # [S/m] # KAtsube et al 1993
m_f = 2.0

sigma = []

def G_i(phi_i, chi_i):
	G_i = phi_i * chi_i
	return G_i


def chi_i(phi_i, phi_j, chi_j):
	chi_i = ( 1 - phi_j * chi_j) / phi_i
	return chi_i


def m_i(phi_i, phi_j, chi_j):
	m_i = phi_j * chi_j / (1 - phi_i)
	return m_i


def sigma_t(sigma_i, phi_i, m_i, sigma_j, phi_j, m_j):
	sigma_t = sigma_i * phi_i ** m_i + sigma_j * phi_j ** m_j
	return sigma_t


for x in range(len(sigma_minerals)):
	phi_f = phi[x]
	phi_s = (1 - phi[x])
	sigma_s = sigma_minerals[x]


	chi_f = phi_f ** (m_f - 1)
	chi_s = chi_i(phi_s, phi_f, chi_f)
	G_f = phi_f * chi_f
	G_s = phi_s * chi_s
	m_s = m_i(phi_s, phi_f, chi_f)
	sigma.append( sigma_t(sigma_s, phi_s, chi_s, sigma_f, phi_f, m_f) )
	
	print "\nPhase ", x+1, " - ", sigma_name[x]
	print "Sigma(",sigma_name[x],") = ", sigma[x]
	print


