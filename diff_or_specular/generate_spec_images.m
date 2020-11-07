function imgs = generate_spec_images(angs, az, rho, I0)

angs = deg2rad(angs);

a = 1 + rho.*cos(2*angs(1) - 2*az + pi);
b = 1 + rho.*cos(2*angs(2) - 2*az + pi);
c = 1 + rho.*cos(2*angs(3) - 2*az + pi);
d = 1 + rho.*cos(2*angs(4) - 2*az + pi);

A = I0./a;

imgs(:,:,1) = I0;
imgs(:,:,2) = A.*b;
imgs(:,:,3) = A.*c;
imgs(:,:,4) = A.*d;
