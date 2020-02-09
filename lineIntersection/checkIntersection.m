function [doIntersect] = checkIntersection(p1,q1,p2,q2)
%CHECKINTERSECTION Summary of this function goes here
%   The main function that returns true if line segment 'p1q1' 
%  and 'p2q2' intersect. 
% https://www.geeksforgeeks.org/check-if-two-given-line-segments-intersect/
% https://www.geeksforgeeks.org/check-if-two-given-line-segments-intersect/
% Input: 
% p1,q1,p2,q2: 1x2
% Output: 
% boolean doIntersect (do the lines intersect true or false?)
%% Andreas Bernatzky 08.02.2020
%%
    doIntersect = false;
     o1 = orientation(p1, q1, p2); 
     o2 = orientation(p1, q1, q2); 
     o3 = orientation(p2, q2, p1); 
     o4 = orientation(p2, q2, q1); 
     
%   General case 
    if (o1 ~= o2 && o3 ~= o4 && q1(1) ~= p2(1) && q1(2) ~= p2(2)) 
        doIntersect = true;
    end
  %% In normal intersections tests this case would be true. But for concave algorithm p2 always lies on p1q1
  %  Because the special cases are bad for the algorithm to work I
  %  uncommented them. 
  
%     // Special Cases 
%     // p1, q1 and p2 are colinear and p2 lies on segment p1q1 
%     if (o1 == 0 && onSegment(p1, p2, q1))
%         doIntersect = true;
%         
%     end
%   
% %     // p1, q1 and q2 are colinear and q2 lies on segment p1q1 
%     if (o2 == 0 && onSegment(p1, q2, q1)) 
%         doIntersect = true;
%     end 
%   
% %     // p2, q2 and p1 are colinear and p1 lies on segment p2q2 
%     if (o3 == 0 && onSegment(p2, p1, q2))
%        doIntersect = true; 
%     end
%   
% %      // p2, q2 and q1 are colinear and q1 lies on segment p2q2 
%     if (o4 == 0 && onSegment(p2, q1, q2))
%        doIntersect = true; 
%     end
%   

     
end

