# numerical-computing-scripts
MATLAB scripts from my Numerical Computing class at McGill University (Fall 2025).

## Gaussian Elimination
`lunp.m` performs LU factorization with no pivoting.

`lupp.m` performs LU factorization with pivoting.

`question3a.m` investigates numerical accuracy and conditioning when solving a linear system with a Hilbert matrix. Determing a true x value in the system $Ax = b$ and computing its own x to compare:
- The relative residual $\frac{||b - A x_c||_2}{||A||_2 \ ||x_c||_2}$
- The relative forward error $\frac{||x_c - x_t||_2}{||x_t||_2}$
- The theoretical error bound based on conditioning and machine precision $\varepsilon \ ||A||_2 \ ||A^{-1}||_2$

`question3b.m` solves the same question but $A(1,1)$ of the 8x8 Hilbert matrix is replaced with $10^{-5}$.

## Solving Nonlinear Equations
`newton.m` performs Newton's Method for solving a nonlinear equation.

`steffensen.m` performs Steffensen's Method for solving a nonlinear equation.

`secant.m` performs the Secant Method for solving a nonlinear equation.

`test.m` runs the methods above on:
\
$f(x) = 2x(1 - x^2 + x)\ln(x) - (x^2 - 1), \quad x \in (0, 1]
$
\
with the settings `xtol = 1e-14`, `ftol = 0`, `nmax = 20` s.t. iteration tables are printed at each step.


## Polynomial Interpolation, Spline Interpolation, and Least Squares Approximation
`canada_census.m` uses the natural cubic spline interpolation to interpolate population data from year 1951 to 2016  and then, uses the function to estimate the population for the years 1984 and 2021.

`my_spline.m` is my version of the spline function in MATLAB.

`canada_ls.m` uses the model $y = c_1e^{c_2x}$ with LS approximation on the same population data from above and estimates the population for years 1984 and 2021.