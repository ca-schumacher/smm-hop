%%---------------------------------------
% Blending weight calculation
%
% Christian Schumacher
% Technical University Darmstadt
% ? Christian Schumacher, 2018
%---------------------------------------

%% This script defines weights for loop

clear all
clc

%% Please change num_steps according to your step range!
num_steps = 10;

A = [0,0]; % Lower left point
B = [num_steps,0]; % Lower right point
C = [num_steps/2,num_steps]; % Upper middle point


% lambda1 + lambda2 + lambda3 = 1
for X = 1:num_steps+1
    for Y = 1:num_steps+1
        lambda_Velocity(X,Y) = ((B(2)-C(2))*((X-1)-C(1)) + (C(1)-B(1))*((Y-1)-C(2)))/((B(2)-C(2))*(A(1)-C(1)) + (C(1)-B(1))*(A(2)-C(2)));
        lambda_Length(X,Y) = ((C(2)-A(2))*((X-1)-C(1)) + (A(1)-C(1))*((Y-1)-C(2)))/((B(2)-C(2))*(A(1)-C(1)) + (C(1)-B(1))*(A(2)-C(2)));
        lambda_Force(X,Y) = 1 - lambda_Velocity(X,Y) - lambda_Length(X,Y);
        lambda_Force(X,Y) = round(lambda_Force(X,Y),3);
        
        
        if lambda_Force(X,Y) < 0 || lambda_Length(X,Y) < 0 || lambda_Velocity(X,Y) < 0
            lambda_Force(X,Y) = nan;
            lambda_Length(X,Y) = nan;
            lambda_Velocity(X,Y) = nan;
        end
    end
end

clear A B C X Y num_steps

loop_lambdas = length(lambda_Force);

save 'DATA_lambdas.mat'
%% With this definition 
% VFB is defined by (1,1), 
% LFB is defined by (num_steps+1,1) and
% FFB is defined by (num_steps/2+1,num_steps+1).