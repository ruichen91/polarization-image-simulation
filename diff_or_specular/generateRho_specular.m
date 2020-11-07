function rho = generateRho_specular(ev, mask, n)

[rows, cols] = size(ev);
for i = 1:rows
    for j = 1:cols
        ev_temp = ev(i,j);
        if isreal(ev_temp)
            numer = 2*sin(ev_temp)*sin(ev_temp)*cos(ev_temp)*sqrt(n*n-sin(ev_temp)*sin(ev_temp));
            denom = n*n - sin(ev_temp)*sin(ev_temp) - n*n*sin(ev_temp)*sin(ev_temp) + ...
                2*sin(ev_temp)*sin(ev_temp)*sin(ev_temp)*sin(ev_temp);
            rho(i,j) = numer/denom;
        end
    end
end
rho = rho.*mask;
% 
% 
% numerator = 2 * sin(ev).*sin(ev) .* cos(ev) .* sqrt(n^2 - sin(ev).*sin(ev));
% denominat = n^2 - sin(ev).*sin(ev) - n^2 * sin(ev).*sin(ev) + ...
%     2*sin(ev).*sin(ev).*sin(ev).*sin(ev);
% 
% rho = numerator ./ denominat;
% rho = rho.*mask;

