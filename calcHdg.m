function [hdg] = calcHdg(P1X,P1Y,P2X,P2Y)
%CALCHDG Summary of this function goes here
%   Calculate vectorheading between two points and normalize it.
%   Input:
%   P1X,P1Y,P2X,P2Y (1x2)
%   Output: 
%   hdg 1x1
%% Andreas Bernatzky 08.02.2020
%%
    difX = P2X - P1X;
    difY = P2Y - P1Y;

    hdg = atan2(difY,difX);
    
    if(hdg < 0)
        hdg = hdg + 2 * pi;%normalise
    end
        
    
end

