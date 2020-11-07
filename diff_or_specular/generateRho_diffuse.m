function rho = generateRho_diffuse(ev, mask, n)

numerator = (n - 1/n)^2 * sin(ev).* sin(ev);
denominat = 2 + 2*n^2 - (n+1/n)^2 * sin(ev).*sin(ev) + ...
    4*cos(ev).*sqrt(n^2 - sin(ev).*sin(ev));
rho = numerator ./ denominat;


rho = rho.*mask;

