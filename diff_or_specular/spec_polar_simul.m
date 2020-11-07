function result = spec_polar_simul(I0, Normal_gt, Depth_gt, filename)

%======== Crop Range ========
x_start = 101;
x_end = 1124;

y_start = 1;
y_end = 1024;
%======== Crop Range ========

%% mask
mask = Depth_gt;
mask = bwmorph(mask,'skel',2); % manual-erode
mask(mask ~= 0) = 1;

%% az & ev
[az, ev] = norm2ang(Normal_gt, mask);

%% compute rho according to elevation angle
rho = generateRho_specular(ev, mask, 1.5);

%% TRS: generate I_45/90/135
angs = [0, 45, 90, 135];
% az(az>pi) = az(az>pi) - 2*pi;
images = generate_spec_images(angs, az, rho, I0);

% depth
z = Depth_gt;
z = max(max(z)) - z;
z = double(mask).*z;

medi = median(nonzeros(z)) * 2; % manual : 1.5/ 2/ 3
maxi = max(nonzeros(z));
z(z>medi) = 0;
Depth_gt = z;

% 
% %% show 3D 
% %Integration using Frankot Chellappa
% viewAng = [150 40]; 
% [X, Y] = meshgrid(1 : size(Depth_gt,2), 1 :size(Depth_gt,1));
% surf(X, Y, Depth_gt*4,'FaceColor', [0 0.5 0.8], 'EdgeColor', 'none');
% axis off;
% axis equal;
% camlight(45, 20); lighting gouraud;
% view(viewAng);

%% save files
mask = mask(y_start:y_end, x_start:x_end);
Depth_gt = Depth_gt(y_start:y_end, x_start:x_end); 
Depth_gt = Depth_gt .* mask;
Normal_gt = Normal_gt(y_start:y_end, x_start:x_end,:);
Normal_gt = Normal_gt .* mask;
images = images(y_start:y_end, x_start:x_end, :);
images = double(images) .* cat(3, mask, mask, mask, mask) / 255;

result = strcat(filename, '.mat');
save(result, 'images', 'mask', 'Depth_gt', 'Normal_gt');