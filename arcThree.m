function [arc] = arcThree(prev,act,sel)
%ARCTHREE Summary of this function goes here
%   Get the arc between three points (always) measured clock-wise.
%   the points prev,act,sel define points which are connected by vectors
%   The arc between those vector is calculated in degrees.
%   Input:
%   prev(previousPoint): 1x2
%   act(actualPoint): 1x2
%   sel(selectedPoint): 1x2
%% Andreas Bernatzky 08.02.20
%%
    vecActPrev = [prev(1) - act(1); prev(2) - act(2)]; %u;v coordinates of vector
    vecActSel = [sel(1) - act(1); sel(2) - act(2)]; % u;v coordinates of vector
    arc = atan2(vecActSel(2), vecActSel(1)) - atan2(vecActPrev(2), vecActPrev(1));% https://stackoverflow.com/questions/21483999/using-atan2-to-find-angle-between-two-vectors

if(arc < 0 ) %normalize
   arc = arc + 2 * pi; 
end

arc = 360 - (arc * (180/pi)); %to degree and make sure to create clockwise measured arc

    

end

