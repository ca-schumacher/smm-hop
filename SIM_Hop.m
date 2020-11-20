
%%
% Schumacher C and Seyfarth A (2017) Sensor-Motor Maps for Describing Linear Reflex Composition in Hopping. 
% Front. Comput. Neurosci. 11:108. doi: 10.3389/fncom.2017.00108 
%
%%

warning off
clear all
clc

%% -------------------------------------
% Load model data (parameters)
% --------------------------------------

% system parameter
g           = 9.81;
m           = 80;
d           = 0.04;
l_seg       = 0.5;
l_f         = 0.99;
phi_ref     = 110*pi/180;

% initial conditions
alpha0      = 90*pi/180;                        
y0          = 1.05;                             
vx0         = 0;
vy0         = 0;

% muscle parameter
Fmaxiso     = 22000;                            
lopt        = 0.1;
l_ref       = 0.5;
w           = 0.4;
c           = 0.05;
vmax        = 12;
N           = 1.5;
K           = 5;
l_see_slack = 0.4;
e_ref       = 0.04;

% neuronal parameter
G           = 1; 
PreStim     = 0.01;
Delay       = 0.015; %[s] % knee joint
tau         = 0.01; %[s] % excitation-contraction coupling

% % % % Feedback parameters (from Optimization)
G_F         = 1.4;
G_L         = 65.1;
L_off       = 0.075;
G_V         = 2.1;
V_off       = -1.03;

% % % % Feedback Blending
lambda_F = 1;
lambda_L = 0;
lambda_V = 0;

% integrator max time step
ts_max = 1e-3;%e-1

%% -------------------------------------
% Run Simulation
% --------------------------------------

sim MOD_Hop

%% -------------------------------------
% Visualization
% --------------------------------------
 PLOT_stickfigure_GRF(SIM_xyFP, SIM_xyCOM, SIM_phi, SIM_lever_arm, l_seg, l_f, alpha0, SIM_F_leg, SIM_time )