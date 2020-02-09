function [kNearestVec] = knearest(distVec,k)
%GETKNEAREST Summary of this function goes here
%   get the amount k nearest neighbours. Or get the amout k shortest
%   distances.
%   Input:
%   distVec nx2
%   k 1x1
%   Output: 
%   nxk´
%% Andreas Bernatzky 09.02.2020
%%
if(k <= size(distVec,1))
    kNearestVec =  [];
    
    while(size(kNearestVec,1) ~= k)
        [~,mInd] = min(distVec(:,1));

        kNearestVec(end+1,1) = distVec(mInd,1); 
        kNearestVec(end,2) = distVec(mInd,2);
        distVec(mInd,:) = [];
    end
end
    
end

