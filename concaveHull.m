function [concaveHull] = concaveHull(points,k)
%CONCAVEHULL Summary of this function goes here
% The first step of the process is to find the first
% vertex of the polygon  as the
% one with the lowest Y value. In the second step, the
% k points that are nearest to the current point are
% selected as candidates to be the next vertex of the
% polygon . In the third step, the k-nearest points of the
% current point  are selected as candidates to
% be the next point of the polygon. In this case, the point that results in
% the largest right-hand turn, corresponding to the
% largest angle between the previous line segment and
% the candidate line segment, is selected. As
% before, point  is now part of the polygon and will
% never be considered in the next steps.
% The process is repeated until the selected
% candidate is the first vertex. For the first vertex
% For the first vertex to be elected as a candidate, it must be
% inserted again into the data set after the first four
% points of the polygon are computed (before that, if
% the first point is selected as the best candidate, a
% triangle is computed). By the end of the process, the
% polygon is closed with the first and the last point
% being the same.

% Input: 
% points: nx2
% k: 1x1 int

% Output: 
% concaveHull: mx2
%% Andreas Bernatzky 07.02.2020
%%
scatter(points(:,1),points(:,2));%for visualisation only
hold on%for visualisation only
title(sprintf('A k-nearest neighbours approach for the computation of the region occupied by a set of points\nSample of 280 points and k = 5'));%for visualisation only
%% Validate Inputs
if(k >= 3 && size(points,1) > k)
    %% Step1
    concaveHull = [];
    [~,yMinIndi] = min(points(:,2)); % find the point with the smallest Y 
    concaveHull = setVec(concaveHull,points(yMinIndi,1),points(yMinIndi,2));
    points(yMinIndi,:) = [];

    %% Step2
        distVec = calcDist(concaveHull(1),concaveHull(2),points); 
        kNearest = knearest(distVec,k);

        hdgVec = [];
        for(a=1:1:size(kNearest,1))
            hdgVec(end+1,1) = calcHdg(concaveHull(1),concaveHull(2),points(kNearest(a,2),1),points(kNearest(a,2),2)); 
            hdgVec(end,2) = kNearest(a,2);
        end
        [~,cHi] = min(hdgVec(:,1));

         concaveHull = setVec(concaveHull,points(kNearest(cHi,2),1),points(kNearest(cHi,2),2));


    points(kNearest(cHi,2),:) = [];

    prevPoint = [concaveHull(1,1),concaveHull(1,2)];
    actPoint = [concaveHull(2,1),concaveHull(2,2)]; % actual point where all the calculates are done from

    addFirst = false;%add the first point just once
    %% Step3
    while(actPoint(1,1)~= concaveHull(1,1) && actPoint(1,2) ~= concaveHull(1,2))

        distVec = calcDist(actPoint(1),actPoint(2),points); 
        kNearest = knearest(distVec,k);
    candiScat = scatter(points(kNearest(:,2),1),points(kNearest(:,2),2),'filled','y');%just for visualization of the selected neared neighbours
    prevScat = scatter(prevPoint(1),prevPoint(2),150,'^');%just for visualization of the previous point
    actScat = scatter(actPoint(1),actPoint(2),150,'s');%just for visualization of the actual point
        arcVec = [];
        for(b=1:1:size(kNearest,1))
            i = kNearest(b,2);
            selPoint = points(i,:);
            interCheck = false; 
            for(c=1:1:size(concaveHull,1) - 1)
                interCheck = checkIntersection(concaveHull(c,:),concaveHull(c + 1,:),actPoint,selPoint);
                    if(interCheck == true && selPoint(1) ~= concaveHull(1,1) && selPoint(2) ~= concaveHull(1,2))
                       break; 
                    end       
            end
              if(interCheck == false)
                arcVec(end+1) = arcThree(prevPoint,actPoint,selPoint);
              else
                  arcVec(end+1) = 0;
              end
        end
       [~,maxIndiArc] = max(arcVec);%greatest arcindice
       winPoint = points(kNearest(maxIndiArc,2),:);%get indice from the point which creats the greatest arc
       concaveHull = setVec(concaveHull,winPoint(1),winPoint(2));
       scatter(winPoint(1),winPoint(2),'+','b');% just for visualization of a selected point
       points(kNearest(maxIndiArc,2),:) = [];

        if(addFirst == false)
            points = setVec(points,concaveHull(1,1),concaveHull(1,2));
            addFirst =  true;
        end

       prevPoint = actPoint;
       actPoint = winPoint;
    pause(0.1)%just for visualization
    delete(candiScat);%just for visualization
    delete(prevScat);%just for visualization
    delete(actScat);%just for visualization
    end
    
else
    concaveHull = [];
    disp('Unvalid Inputdataset provided or k to small');
end


end

