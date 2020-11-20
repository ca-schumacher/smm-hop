function [ steps_to_fall, TD_ind_step, TD_ind, TO_ind_step, TO_ind, Tri_Hop, duty_factor, t_contact ] = CALC_steps(steps, TD, TO, SIM_time )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[step_TD, TD_ind] = findpeaks(diff(TD));
[step_TO, TO_ind] = findpeaks(diff(TO));
steps_to_fall = length(TO_ind);

if steps_to_fall < steps
    TD_ind_step = nan;
    TO_ind_step = nan;
    Tri_Hop = nan;
    if steps_to_fall  > 1
        duty_factor = (SIM_time(TO_ind(end))-SIM_time(TD_ind(end)))/(SIM_time(TD_ind(end))-SIM_time(TD_ind(end-1)));
        t_contact = (SIM_time(TO_ind(end))-SIM_time(TD_ind(end)));
    else
        duty_factor = 0;
        t_contact = 0;
    end
else
    TD_ind_step = TD_ind(steps)+1;
    TO_ind_step = TO_ind(steps)+1;
    t_contact = (SIM_time(TO_ind_step)-SIM_time(TD_ind_step));
    duty_factor = t_contact/(SIM_time(TD_ind_step)-SIM_time(TD_ind(steps-1)));
    Tri_Hop = 1;
    
end

end

