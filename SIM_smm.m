%%---------------------------------------
% Create Sensor-Motor Map
%
% Christian Schumacher
% Technical University Darmstadt
% ? Christian Schumacher, 2018
%---------------------------------------

%% This script performs the computation to create the sensor motor maps

clear all
clc
warning off

run INIT_smm

load DATA_lambdas.mat

PreStim     = 0.01;
G           = 1;
G_F         = 2.6;
G_L         = 130;
L_off       = 0.08;
G_V         = 2.9;
V_off       = -0.6;
e_ref       = 0.03;

disp('Simulating Sensor-Motor Map')

%% Loop through solution space (blending factors)

for i = 1:loop_lambdas
    for j = 1:loop_lambdas

    lambda_F    = lambda_Force(i,j);
    lambda_L    = lambda_Length(i,j);
    lambda_V    = lambda_Velocity(i,j);

    Tri_lambda_F(i,j) = lambda_F;
    Tri_lambda_L(i,j) = lambda_L;
    Tri_lambda_V(i,j) = lambda_V;

    % undefined lambdas:
        if (isnan(lambda_F) == 1)||(isnan(lambda_L) == 1)||(isnan(lambda_V) == 1)
            Tri_steps_to_fall(i,j) = nan;
            Tri_TD_ind(i,j) = nan;
            Tri_TO_ind(i,j) = nan;
            Tri_hop(i,j) = nan;
            Tri_duty(i,j) = nan;
            Tri_contact(i,j) = nan;
            Tri_h_hop(i,j)  = nan;
            Tri_freq_hop(i,j)  = nan;
            Tri_Met_eta(i,j)  = nan;                         
            Tri_Met_eff(i,j)  = nan;
            continue
        end


    %% simulate
    options = simset ('SrcWorkspace','current');
    sim('MOD_Hop');%, [], options);

    %% evaluate solution space
    %% (1) stability
    steps = 49;
    [Tri_steps_to_fall(i,j), Tri_TD_ind(i,j), TD_ind, Tri_TO_ind(i,j), TO_ind, Tri_hop(i,j), Tri_duty(i,j), Tri_contact(i,j)] = CALC_steps(steps,TD,TO,SIM_time);
    n_steps = Tri_steps_to_fall(i,j)

        if Tri_steps_to_fall(i,j) < steps
            Tri_h_hop(i,j)  = nan;
            Tri_freq_hop(i,j) = nan;
            Tri_Met_eta(i,j)  = nan;
            Tri_Met_eff(i,j)  = nan;
        else
        %% (2) frequency
        Tri_freq_hop(i,j) = Tri_steps_to_fall(i,j)/max(SIM_time);

        %% (3) performance
        [ Tri_h_hop(i,j) ] = CALC_apex( SIM_xyCOM, steps );

        end

    end

end
keepvars = {'Tri*', 'lambda_Force', 'lambda_Length', 'lambda_Velocity', 'loop_lambdas'};
clearvars('-except', keepvars{:});    
filename = strcat('DATA_results_smm.mat');
save(filename)