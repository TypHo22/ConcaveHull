function [distVec] = calcDist(PointX,PointY,PointVector)
%CALCDIST Summary of this function goes here
%   Calculate the distance between one Point and N-Amount of different
%   points in PointVector
%  
%   Input:
%   PointX 1x1
%   PointY 1x1
%   PointVector nx2
%   
%   Output: 
%   distances from PointXY to PointVector points
%% Andreas Bernatzky 08.02.20
%%
    distVec = [];
    for(a = 1:1:size(PointVector,1))
        dist = sqrt((PointVector(a,1) - PointX)^2 + (PointVector(a,2) - PointY)^2);
            if(dist ~= 0)%to prevent finding itself
                distVec(end+1,1) = dist;
                distVec(end,2) = a; %second collumn will be indice
            end
    end
    
end

