clc;
clear;

filename = 'deer'
I0 = double(rgb2gray(imread(strcat(filename, '.jpg'))));
load Normal_gt.mat
load Depth_gt.mat
%% diffuse
% diff_polar_simul(I0, Normal_gt, Depth_gt, filename)

%% specular
spec_polar_simul(I0, Normal_gt, Depth_gt, filename)