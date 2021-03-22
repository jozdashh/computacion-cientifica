close all;
clear all;
clc;

%t = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]';%, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46]';
%y = [1, 2, 2, 3, 3, 3, 5, 5, 12, 17, 23, 43, 63, 79, 107, 127, 161, 225, 270]';%, 335, 470, 681, 883, 1038, 1195, 1359, 1497, 1686, 1865, 2056, 2199, 2375, 2512, 2594, 2677, 2761, 2837, 2947, 3052, 3244, 3330, 3414, 3542, 3590, 3616, 3621]';
%t = [0 2 6 8 10]';
%y = [0 1.5 1.5 1 2]';
t = [0, 2, 4]';
y = [0, 4, 6]';
t2 = [1,3,5];
y2 = [1,3,4];
n = size(t,1)-1;

x = linspace(t(1),t(end));

sol_1 = inter_pol(n,t,y);
y1 = polyval(flip(sol_1), x);
plot(t, y, '.r', 'MarkerSize', 13);
hold on;
plot(x, y1, 'g');
figure;


sol_11 = polyfit(t,y,n)';
y11 = polyval(sol_11, x);
plot(t, y, '.r', 'MarkerSize', 13);
hold on;
plot(x, y11, 'g');
figure;


sol_2 = inter_newton(n,t,y);
y2 = zeros(length(x), 1);
y2 = y2 + sol_2(1)*(x'.^0);
for i = 2:(n+1)
    prod = 1;
    for j = 1:(i-1)
        prod = prod.*(x' - t(j));
    end
    y2 = y2 + sol_2(i)*prod;
end
plot(t, y, '.b', 'MarkerSize', 13);
hold on;
plot(x, y2, 'm'); 
figure;


sol_3 = piecewise_lin_inter(t,y);
plot(t, y, '.b', 'MarkerSize', 13);
hold on;
plot(x, sol_3', 'c');
