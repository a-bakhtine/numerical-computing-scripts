function r = newton(f,fd,x,xtol,ftol,nmax,display)
% Newton's method for solving f(x)=0.
% r = newton(f,fd,x,xtol,ftol,n_max,display)
% input: 
%   f is the handle of the function f(x).
%   fd is the handle of the derivative f'(x).
%   x is the initial point
%   xtol and ftol are termination tolerances
%   nmax is the maximum number of iterations
%   display = 1 if step-by-step display is desired,
%           = 0 otherwise
% output: 
%   r is the computed root of f(x)=0

n = 0;
fx = f(x); % f is either a string name or the handle of f(x)
if display
    disp('  n                 x_n                     f(x_n)            |step|')
    disp('-------------------------------------------------------------------------------')
    fprintf('%3d  % .16e   % .16e          %s\n', n, x, fx, '   -   ')
end
if abs(fx) <= ftol, r = x; return, end

for n = 1:nmax
    fdx = fd(x);

    % can't compute a valid step
    if ~isfinite(fdx) || fdx == 0
        r = x; return
    end

    d = fx/fdx;
    x = x - d;
    x  = min(1, max(eps, x));  % ensure still in interval

    fx = f(x);
    if display, fprintf('%3d  % .16e   % .16e   % .3e\n', n, x, fx, abs(d)), end
    if abs(d) <= xtol || abs(fx) <= ftol
        r = x;
        return
    end
end
r = x;
end
