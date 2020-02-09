%% Run_ConcaveHull
% Matlabimplementation of a k-nearest neighbours algorithm which calculates
% a concave hull around a pointcloud
% https://www.researchgate.net/publication/220868874_Concave_hull_A_k-nearest_neighbours_approach_for_the_computation_of_the_region_occupied_by_a_set_of_points
%% Andreas Bernatzky 09.02.2020
%%
clear all;
close all;

load('testdat'); %[X-Data,Y-Data]

concaveHull = concaveHull(points,3);

%% visualisation
if(isempty(concaveHull) == false)
    ff= scatter(concaveHull(:,1),concaveHull(:,2),'filled','b');
    pause(1);
    delete(ff);
    pause(1);
    ff= scatter(concaveHull(:,1),concaveHull(:,2),'filled','b');
    pause(1);
    delete(ff);
    pause(1);
    ff= scatter(concaveHull(:,1),concaveHull(:,2),'filled','b');
    pause(1);
    delete(ff);
end