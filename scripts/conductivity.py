import numpy as np
import pylab as pl

c = 0.01  # NaCl mol/kg
T = 300.    # K
rho = 1.0  # g/cm

ArpsLawTemp =  273.15 -21.5   # 21.5 from Electrical Conductivity and Viscosity of Aqueous NaCl Solutions with Dissolved CO2

def convertWtPercentToMolarity(wtConc,molarMass,rho):
  return  1000*rho*wtConc/molarMass

def convertMolarityToWtPercent(molarity,molarMass,rho):
  return  molarity*molarMass/(1000*rho)

def Lambdao(rho,T):
  return 1573. - 1212.*rho + 537062./T - 208122721./T**2






def ConductivityLogNatural(rho,T,c):
  if(T >= 423.15):
    log_conductivity = -1.7060 - 93.78/T + 0.8075*np.log(c) + 3.0781 *np.log(rho) + np.log(Lambdao(rho,T))
    conductivity =  np.exp(log_conductivity)
  else:
    conductivity150 = ConductivityLogNatural(rho,423.15,c)
    conductivity = conductivity150*(T-ArpsLawTemp)/(423.15-ArpsLawTemp)
  return conductivity




# this seems correct (and best for low temps - based on Sinmyo Keppler 2016)
def Conductivity(rho,T,c):
  if(T >= 423.15):
    log_conductivity = -1.7060 - 93.78/T + 0.8075*np.log10(c) + 3.0781 *np.log10(rho) + np.log10(Lambdao(rho,T))
    #log_conductivity = -0.919 - 872.5/T  + 0.852  *np.log10(c) + 7.61*np.log10(rho) + np.log10(Lambdao(rho,T)) 
    conductivity = 10**log_conductivity # np.exp(log_conductivity)
  else:
    conductivity150 = Conductivity(rho,423.15,c)
    conductivity = conductivity150*(T-ArpsLawTemp)/(423.15-ArpsLawTemp)
  return conductivity

# this seems correct (and best for low temps - based on Sinmyo Keppler 2016)
def Conductivity600(rho,T,c):
  if(T >= 423.15):
    log_conductivity = -1.7060 - 93.78/T + 0.8075*np.log10(c) + 3.0781 *np.log10(rho) + np.log10(Lambdao(rho,T))
    #log_conductivity = -0.919 - 872.5/T  + 0.852  *np.log10(c) + 7.61*np.log10(rho) + np.log10(Lambdao(rho,T)) 
    conductivity = 10**log_conductivity # np.exp(log_conductivity)
  else:
    conductivity150 = Conductivity600(rho,423.15,c)
    conductivity = conductivity150*(T-ArpsLawTemp)/(423.15-ArpsLawTemp)
  return conductivity




# this is keppler's later paper 2019 but does not seem to work as well 

def Conductivity900(rho,T,c):
  if(T >= 423.15):
    #log_conductivity = -1.7060 - 93.78/T + 0.8075*np.log10(c) + 3.0781 *np.log10(rho) + np.log10(Lambdao(rho,T))
    log_conductivity = -0.919 - 872.5/T  + 0.852  *np.log10(c) + 7.61*np.log10(rho) + np.log10(Lambdao(rho,T)) 
    conductivity = 10**log_conductivity # np.exp(log_conductivity)
  else:
    conductivity150 = Conductivity(rho,423.15,c)
    conductivity = conductivity150*(T-ArpsLawTemp)/(423.15-ArpsLawTemp)
  return conductivity



  
def Conductivity100(rho,T,c):
  if(T >= 373.15):
    log_conductivity = -1.7060 - 93.78/T + 0.8075*np.log10(c) + 3.0781 *np.log10(rho) + np.log10(Lambdao(rho,T))
    conductivity =  10**log_conductivity #np.exp(log_conductivity)
  else:
    conductivity100 = Conductivity100(rho,373.15,c)
    conductivity = conductivity100*(T-ArpsLawTemp)/(373.15-ArpsLawTemp)
  return conductivity


tt = np.linspace(293.15,10673.15)
conductivities = []
conductivities100 = []
for temp in tt:
  CC = Conductivity(rho,temp,c)
  conductivities.append(CC)
  CC = Conductivity100(rho,temp,c)
  conductivities100.append(CC)

conductivities = np.array(conductivities)
conductivities100 = np.array(conductivities100)

pl.plot(tt, conductivities)
pl.plot(tt, conductivities100)
pl.xlabel('Temperature [K]')
pl.ylabel('Conductivity [$S/m$]')


#########################

pl.figure()


NaClMolarMass = 58.44
c = 20 # convertWtPercentToMolarity(0.2,NaClMolarMass,rho)
print "conc", c

tt = np.linspace(293.15,10673.15)
conductivities = []
for temp in tt:
  CC = Conductivity600(rho,temp,c)
  conductivities.append(CC)

conductivities = np.array(conductivities)

pl.loglog(1.0/conductivities,tt-273.15)


c =3# convertWtPercentToMolarity(0.03,NaClMolarMass,rho)
print "conc", c

conductivities = []
for temp in tt:
  CC = Conductivity(rho,temp,c)
  conductivities.append(CC)

conductivities = np.array(conductivities)

pl.loglog(1.0/conductivities,tt-273.15)

pl.gca().invert_yaxis()


# Straight up Arps law
# c = 0.01 M,  T = 27C,  99 0.126

tempInC =25.
conductivity25 = 5.0
conductivities25 = conductivity25*(tt-ArpsLawTemp)/(tempInC+273.15-ArpsLawTemp)
pl.loglog(1.0/conductivities25,tt-273.15,"--")

pl.ylabel('Temperature [C]')
pl.xlabel('Resistivity [$\Omega*m$]')


#########################

pl.figure()


NaClMolarMass = 58.44
c = 20# convertWtPercentToMolarity(0.2,NaClMolarMass,rho)
print "conc", c

tt = np.linspace(293.15,673.15)
conductivities = []
for temp in tt:
  CC = Conductivity(rho,temp,c)
  conductivities.append(CC)

conductivities = np.array(conductivities)

pl.plot(1.0/conductivities,tt-273.15)


c = 3# convertWtPercentToMolarity(0.03,NaClMolarMass,rho)
print "conc", c

conductivities = []
for temp in tt:
  CC = Conductivity(rho,temp,c)
  conductivities.append(CC)

conductivities = np.array(conductivities)

pl.plot(1.0/conductivities,tt-273.15)


# Straight up Arps law


tempInC =25.
conductivity25 = 5.0
conductivities25 = conductivity25*(tt-ArpsLawTemp)/(tempInC+273.15-ArpsLawTemp)
pl.plot(1.0/conductivities25,tt-273.15,"--")



tempInC =25.
conductivity25 = 25.0
conductivities25 = conductivity25*(tt-ArpsLawTemp)/(tempInC+273.15-ArpsLawTemp)
pl.plot(1.0/conductivities25,tt-273.15,"--")

pl.ylabel('Temperature [C]')
pl.xlabel('Resistivity [$\Omega*m$]')


"""
pl.figure()

# Data from Electrical conductivity of NaCl-bearing aqueous fluids to 600 and 1 GPa

# Straight up Arps law
# c = 0.01 M,  T = 27C,  99 0.126
c =0.01
tempInC =27.
conductivity25 = 0.126
conductivities25 = conductivity25*(tt-ArpsLawTemp)/(tempInC+273.15-ArpsLawTemp)
pl.plot(1.0/conductivities25,tt-273.15,":")

conductivities = []
for temp in tt:
  CC = Conductivity(rho,temp,c)
  conductivities.append(CC)

conductivities = np.array(conductivities)

pl.plot(1.0/conductivities,tt-273.15)

"""

pl.show()




# Arps approximation works up to 200c according to "Electrical resistivity of geothermal brines"
# use it in reverse to back out low temps
