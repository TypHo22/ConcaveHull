function [onSeg] = onSegment(p,q,r)
%ONSEGMENT Summary of this function goes here
% Given three colinear points p, q, r, the function checks if 
% point q lies on line segment 'pr'
% Input:
% p,q,r (1x2)
% Output: boolean onSeg
%% Andreas Bernatzky 08.02.2020
%%

    onSeg = false;
    if(q(1) <= max(p(1), r(1)) && q(1) >= min(p(1), r(1)) && q(2)<= max(p(2), r(2)) && q(2) >= min(p(2), r(2)))
       onSeg = true;
    end
    
end

