function [orientation] = orientation(p,q,r)
%  To find orientation of ordered point triplet (p,q,r). 
%  The function returns following values 
%  0 --> a, b and c are colinear 
%  1 --> Clockwise 
%  2 --> Counterclockwise 
%  Input: 
%  p,q,r (1x2)
%  Output: 
%  see function description
%% Andreas Bernatzky 08.02.2020
%%
    val = (q(2) - p(2)) * (r(1) - q(1)) - (q(1) - p(1)) * (r(2) - q(2));
    
    if(val == 0)
        orientation = 0; %colinear
    elseif(val > 0)
        orientation  = 1; %Clockwise
    else
        orientation = 2; %Counterclockwise 
    end
end

