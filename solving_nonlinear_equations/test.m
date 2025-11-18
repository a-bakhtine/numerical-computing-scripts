% Run steffensen, newton, secant methods on
%   f(x) = 2x(1 - x^2 + x)ln(x) - (x^2-1)   over (0,1]
% using xtol=1e-14, ftol=0, nmax=20, printing iteration tables

% problem's data
f  = @(x) 2.*x.*(1 - x.^2 + x).*log(x) - (x.^2 - 1);
fd = @(x) (2 + 4.*x - 6.*x.^2).*log(x) + 2 - 2.*x.^2;

xtol = 1e-14;
ftol = 0;
nmax = 20;

x0_list = [0.2 0.3 0.4 0.5];
x0x1_pairs = [0.1 0.2; 0.2 0.3; 0.3 0.4; 0.4 0.5];

% steffensen's method
fprintf('STEFFENSEN METHOD')
for x0 = x0_list
    fprintf('\nx0 = %.1f\n', x0);
    steffensen(f, x0, xtol, ftol, nmax, 1);
end

% newton's method
fprintf('\nNEWTONS METHOD')
for x0 = x0_list
    fprintf('\nx0 = %.1f\n', x0);
    newton(f, fd, x0, xtol, ftol, nmax, 1);
end

% secant method
fprintf('\nSECANT')
for k = 1:size(x0x1_pairs,1)
    x0 = x0x1_pairs(k,1); x1 = x0x1_pairs(k,2);
    fprintf('\n(x0,x1) = (%.1f, %.1f)\n', x0, x1);
    secant(f, x0, x1, xtol, ftol, nmax, 1);
end

