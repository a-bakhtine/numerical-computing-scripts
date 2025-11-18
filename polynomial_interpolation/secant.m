function r = secant(f, x0, x1, xtol, ftol, nmax, display)
% Secant method for solving f(x)=0.
% r = secant(f, x0, x1, xtol, ftol, nmax, display)
% input:
%   f is the handle of the function f(x)
%   x0,x1 are the initial points
%   xtol and ftol are termination tolerances
%   nmax is the maximum number of iterations
%   display = 1 if step-by-step display is desired,
%           = 0 otherwise
% output: 
%   r is the computed root of f(x)=0

% essentially directly applied algorithm provided in notes

n  = 0;
f0 = f(x0);
f1 = f(x1);

if display
    disp('  n                 x_n                     f(x_n)            |step|')
    disp('-------------------------------------------------------------------------------')
    fprintf('%3d  % .16e   % .16e          %s\n', n, x0, f0, '   -   ')
    fprintf('%3d  % .16e   % .16e   % .3e\n', n+1, x1, f1, abs(x1 - x0))
end

% exit early if second point already satisfies ftol
if abs(f1) <= ftol, r=x1; return, end

for n = 1:nmax
    denom = (f1 - f0);

    % can't compute a secant step
    if ~isfinite(denom) || denom == 0 
        r = x1;
        return
    end
    d  = ((x1 - x0) * f1)/denom;
    x0 = x1;
    f0 = f1;
    x1 = x1 - d;
    x1 = min(1, max(eps, x1)); % ensure still in interval

    f1 = f(x1);
    if display
        fprintf('%3d  % .16e   % .16e   % .3e\n', n+1, x1, f1, abs(d))
    end

    % check if r found
    if abs(d) <= xtol || abs(f1) <= ftol
        r = x1;
        return
    end
end
r = x1;
end
