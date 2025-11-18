% all canada census data
x_all = (1951:5:2021)';  
y_all = [14.009 16.081 18.238 20.015 21.568 23.450 ...
     24.343 26.101 28.031 29.611 31.021 31.613 ...
     33.477 35.152 36.992]';
n_all = length(x_all);

% only use 1951–2016 for the spline
x = x_all(1:n_all-1);   
y = y_all(1:n_all-1);

% plot 15 given points
plot(x_all, y_all, 'bo');
title('Canadian Population - Natural Cubic Spline');
xlabel('Year');
ylabel('Population - Millions');
disp('Press any key to continue');
pause;

% evaluate the natural cubic spline from 1951 to 2016
% and plot the results
hold on
xx = 1951:2016;
Sxx = my_spline(x, y, xx);
plot(xx, Sxx, 'r-');

% evaluate S at 1984 and 2021 and plot results
z84 = my_spline(x,y,1984);
z21 = my_spline(x,y,2021);
plot(1984, z84, 'ks', 'MarkerFaceColor', 'r');
plot(2021, z21,'ks', 'MarkerFaceColor', 'r');
text(1984,z84-1,num2str(z84));
text(2021,z21-1,num2str(z21));

hold off