function [ h] = CALC_apex( xyCOM, steps ) % v, vCOM,
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[y_pks, y_ind] = findpeaks(xyCOM(:,2),'MinPeakProminence',0.001);
h = xyCOM(y_ind(steps),2);%-y0
% v = vCOM(y_ind(steps),1);%-y0

end

