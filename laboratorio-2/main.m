close all
clear all
clc

orden = 2;
t = [-1, -0.5, 0, 0.5, 1]';
y = [1, 0.5, 0, 0.5, 2]';

x1 = normal_equations(orden, t, y);
x2 = householder(orden, t, y);

ticks = (-1:0.01:1)';
aprox_y1 = zeros(length(ticks), 1);
aprox_y2 = zeros(length(ticks), 1);

for i = 1:(orden+1)
    aprox_y1 = aprox_y1 + (x1(i)*ticks.^(i-1));
    aprox_y2 = aprox_y2 + (x2(i)*ticks.^(i-1));
end

% Plot para solución por ecuaciones normales
plot(t, y, '.r', 'MarkerSize', 13);
hold on;
plot(ticks, aprox_y1, 'g');

figure;

% Plot para solución por transformaciones Householder
plot(t, y, '.b', 'MarkerSize', 13);
hold on;
plot(ticks, aprox_y2, 'm');
