function [vector] = setVec(vector,xVal,yVal)
%SETTOVECTOR Summary of this function goes here
%   Align to xy-value to Vector
%   Input: 
%   vector: nx2
%   xVal,yVal: 1x1
%   Output:
%   n+1 x 2
%% Andreas Bernatzky 09.02.2020
%%
     vector(end+1,1) = xVal;
     vector(end,2) = yVal;
end

