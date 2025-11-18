function r = steffensen(f, x, xtol, ftol, nmax, display)
% Steffensen's method for solving f(x)=0
% r = steffensen(f, x, xtol, ftol, nmax, display)
% input:
%   f is the handle of the function f(x)
%   x is the initial point
%   xtol and ftol are termination tolerances 
%   nmax is the maximum number of iterations
%   display = 1 if step-by-step display is desired,
%           = 0 otherwise
% output:
%   r is the computed root of f(x)=0

n  = 0;
fx = f(x);
if display
    disp('  n                 x_n                     f(x_n)            |step|')
    disp('-------------------------------------------------------------------------------')
    fprintf('%3d  % .16e   % .16e          %s\n', n, x, fx, '   -   ');
end
if abs(fx) <= ftol, r = x; return, end

for n = 1:nmax
    fx = f(x);
    if fx == 0, r = x; return, end

    % calculating g(x_n)
    xp = x + fx; % x_n + f(x_n)
    fxp = f(xp); % f(x_n + f(x_n))
    g = (fxp - fx) / fx; % (f(x_n+f(x_n)) - f(x_n)) / f(x_n)

    % can't compute a valid step
    if ~isfinite(g) || g == 0
        r = x;
        return
    end

    d = fx / g; % step = f(x_n)/g(x_n)  
    x = x - d; % x_(n+1) = x_n - f(x_n)/g(x-n)
    x  = min(1, max(eps, x));  % ensure still in interval

    fx = f(x);

    if display
        fprintf('%3d  % .16e   % .16e   % .3e\n', n, x, fx, abs(d))
    end

    % check if r found
    if abs(d) <= xtol || abs(fx) <= ftol
        r = x;
        return
    end
end
r = x;
end
