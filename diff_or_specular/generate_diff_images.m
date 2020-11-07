function imgs = generate_diff_images(angs, az, rho, I0)

angs = deg2rad(angs);

a = 1 + rho.*cos(2*angs(1) - 2*az);
b = 1 + rho.*cos(2*angs(2) - 2*az);
c = 1 + rho.*cos(2*angs(3) - 2*az);
d = 1 + rho.*cos(2*angs(4) - 2*az);

A = I0./a;

imgs(:,:,1) = I0;
imgs(:,:,2) = A.*b;
imgs(:,:,3) = A.*c;
imgs(:,:,4) = A.*d;
