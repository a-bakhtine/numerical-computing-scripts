function question3b

% define vars
A = hilb(8);
A2 = norm(A,2);
eps_cond = eps*cond(A);    % ε ||A||_2 ||A^{-1}||_2

% only need to factor once bc A is fixed
[L_np, U_np] = lunp(A);
[L,U,P] = lupp(A);

% print machine epsilon and solve eps_cond because its the same every run
fprintf('eps = %e | eps*cond2(A) = %e\n', eps, eps_cond);

for t = 1:10
    x_t = randn(8,1); % true solution x
    b = A*x_t;

    % lunp.m used to find x_c (computed sol) and following calculations
    x_lunp = U_np \ (L_np \ b);
    rr_lunp = norm(b - A*x_lunp,2) / (A2*norm(x_lunp,2));
    re_lunp = norm(x_lunp - x_t,2) / norm(x_t,2);
    
    % lupp.m used to find x_c (computed sol) and following calculations
    x_lupp  = U \ (L \ (P*b));
    rr_lupp = norm(b - A*x_lupp,2) / (A2*norm(x_lupp,2));
    re_lupp = norm(x_lupp - x_t,2) / norm(x_t,2);
    
    
    % output
    fprintf('RUN %d\n', t);
    fprintf('LUPP : rel residual = %e | rel error = %e\n', rr_lupp, re_lupp);
    fprintf('LUNP : rel residual = %e | rel error = %e\n\n', rr_lunp, re_lunp);
end
end
