##
## Phase maps
##
## A number of different phases (a, b, c, d, and so on) are defined
## to map material (mineral) properties for mechanical and thermal properties
## The phases are mapped according to loaded image functions (e.g., thin sections)
### phase ranges
it_a_lo = -1.0e3
it_a_hi = 102.0
it_b_lo = 102.0
it_b_hi = 206.0
it_c_lo = 206.0
it_c_hi = 254.5
it_d_lo = 254.5
it_d_hi = 9120.0
it_e_lo = 9120.0
it_e_hi = 9160.0
it_f_lo = 9160.0
it_f_hi = 9360.0
it_z_lo = 9360.0
it_z_hi = 9390.0
###
### material properties
###
# density - rho
# specific heat - cp
# thermal conductivity - k
### GRANITE
# a - Plagioclase
# b - Quartz
# c - Biotite
# d - K-Feldspar
# e - averaged granite eberhardt 1999
# f - averaged granodiorite eberhardt 1999
###
### A - Plagioclase
###
GR_rho_a = 2630.0
GR_E_a = 50.8e3
GR_eps_a = 0.28
GR_e_a = 0.42e-5
GR_cp_a = 930.0
#GR_elK_a = 5.489582075116464e-15
GR_thK_a = 2.14
GR_vf_a = 0.018

###
### B - QUARTZ
###
GR_rho_b = 2650.0
GR_E_b = 37.0e3
GR_eps_b = 0.21
GR_e_b = 1.67e-5
GR_cp_b = 930.0
#GR_elK_b = 3.0521510159469183e-14
GR_thK_b = 7.69
GR_vf_b = 0.009

###
### C - BIOTITE
###
GR_rho_c = 3050.0
GR_E_c = 59.7e3
GR_eps_c = 0.21
GR_e_c = 1.21e-5
GR_cp_c = 1000.0
#GR_elK_c = 1.0e-6
GR_thK_c = 2.02
GR_vf_c = 0.009

###
### D - KFELDSPAR
###
GR_rho_d = 2560.0
GR_E_d = 53.7e3
GR_eps_d = 0.26
GR_e_d = 0.37e-5
GR_cp_d = 930.0
#GR_elK_d = 5.8817370083715116e-15
GR_thK_d = 2.31
GR_vf_d = 0.009

###
### REST
###
GR_rho_e = 2620.0
GR_rho_f = 2650.0
GR_rho_z = 3005.0
###  bulk modulus
GR_E_e = 47.7e3
GR_E_f = 47.8e3
GR_E_z = 59.7e3
## poisson ratio
GR_eps_e = 0.24
GR_eps_f = 0.24
GR_eps_z = 0.21
### strain
GR_e_e = 0.67e-6
GR_e_f = 0.71e-6
GR_e_z = 1.21e-6
## specific heat
GR_cp_e = 933.4
GR_cp_f = 936.8
GR_cp_z = 1000.0
## electrical conductivity
GR_elK_e = 3.36
GR_elK_f = 3.32
GR_elK_z = 5.8817370083715116e-15
## thermal conductivity
GR_thK_e = 3.36
GR_thK_f = 3.32
GR_thK_z = 2.02
## porosity
### plagioclase (montgomerey and brace) -
###### westerley granite (0.9%) - plagioclase (1.8%)
GR_vf_e = 0.009
GR_vf_f = 0.009
GR_vf_z = 0.009
### WATER (damaged material - drilling fluid)
WA_rho_z = 1000.0
WA_cp_z  = 4181.0
WA_thK_z = 0.591
WA_E_z = 2.0e3
WA_e_z = 1.0e-8
###
### SOLVER
###
time_step = 1.0e-7
time_end = 2.0e-6
plot_intervals = 4
###
### TEMPERATURE
###
T_solid_initial = 300.0
T_fluid_initial = ${T_solid_initial}
T_mix_initial = ${T_solid_initial}
T_fluid_reference = 423.0
###
### FLUID
###
density_fluid_constant = 1000
specific_heat_fluid_constant = 4100
concentration_fluid = 0.2
### ARCHIE
## Glover 2010 - Most porous arenaceous sediments have cementation exponents between 1.5 and 2.5 ?Glover et al., 1997?.
archie_m = 1.5
###
### Damage values
###
HBSigmaC = 122.0 # Kazerani 2013
HBM = 25.0 # JAeger et al. 2009
tensileStrength = 10.0 # in MPA Vogler et al. 2017
###
### VOLTAGE
###
voltage_high = 0.24e6
## anders et al. OMAE 2017 -
#  The voltages used for the process are up to 600 kV or higher.
#  The rise time of the impulses is less than 120 ns.
## Zuo et al 2015 ME -
#  pulse voltage from 50 kV to 200 kV (ore breakage)
## Zuo et al 2014 ME -
#  at a nominal voltage of 180 kV and
## biela et al. 2009 IEEE - In this paper a concept for a solid state modulator
#  which generates ignition voltages up to 45 kV and a peak output current of 2 kA
#  for application in plasma channel drilling was presented.
## Hoebejogi 2014 - The measurement results are compared with the literature,
#  and the requirements for further design are derived: the
#  pulse voltage VL ≥ 150kV and the rise time Tr ≤100ns.
## Lisitsyn et al. 1998 - The electric field strength of about hundred to
#  several hundreds of kV/cm is achieved at the surface of an with a
#  diameter of several mm and the applied voltage of 300–600 kV.
voltage_low = 0.0
###
### ELECTRODE
###
## Hobejogi 2014
# assuming D = 1mm for the inhomogeneous system



[Mesh]
  [gen]
    type=GeneratedMeshGenerator
    dim = 2
    nx = 2500
    ny = 500
    nz = 0
    xmin = 0.0
    xmax = 0.1
    ymax = 0.02
    zmin = 0
    zmax = 0
    elem_type = QUAD4
  []
  [createNewSidesetTop]
    type  =SideSetsFromBoundingBoxGenerator
    input = gen
    boundary_id_old = 'top'
    boundary_id_new = 10
    bottom_left = '0.0495 -0.09 0'
    top_right = '0.0505 0.11 0'
    block_id = 0
  []
  [createNewSidesetbottom]
    type  = SideSetsFromBoundingBoxGenerator
    input = createNewSidesetTop
    boundary_id_old = 'bottom'
    boundary_id_new = 11
    bottom_left = '0.0495 -0.09 0'
    top_right = '0.0505 0.11 0'
    block_id = 0
  []
[]


[GlobalParams]
  displacements = 'disp_x disp_y'
[]


[Modules/TensorMechanics/Master]
  [./tm]
    incremental = false
    add_variables = true
    eigenstrain_names = 'thermal_expansion ini_stress'
    temperature = T
    generate_output = 'stress_xx stress_yy stress_zz max_principal_stress min_principal_stress'
    use_displaced_mesh = false
  [../]
[]



[Variables]
  ### electric potential
  [./phi]
    initial_condition = 0.0
  [../]
  [./T]
    initial_condition = ${T_solid_initial}
  [../]
[]


[Kernels]
  [./elcond]
    type = HeatConduction
    variable = phi
    diffusion_coefficient = electrical_conductivity_material_mix
  [../]
  [./htcond]
    type = HeatConduction
    variable = T
  [../]
  # [./time_deriv_T]
  #   type = SpecificHeatConductionTimeDerivative
  #   specific_heat_solid = specific_heat_solid
  #   variable = phi_solid
  # [../]
[]


[AuxVariables]
  ###
  ### PARAMETER FIELD
  ###
  [./map]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./volumetric_fraction_fluid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./specific_heat_fluid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./density_fluid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ###
  ### PHI
  ###
  [./grad_phi_x]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./grad_phi_y]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./grad_phi_magnitude]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ###
  ### TEMPERATURE
  ###
  ### SOLID
  [./T_solid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./T_solid_delta]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ### FLUID
  [./T_fluid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./T_fluid_delta]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ### MIX
  [./T_mix]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./T_mix_delta]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ###
  ### ENERGY
  ###
  [./energy_dissipation_solid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./energy_dissipation_fluid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ###
  ### ELECTRICAL CONDUCTIVITY
  ###
  ### MINERALS
  [./electrical_conductivity_solid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./ec_kfeldspar]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./ec_plagioclase]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./ec_biotite]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./ec_quartz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ### ELECTRICAL CONDUCTIVITY - BRINE
  [./electrical_conductivity_fluid]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ### ELECTRICAL CONDUCTIVITY - MIX
  [./electrical_conductivity_mix]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ### ARCHIE
  [./archie_p]
    order = CONSTANT
    family = MONOMIAL
  [../]
  ###
  ### DAMAGE
  ###
  [./damagedMainEight]   order = CONSTANT   family = MONOMIAL
  [../]
  [./damagedMainTwenty]   order = CONSTANT   family = MONOMIAL
  [../]
[]



[AuxKernels]
  ###
  ### VOLUMETRIC FRACTION
  ###
  [./volumetric_fraction_fluid]
    type = MaterialRealAux
    property = volumetric_fraction_material_fluid
    variable = volumetric_fraction_fluid
  [../]
  [./specific_heat_fluid]
    type = MaterialRealAux
    property = specific_heat_material_fluid
    variable = specific_heat_fluid
  [../]
  [./density_fluid]
    type = MaterialRealAux
    property = density_material_fluid
    variable = density_fluid
  [../]
  ###
  ### grad phi in x and y direction
  ###
  ### SOLID
  [./grad_phi_x_aux]
    type = VariableGradientComponent
    variable = grad_phi_x
    component = x
    gradient_variable = phi
    execute_on = timestep_end
  [../]
  [./grad_phi_y_aux]
    type = VariableGradientComponent
    variable = grad_phi_y
    component = y
    gradient_variable = phi
    execute_on = timestep_end
  [../]
  [./grad_phi_magnitude]
    type = VectorMagnitudeAux
    variable = grad_phi_magnitude
    x = grad_phi_x
    y = grad_phi_y
    execute_on = timestep_end
  [../]
  ### ARCHIE
  [./archie_exponent_p]
    type = ParsedAux
    args = 'volumetric_fraction_fluid'
    variable = archie_p
    function = 'log( 1 - volumetric_fraction_fluid ^ ${archie_m} ) / log( 1 - volumetric_fraction_fluid )'
    execute_on = timestep_end
  [../]
  ###
  ### ENERGY DISSIPATION
  ###
  ### compute energy dissipation based on phi
  ### SOLID
  [./energy_dissipation_solid]
    type = ParsedAux
    args = 'electrical_conductivity_solid grad_phi_magnitude archie_p volumetric_fraction_fluid'
    variable = energy_dissipation_solid
    function = '(1 - volumetric_fraction_fluid)^archie_p * electrical_conductivity_solid * grad_phi_magnitude * grad_phi_magnitude * ${time_step}'
    execute_on = timestep_end
  [../]
  ### FLUID
  [./energy_dissipation_fluid]
    type = ParsedAux
    args = 'electrical_conductivity_fluid grad_phi_magnitude volumetric_fraction_fluid'
    variable = energy_dissipation_fluid
    function = 'volumetric_fraction_fluid^${archie_m} * electrical_conductivity_fluid * grad_phi_magnitude * grad_phi_magnitude * ${time_step}'
    execute_on = timestep_end
  [../]
  ###
  ### TEMPERATURE
  ###
  ### update temperature
  ### SOLID
  ### compute rise in temperature based on energy dissipation
  [./T_solid_delta]
    type = ParsedAux
    args = 'energy_dissipation_solid density_solid specific_heat_solid volumetric_fraction_fluid'
    variable = T_solid_delta
    function = 'energy_dissipation_solid / (specific_heat_solid * density_solid * (1 - volumetric_fraction_fluid) )'
    execute_on = timestep_end
  [../]
  [./T_solid_initial]
    type = ParsedAux
    args = 'T_solid_delta'
    variable = T_solid
    function = '${T_solid_initial}'
    execute_on = initial
  [../]
  [./T_solid]
    type = ParsedAux
    args = 'T_solid T_solid_delta'
    variable = T_solid
    function = 'T_solid + T_solid_delta'
    execute_on = timestep_end
  [../]
  ### FLUID
  ### compute rise in temperature based on energy dissipation
  [./T_fluid_delta]
    type = ParsedAux
    args = 'energy_dissipation_fluid specific_heat_fluid density_fluid volumetric_fraction_fluid'
    variable = T_fluid_delta
    function = 'energy_dissipation_fluid / (specific_heat_fluid * density_fluid * volumetric_fraction_fluid)'
    execute_on = timestep_end
  [../]
  [./T_fluid_initial]
    type = ParsedAux
    args = 'T_fluid_delta'
    variable = T_fluid
    function = '${T_fluid_initial}'
    execute_on = initial
  [../]
  [./T_fluid]
    type = ParsedAux
    args = 'T_fluid T_fluid_delta'
    variable = T_fluid
    function = 'T_fluid + T_fluid_delta'
    execute_on = timestep_end
  [../]
  ### MIX
  [./T_mix_delta]
    type = ParsedAux
    args = 'energy_dissipation_solid energy_dissipation_fluid volumetric_fraction_fluid
    specific_heat_solid density_solid
    specific_heat_fluid density_fluid'
    variable = T_mix_delta
    function = '(energy_dissipation_solid + energy_dissipation_fluid) /
    (specific_heat_fluid * density_fluid * volumetric_fraction_fluid
    + specific_heat_solid * density_solid * (1-volumetric_fraction_fluid) )'
    execute_on = timestep_end
  [../]
  [./T_mix_initial]
    type = ParsedAux
    args = 'T_mix_delta'
    variable = 'T_mix'
    function = '${T_mix_initial}'
    execute_on = initial
  [../]
  [./T_mix]
    type = ParsedAux
    args = 'T_mix T_mix_delta'
    variable = T_mix
    function = 'T_mix + T_mix_delta'
    execute_on = timestep_end
  [../]
  ###
  ### ELECTRICAL CONDUCTIVITY
  ###
  ### MINERALS
  [./electrical_conductivity_solid]
    type = MaterialRealAux
    property = electrical_conductivity_material_solid
    variable = electrical_conductivity_solid
  [../]
  [./ec_kfeldspar]
    type = MaterialRealAux
    property = electrical_conductivity_kfeldspar
    variable = ec_kfeldspar
  [../]
  [./ec_plagioclase]
    type = MaterialRealAux
    property = electrical_conductivity_plagioclase
    variable = ec_plagioclase
  [../]
  [./ec_biotite]
    type = MaterialRealAux
    property = electrical_conductivity_biotite
    variable = ec_biotite
  [../]
  [./ec_quartz]
    type = MaterialRealAux
    property = electrical_conductivity_quartz
    variable = ec_quartz
  [../]
  ### FLUID
  [./electrical_conductivity_fluid]
    type = MaterialRealAux
    property = electrical_conductivity_material_fluid
    variable = electrical_conductivity_fluid
  [../]
  ### MIX
  [./electrical_conductivity_mix]
    type = MaterialRealAux
    property = electrical_conductivity_material_mix
    variable = electrical_conductivity_mix
  [../]
  ###
  ### DAMAGE
  ###
  [./damagedMainEight]   type = MaterialRealAux   property = damageCriteria_mainEight   variable = damagedMainEight
  [../]
  [./damagedMainTwenty]   type = MaterialRealAux   property = damageCriteria_mainTwenty   variable = damagedMainTwenty
  [../]
[]



[Functions]
  ###
  ### IMAGE FUNCTION
  ###
  [./my_image]
    type = ImageFunction
    file_base = ../input_files/material_composition/voronoi_lacDuBonnetGranite_EberhardEtAl1999_sharp_
    file_suffix = png
    file_range = '00'
  [../]
[]


[ICs]
  ###
  ### FIELD MAP (initialize read in image)
  ###
  [./map_ic]
    type = FunctionIC
    function = my_image
    variable = map
  [../]
[]


[BCs]
  ###
  ### PHI
  ###
  ### top BC
  [./phi_top_dirichlet]
    type = DirichletBC
    boundary = '10'
    variable = phi
    value = ${voltage_high}
  [../]
  ### bottom BC
  [./phi_bottom_dirichlet]
    type = DirichletBC
    boundary = '11'
    variable = phi
    value = ${voltage_low}
  [../]
  ### MECH - DIRICHLET
  [./disp_x]
    # type = PresetBC
    type = DirichletBC
      preset=true
    boundary = 'left right'
    variable = disp_x
    value = 0
  [../]
  [./disp_y]
    # type = PresetBC
    type = DirichletBC
    preset=true
    boundary = 'left right'
    variable = disp_y
    value = 0
  [../]
[]



[Materials]
  ###
  ### SPECIFIC HEAT
  ###
  ### SOLID
  [./phasemap_cp_solid]
    type = ParsedMaterial
    f_name = specific_heat_solid
    args = 'map'
    function = 'if(map>${it_z_lo},${GR_cp_z},if(map>${it_f_lo},${GR_cp_f},if(map>${it_e_lo},
    ${GR_cp_e},if(map>${it_d_lo},${GR_cp_d},if(map>${it_c_lo},${GR_cp_c},if(map>${it_b_lo},
    ${GR_cp_b},if(map>${it_a_lo},${GR_cp_a},${GR_cp_z})))))))'
    outputs = exodus
  [../]
  ### FLUID
  [./phasemap_cp_fluid]
    type = ParsedMaterial
    f_name = specific_heat_material_fluid
    args = 'map'
    function = '${specific_heat_fluid_constant}'
    outputs = exodus
  [../]
  ###
  ### DENSITY
  ###
  ### SOLID
  [./phasemap_rho_solid]
    type = ParsedMaterial
    f_name = density_solid
    args = 'map'
    function = 'if(map>${it_z_lo},${GR_rho_z},if(map>${it_f_lo},${GR_rho_f},if(map>${it_e_lo},
    ${GR_rho_e},if(map>${it_d_lo},${GR_rho_d},if(map>${it_c_lo},${GR_rho_c},if(map>${it_b_lo},
    ${GR_rho_b},if(map>${it_a_lo},${GR_rho_a},${GR_rho_z})))))))'
    outputs = exodus
  [../]
  ### FLUID
  [./phasemap_rho_fluid]
    type = ParsedMaterial
    f_name = density_material_fluid
    args = 'map'
    function = '${density_fluid_constant}'
    outputs = exodus
  [../]
  ### phase field based volumetric fluid fraction
  [./volumetric_fraction_material_fluid]
    type = ParsedMaterial
    f_name = volumetric_fraction_material_fluid
    args = 'map'
    function = 'if(map>${it_z_lo},${GR_vf_z},if(map>${it_f_lo},${GR_vf_f},if(map>${it_e_lo},
    ${GR_vf_e},if(map>${it_d_lo},${GR_vf_d},if(map>${it_c_lo},${GR_vf_c},if(map>${it_b_lo},
    ${GR_vf_b},if(map>${it_a_lo},${GR_vf_a},${GR_vf_z})))))))'
    outputs = exodus
  [../]
  ###
  ### THERMAL PROPERTIES
  ###
  ### SOLID
  ### Steinhart-Hart relation for quartz
  [./electrical_conductivity_quartz]
    type = ParsedMaterial
    args = 'T_solid'
    f_name = electrical_conductivity_quartz
    constant_names       = 'A    B     k_b'
    constant_expressions = '6.3  0.82  8.618e-5'
    function = 'exp( A -B / ( k_b * T_solid ) ) / (T_solid + 1e-10)' #'1.6333e-5'#
    outputs = exodus
  [../]
  ### Steinhart-Hart relation for kfeldspar
  [./electrical_conductivity_kfeldspar]
    type = ParsedMaterial
    args = 'T_solid'
    f_name = electrical_conductivity_kfeldspar
    constant_names       = 'A     B     k_b'
    constant_expressions = '0.11  0.85  8.618e-5'
    function = 'exp( A -B / ( k_b * T_solid ) )' #'0.00028' #
    outputs = exodus
  [../]
  ### Steinhart-Hart relation for plagioclase
  [./electrical_conductivity_plagioclase]
    type = ParsedMaterial
    args = 'T_solid'
    f_name = electrical_conductivity_plagioclase
    constant_names       = 'A      B     k_b'
    constant_expressions = '0.041  0.85  8.618e-5'
    function = 'exp( A -B / ( k_b * T_solid ) )' # '0.0016'#
    outputs = exodus
  [../]
  ### Steinhart-Hart relation for biotite
  [./electrical_conductivity_biotite]
    type = ParsedMaterial
    args = 'T_solid'
    f_name = electrical_conductivity_biotite
    constant_names       = 'A      B    k_b'
    constant_expressions = '-13.8  0.0  8.618e-5'
    function = 'exp( A -B / ( k_b * T_solid ) )' #'0.004'#
    outputs = exodus
  [../]
  ### map different Steinhart-Hart relations to respective areas
  [./ecm_solid]
    type = ParsedMaterial
    f_name = electrical_conductivity_material_solid
    args = 'map ec_kfeldspar ec_plagioclase ec_quartz ec_biotite'
    function = 'if(map>${it_z_lo},${GR_elK_z},if(map>${it_f_lo},${GR_elK_f},if(map>${it_e_lo},
    ${GR_thK_e},if(map>${it_d_lo},ec_kfeldspar,if(map>${it_c_lo},ec_biotite,if(map>${it_b_lo},
    ec_quartz,if(map>${it_a_lo},ec_plagioclase,${GR_elK_z})))))))'
    outputs = exodus
  [../]
  ### FLUID
  [./ecm_fluid]
    type = ParsedMaterial
    args = 'T_fluid specific_heat_fluid density_fluid'
    f_name = electrical_conductivity_material_fluid
    function = 'if(T_fluid>423.0,
    10^(-1.706 -93.78/T_fluid +0.8075*log10(${concentration_fluid}*100) +3.0781*log10(density_fluid/1000.0)
    +log10( (1573 -1212*density_fluid/1000.0 +537062/T_fluid -208122721/(T_fluid*T_fluid) ) ) ),
       10^(-1.706 -93.78/${T_fluid_reference} +0.8075*log10(${concentration_fluid}*100) +3.0781*log10(density_fluid/1000.0)
    +log10( (1573 -1212*density_fluid/1000.0 +537062/${T_fluid_reference}
          -208122721/(${T_fluid_reference}*${T_fluid_reference}) ) ) ) * (T_fluid - 251.65) / (${T_fluid_reference} - 251.65) )'
    outputs = exodus
  [../]
  ### MIX
  [./ecm_mix]
    type = ParsedMaterial
    args = 'electrical_conductivity_fluid electrical_conductivity_solid archie_p volumetric_fraction_fluid'
    f_name = electrical_conductivity_material_mix
    function = 'electrical_conductivity_solid * (1-volumetric_fraction_fluid)^archie_p
    + electrical_conductivity_fluid * volumetric_fraction_fluid ^ ${archie_m}'
    outputs = exodus
  [../]


  ###
  ### STRESS
  ###
  ### Define elasticity tensors for individual phases
  [./C_a]
    type = ComputeIsotropicElasticityTensor
    base_name = C_a
    poissons_ratio = '${GR_eps_a}'
    youngs_modulus = '${GR_E_a}'
  [../]
  [./C_b]
    type = ComputeIsotropicElasticityTensor
    base_name = C_b
    poissons_ratio = '${GR_eps_b}'
    youngs_modulus = '${GR_E_b}'
  [../]
  [./C_c]
    type = ComputeIsotropicElasticityTensor
    base_name = C_c
    poissons_ratio = '${GR_eps_c}'
    youngs_modulus = '${GR_E_c}'
  [../]
  [./C_d]
    type = ComputeIsotropicElasticityTensor
    base_name = C_d
    poissons_ratio = '${GR_eps_d}'
    youngs_modulus = '${GR_E_d}'
  [../]
  [./C_e]
    type = ComputeIsotropicElasticityTensor
    base_name = C_e
    poissons_ratio = '${GR_eps_e}'
    youngs_modulus = '${GR_E_e}'
  [../]
  [./C_f]
    type = ComputeIsotropicElasticityTensor
    base_name = C_f
    poissons_ratio = '${GR_eps_f}'
    youngs_modulus = '${GR_E_f}'
  [../]
  [./C_damaged]
    type = ComputeIsotropicElasticityTensor
    base_name = C_damaged
    poissons_ratio = '${GR_eps_z}'
    youngs_modulus = '${GR_E_z}'
  [../]
  [./C_damaged_b]
    type = ComputeIsotropicElasticityTensor
    base_name = C_damaged_b
    poissons_ratio = '${GR_eps_z}'
    youngs_modulus = '${GR_E_z}'
  [../]
  ### define material class based on material phases
  [./F_a]
    type = DerivativeParsedMaterial
    f_name = F_a
    function = 'if(${it_a_lo}<map,if(map<=${it_a_hi},1,0),0)'
    args = map
    outputs = exodus
  [../]
  [./F_b]
    type = DerivativeParsedMaterial
    f_name = F_b
    function = 'if(${it_b_lo}<map,if(map<=${it_b_hi},1,0),0)'
    args = map
    outputs = exodus
  [../]
  [./F_c]
    type = DerivativeParsedMaterial
    f_name = F_c
    function = 'if(${it_c_lo}<map,if(map<=${it_c_hi},1,0),0)'
    args = map
    outputs = exodus
  [../]
  [./F_d]
    type = DerivativeParsedMaterial
    f_name = F_d
    function = 'if(${it_d_lo}<map,if(map<=${it_d_hi},1,0),0)'
    args = map
    outputs = exodus
  [../]
  [./F_e]
    type = DerivativeParsedMaterial
    f_name = F_e
    function = 'if(${it_e_lo}<map,if(map<=${it_e_hi},1,0),0)'
    args = map
    outputs = exodus
  [../]
  [./F_f]
    type = DerivativeParsedMaterial
    f_name = F_f
    function = 'if(${it_f_lo}<map,if(map<=${it_f_hi},1,0),0)'
    args = map
    outputs = exodus
  [../]
  [./F_damaged]
    type = DerivativeParsedMaterial
    f_name = F_damaged
    function = 'if(${it_z_lo}<map,if(map<=${it_z_hi},1,0),0)'
    args = map
    outputs = exodus
  [../]
  [./F_damaged_b]
    type = DerivativeParsedMaterial
    f_name = F_damaged_b
    function = 'if(map<${it_a_lo},1,0)'
    args = map
    outputs = exodus
  [../]
  ### M - HETEROGENEOUS
  ### sort elasticity tensors to respective material class
  [./elasticity_tensor]
    type = CompositeElasticityTensor
    args = map
    tensors = 'C_a C_b C_c C_d C_e C_f C_damaged C_damaged_b'
    weights = 'F_a F_b F_c F_d F_e F_f F_damaged F_damaged_b'
  [../]
  ### M - HOMOGENEOUS
  # [./elasticity_tensor]
  #   type = ComputeIsotropicElasticityTensor
  #   youngs_modulus = 50E3
  #   poissons_ratio = 0.3
  # [../]
  ### M - GENERAL
  ### compute linear elastic stress in domain
  [./elastic_stress]
    type = ComputeLinearElasticStress
  [../]
  [./ini_strain]
    type = ComputeEigenstrainFromInitialStress
    initial_stress = '0.0 0.0 0.0  0.0 0.0 0.0  0.0 0.0 0.0' # radial, vertical, hoop
    eigenstrain_name = ini_stress
  [../]



  ###
  ### TM COUPLING
  ###
  ### HETEROGENEOUS
  ### define eigenstrains per Kelvin temperature change
  [./e_1] # eigenstrain per Kelvin for phase 1
    type = GenericConstantRankTwoTensor
    tensor_values = '${GR_e_a} 0.0 0.0   0.0 ${GR_e_a} 0.0   0.0 0.0 ${GR_e_a}'
    tensor_name = e_1
  [../]
  [./e_2] # eigenstrain per Kelvin for phase 2
    type = GenericConstantRankTwoTensor
    tensor_values = '${GR_e_b} 0.0 0.0   0.0 ${GR_e_b} 0.0   0.0 0.0 ${GR_e_b}'
    tensor_name = e_2
  [../]
  [./e_3] # eigenstrain per Kelvin for phase 3
    type = GenericConstantRankTwoTensor
    tensor_values = '${GR_e_c} 0.0 0.0   0.0 ${GR_e_c} 0.0   0.0 0.0 ${GR_e_c}'
    tensor_name = e_3
  [../]
  [./e_4] # eigenstrain per Kelvin for phase 4
    type = GenericConstantRankTwoTensor
    tensor_values = '${GR_e_d} 0.0 0.0   0.0 ${GR_e_d} 0.0   0.0 0.0 ${GR_e_d}'
    tensor_name = e_4
  [../]
  [./e_5] # eigenstrain per Kelvin for phase 5
    type = GenericConstantRankTwoTensor
    tensor_values = '${GR_e_e} 0.0 0.0   0.0 ${GR_e_e} 0.0   0.0 0.0 ${GR_e_e}'
    tensor_name = e_5
  [../]
  [./e_6] # eigenstrain per Kelvin for phase 6
    type = GenericConstantRankTwoTensor
    tensor_values = '${GR_e_f} 0.0 0.0   0.0 ${GR_e_f} 0.0   0.0 0.0 ${GR_e_f}'
    tensor_name = e_6
  [../]
  [./e_damaged] # eigenstrain per Kelvin for phase 2
    type = GenericConstantRankTwoTensor
    tensor_values = '${GR_e_z} 0.0 0.0   0.0 ${GR_e_z} 0.0   0.0 0.0 ${GR_e_z}'
    tensor_name = e_damaged
  [../]
  [./e_damaged_b] # eigenstrain per Kelvin for phase 2
    type = GenericConstantRankTwoTensor
    tensor_values = '${GR_e_z} 0.0 0.0   0.0 ${GR_e_z} 0.0   0.0 0.0 ${GR_e_z}'
    tensor_name = e_damaged_b
  [../]
  ### materials for factors multiplied onto the "per Kelvin tensors"
  [./func_a]
    type = DerivativeParsedMaterial
    function = 'if(${it_a_lo}<map,if(map<=${it_a_hi},T_mix-${T_solid_initial},0),0)'
    f_name = f_a
    args = 'map T_mix'
  [../]
  [./func_b]
    type = DerivativeParsedMaterial
    function = 'if(${it_b_lo}<map,if(map<=${it_b_hi},T_mix-${T_solid_initial},0),0)'
    f_name = f_b
    args = 'map T_mix'
  [../]
  [./func_c]
    type = DerivativeParsedMaterial
    function = 'if(${it_c_lo}<map,if(map<=${it_c_hi},T_mix-${T_solid_initial},0),0)'
    f_name = f_c
    args = 'map T_mix'
  [../]
  [./func_d]
    type = DerivativeParsedMaterial
    function = 'if(${it_d_lo}<map,if(map<=${it_d_hi},T_mix-${T_solid_initial},0),0)'
    f_name = f_d
    args = 'map T_mix'
  [../]
  [./func_e]
    type = DerivativeParsedMaterial
    function = 'if(${it_e_lo}<map,if(map<=${it_e_hi},T_mix-${T_solid_initial},0),0)'
    f_name = f_e
    args = 'map T_mix'
  [../]
  [./func_f]
    type = DerivativeParsedMaterial
    function = 'if(${it_f_lo}<map,if(map<=${it_f_hi},T_mix-${T_solid_initial},0),0)'
    f_name = f_f
    args = 'map T_mix'
  [../]
  [./func_damaged]
    type = DerivativeParsedMaterial
    function = 'if(${it_z_lo}<map,if(map<=${it_z_hi},T_mix-${T_solid_initial},0),0)'
    f_name = f_damaged
    args = 'map T_mix'
  [../]
  [./func_damaged_b]
    type = DerivativeParsedMaterial
    function = 'if(map<${it_a_lo},T_mix-${T_solid_initial},0)'
    f_name = f_damaged_b
    args = 'map T_mix'
  [../]
  ### HOMOGENEOUS
  # [./thermal_expansion_strain]
  #   type = ComputeThermalExpansionEigenstrain
  #   stress_free_temperature = 300.0
  #   thermal_expansion_coeff = 2E-5
  #   temperature = T
  #   eigenstrain_name = thermal_expansion
  # [../]
  ### HETEROGENEOUS
  ### compute strains based on reference T and current T and strain properties
  [./eigenstrain]
    type = CompositeEigenstrain
    tensors = 'e_1 e_2 e_3 e_4 e_5 e_6 e_damaged e_damaged_b'
    weights = 'f_a f_b f_c f_d f_e f_f f_damaged f_damaged_b'
    args = 'map T_mix'
    eigenstrain_name = thermal_expansion
  [../]
  # ### phase field based thermal conductivity
  [./phasemap_k_th]
    type = ParsedMaterial
    f_name = thermal_conductivity
    args = 'map'
    function = 'if(map>${it_z_lo},${GR_thK_z},if(map>${it_f_lo},${GR_thK_f},if(map>${it_e_lo},
    ${GR_thK_e},if(map>${it_d_lo},${GR_thK_d},if(map>${it_c_lo},${GR_thK_c},if(map>${it_b_lo},
    ${GR_thK_b},if(map>${it_a_lo},${GR_thK_a},${GR_thK_z})))))))'
    outputs = exodus
  [../]

  ###
  ### DAMAGE
  ###
 [./mat_damage_criteria_mainEight]
   type = ParsedMaterial
   f_name = damageCriteria_mainEight
   args = 'min_principal_stress max_principal_stress damagedMainEight'
   function = 'if(damagedMainEight>0.1,damagedMainEight,
   if(-min_principal_stress > -max_principal_stress+( -max_principal_stress*${HBM}*${HBSigmaC}+${HBSigmaC}^2)^(0.5),
   if(-max_principal_stress > 0.0,5,4),
   if(-min_principal_stress > -max_principal_stress+(0.11*${HBSigmaC}^2)^(0.5),
   if(-max_principal_stress > 0.0,
   if(min_principal_stress/max_principal_stress > 14.0,3,if(damagedMainEight>0,damagedMainEight,0)),2),
   if(max_principal_stress > ${tensileStrength},1,if(damagedMainEight>0,damagedMainEight,0)))))'
   outputs = exodus
  [../]
  [./mat_damage_criteria_mainTwenty]
   type = ParsedMaterial
   f_name = damageCriteria_mainTwenty
   args = 'min_principal_stress max_principal_stress damagedMainTwenty'
   function = 'if(damagedMainTwenty>0.1,damagedMainTwenty,
   if(-min_principal_stress > -max_principal_stress+( -max_principal_stress*${HBM}*${HBSigmaC}+${HBSigmaC}^2)^(0.5),
   if(-max_principal_stress > 0.0,5,4),
   if(-min_principal_stress > -max_principal_stress+(0.11*${HBSigmaC}^2)^(0.5),
   if(-max_principal_stress > 0.0,
   if(min_principal_stress/max_principal_stress > 20.0,3,if(damagedMainTwenty>0,damagedMainTwenty,0)),2),
   if(max_principal_stress > ${tensileStrength},1,if(damagedMainTwenty>0,damagedMainTwenty,0)))))'
   outputs = exodus
  [../]
[]



[Executioner]
  type = Transient
  #
  # solve_type = NEWTON
  # petsc_options = ksp_monitor
  # petsc_options_iname = '-pc_type -pc_factor_mat_solver_package'
  # petsc_options_value = 'lu mumps'

  solve_type = 'PJFNK'
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'

  nl_rel_tol = 1e-5
  nl_abs_tol = 1E-10

  dt = ${time_step}
  end_time = ${time_end}
[]


[Debug]
  show_var_residual_norms = true
[]



[Outputs]
  interval = ${plot_intervals}
  exodus = true
  perf_graph = true
  file_base = ./electric_potential_-_damage_c20_2500x500_240kV
[]
