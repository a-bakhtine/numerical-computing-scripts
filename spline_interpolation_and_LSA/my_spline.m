function yy = spline(x, y, xx)
% input x:  a vector (n+1)-vector of nodes x_0,...,x_n in increasing order
%       y:  a vector (n+1)-vector of data values y_0,...,y_n
%       xx: a vector at which the natural cubic spline S will be evaluated
% output yy:    a vector of the same size as xx s.t. if S(x) is the 
%               natural cubic spline interpolt through (x_i,y_i),
%               then yy(i) = S(xx(i)) for i = 1:size(xx)

% col vectors
x = x(:);
y = y(:);
n = length(x) - 1;

% apply algorithm as seen in class
% setup h_i and g_i
h = zeros(n,1);
g = zeros(n,1);
for i = 1:n
    h(i) = x(i+1) - x(i);
    g(i) = (y(i+1) - y(i)) / h(i);
end

% forward elim
u = zeros(n-1,1);
v = zeros(n-1,1);

u(1) = 2*(h(1) + h(2));
v(1) = 3*(g(2) - g(1));

for i = 2:n-1
    mult = h(i) / u(i-1);
    u(i) = 2*(h(i) + h(i+1)) - mult*h(i);
    v(i) = 3*(g(i+1) - g(i)) - mult*v(i-1);
end

% back sub - c_i
c = zeros(n+1,1);
c(n+1) = 0;
for i = n:-1:2
    c(i) = (v(i-1) - h(i)*c(i+1)) / u(i-1);
end
c(1) = 0;


% a_i, b_i, d_i
a = zeros(n,1);
b = zeros(n,1);
d = zeros(n,1);
for i = 1:n
    a(i) = y(i);
    b(i) = g(i) - h(i)*(2*c(i) + c(i+1))/3;
    d(i) = (c(i+1) - c(i)) / (3*h(i));
end

% S at xx 
yy = zeros(size(xx));
for k = 1:length(xx)
    xq = xx(k);
    i = 1;
    while (i < n) && (xq > x(i+1))
        i = i + 1;
    end
    dx = xq - x(i);
    yy(k) = a(i) + dx*(b(i) + dx*(c(i) + dx*d(i)));
end

end






