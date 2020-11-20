warning off

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
vx0         = 0;%5                              
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


% neuronal parameter (from Optimization)
% % % % % 
G_F         = 1.4;
G_L         = 65.1;
L_off       = 0.075;
G_V         = 2.1;
V_off       = -1.03;
% % % % % 

Delay       = 0.015; % knee joint

% excitation-contraction coupling
tau         =  0.01; %[s] delay time constant

% integrator max time step
ts_max = 1e-3;%e-1

