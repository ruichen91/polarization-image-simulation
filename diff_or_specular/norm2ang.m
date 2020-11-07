function [az, ev] = norm2ang(norm, mask)

az = atan2(norm(:,:,2), norm(:,:,1));
az(az<0) = az(az<0) + 2*pi;
az = az.*mask;

ev = acos(norm(:,:,3));
ev = ev.*mask;