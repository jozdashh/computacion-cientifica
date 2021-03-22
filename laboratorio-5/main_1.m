close all;
clc;

% Las dos ODEs para el punto 1

% Condición inicial: fy1(0) = -1
fy1p = @(t, y) 10 - t;
fy1 = @(t) 10*t - (t^2)/2 - 1;

% Condición inicial: fy2(0) = 1
fy2p = @(t, y) 9*t^2 - 4*t;
fy2 = @(t) 3*t^3 - 2*t^2 + 1;

limite = 30;
h1 = 0.1;
h2 = 0.5;
h3 = 1;

t1 = 0:h1:limite;
t2 = 0:h2:limite;
t3 = 0:h3:limite;

y1 = zeros(1, length(t1));
y2 = zeros(1, length(t2));
y3 = zeros(1, length(t3));
y_real = zeros(1, length(t1));

temp1 = zeros(1, length(t1));
temp2 = zeros(1, length(t2));
temp3 = zeros(1, length(t3));





% Método de Euler

% Función 1
y1(1) = -1;
y2(1) = -1;
y3(1) = -1;
y_real(1) = -1;

for i = 2:length(t1)
    y_real(i) = fy1(t1(i));
end

tic;
for i = 2:length(t1)
    y1(i) = euler(fy1p, t1(i), y1(i-1), h1);
end
time_euler_1_1 = toc;

tic;
for i = 2:length(t2)
    y2(i) = euler(fy1p, t2(i), y2(i-1), h2);
end
time_euler_1_2 = toc;

tic;
for i = 2:length(t3)
    y3(i) = euler(fy1p, t3(i), y3(i-1), h3);
end
time_euler_1_3 = toc;

% plot
fig = figure('units','normalized','position',[1. 1. 1. 1.]);

p1 = subplot(2,2,1);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t1, y1, '.r', 'MarkerSize', 4);
title(p1, "h = 0.1");

p2 = subplot(2,2,2);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t2, y2, '.r', 'MarkerSize', 4);
title(p2, "h = 0.5");

p3 = subplot(2,2,3);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t3, y3, '.r', 'MarkerSize', 4);
title(p3, "h = 1");

p4 = subplot(2,2,4);
plot(t1, y_real, '.g', 'MarkerSize', 3);
title(p4, "Solución analítica, h = 0.1");

print('euler_fig1','-dpng');
close(fig);

% Error
y_real = zeros(1, length(t1));
for i = 2:length(t1)
    y_real(i) = fy1(t1(i));
end
euler_error_1_1 = immse(y_real, y1);

for i = 1:length(t1)
    temp1(i) = abs(y_real(i)-y1(i));
end
euler_std_1_1 = std(temp1);

y_real = zeros(1, length(t2));
for i = 2:length(t2)
    y_real(i) = fy1(t2(i));
end
euler_error_1_2 = immse(y_real, y2);
for i = 1:length(t2)
    temp2(i) = abs(y_real(i)-y2(i));
end
euler_std_1_2 = std(temp2);

y_real = zeros(1, length(t3));
for i = 2:length(t3)
    y_real(i) = fy1(t3(i));
end
euler_error_1_3 = immse(y_real, y3);
for i = 1:length(t3)
    temp3(i) = abs(y_real(i)-y3(i));
end
euler_std_1_3 = std(temp3);


% Función 2
y1(1) = 1;
y2(1) = 1;
y3(1) = 1;

y_real = zeros(1, length(t1));
y_real(1) = 1;

for i = 2:length(t1)
    y_real(i) = fy2(t1(i));
end

tic;
for i = 2:length(t1)
    y1(i) = euler(fy2p, t1(i), y1(i-1), h1);
end
time_euler_2_1 = toc;

for i = 2:length(t1)
    y_real(i) = fy2(t1(i));
end

tic;
for i = 2:length(t2)
    y2(i) = euler(fy2p, t2(i), y2(i-1), h2);
end
time_euler_2_2 = toc;

tic;
for i = 2:length(t3)
    y3(i) = euler(fy2p, t3(i), y3(i-1), h3);
end
time_euler_2_3 = toc;

% plot
fig = figure('units','normalized','position',[1. 1. 1. 1.]);

p1 = subplot(2,2,1);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t1, y1, '.r', 'MarkerSize', 4);
title(p1, "h = 0.1");

p2 = subplot(2,2,2);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t2, y2, '.r', 'MarkerSize', 4);
title(p2, "h = 0.5");

p3 = subplot(2,2,3);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t3, y3, '.r', 'MarkerSize', 4);
title(p3, "h = 1");

p4 = subplot(2,2,4);
plot(t1, y_real, '.g', 'MarkerSize', 3);
title(p4, "Solución analítica, h = 0.1");

print('euler_fig2','-dpng');
close(fig);

% Error
y_real = zeros(1, length(t1));
for i = 2:length(t1)
    y_real(i) = fy2(t1(i));
end
euler_error_2_1 = immse(y_real, y1);
for i = 1:length(t1)
    temp1(i) = abs(y_real(i)-y1(i));
end
euler_std_2_1 = std(temp1);

y_real = zeros(1, length(t2));
for i = 2:length(t2)
    y_real(i) = fy2(t2(i));
end
euler_error_2_2 = immse(y_real, y2);
for i = 1:length(t2)
    temp2(i) = abs(y_real(i)-y2(i));
end
euler_std_2_2 = std(temp2);

y_real = zeros(1, length(t3));
for i = 2:length(t3)
    y_real(i) = fy2(t3(i));
end
euler_error_2_3 = immse(y_real, y3);
for i = 1:length(t3)
    temp3(i) = abs(y_real(i)-y3(i));
end
euler_std_2_3 = std(temp3);





% Método de RK2

% Función 1
y1(1) = -1;
y2(1) = -1;
y3(1) = -1;

y_real = zeros(1, length(t1));
y_real(1) = -1;

for i = 2:length(t1)
    y_real(i) = fy1(t1(i));
end

tic;
for i = 2:length(t1)
    y1(i) = RK2(fy1p, t1(i), y1(i-1), h1);
end
time_RK2_1_1 = toc;

for i = 2:length(t1)
    y_real(i) = fy1(t1(i));
end

tic;
for i = 2:length(t2)
    y2(i) = RK2(fy1p, t2(i), y2(i-1), h2);
end
time_RK2_1_2 = toc;

tic;
for i = 2:length(t3)
    y3(i) = RK2(fy1p, t3(i), y3(i-1), h3);
end
time_RK2_1_3 = toc;

% plot
fig = figure('units','normalized','position',[1. 1. 1. 1.]);

p1 = subplot(2,2,1);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t1, y1, '.r', 'MarkerSize', 4);
title(p1, "h = 0.1");

p2 = subplot(2,2,2);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t2, y2, '.r', 'MarkerSize', 4);
title(p2, "h = 0.5");

p3 = subplot(2,2,3);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t3, y3, '.r', 'MarkerSize', 4);
title(p3, "h = 1");

p4 = subplot(2,2,4);
plot(t1, y_real, '.g', 'MarkerSize', 3);
title(p4, "Solución analítica, h = 0.1");

print('RK2_fig1','-dpng');
close(fig);

% Error
y_real = zeros(1, length(t1));
for i = 2:length(t1)
    y_real(i) = fy1(t1(i));
end
RK2_error_1_1 = immse(y_real, y1);
for i = 1:length(t1)
    temp1(i) = abs(y_real(i)-y1(i));
end
RK2_std_1_1 = std(temp1);

y_real = zeros(1, length(t2));
for i = 2:length(t2)
    y_real(i) = fy1(t2(i));
end
RK2_error_1_2 = immse(y_real, y2);
for i = 1:length(t2)
    temp2(i) = abs(y_real(i)-y2(i));
end
RK2_std_1_2 = std(temp2);

y_real = zeros(1, length(t3));
for i = 2:length(t3)
    y_real(i) = fy1(t3(i));
end
RK2_error_1_3 = immse(y_real, y3);
for i = 1:length(t3)
    temp3(i) = abs(y_real(i)-y3(i));
end
RK2_std_1_3 = std(temp3);



% Función 2
y1(1) = 1;
y2(1) = 1;
y3(1) = 1;

y_real = zeros(1, length(t1));
y_real(1) = -1;

for i = 2:length(t1)
    y_real(i) = fy2(t1(i));
end

tic;
for i = 2:length(t1)
    y1(i) = RK2(fy2p, t1(i), y1(i-1), h1);
end
time_RK2_2_1 = toc;

for i = 2:length(t1)
    y_real(i) = fy2(t1(i));
end

tic;
for i = 2:length(t2)
    y2(i) = RK2(fy2p, t2(i), y2(i-1), h2);
end
time_RK2_2_2 = toc;

tic;
for i = 2:length(t3)
    y3(i) = RK2(fy2p, t3(i), y3(i-1), h3);
end
time_RK2_2_3 = toc;

% plot
fig = figure('units','normalized','position',[1. 1. 1. 1.]);

p1 = subplot(2,2,1);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t1, y1, '.r', 'MarkerSize', 4);
title(p1, "h = 0.1");

p2 = subplot(2,2,2);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t2, y2, '.r', 'MarkerSize', 4);
title(p2, "h = 0.5");

p3 = subplot(2,2,3);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t3, y3, '.r', 'MarkerSize', 4);
title(p3, "h = 1");

p4 = subplot(2,2,4);
plot(t1, y_real, '.g', 'MarkerSize', 3);
title(p4, "Solución analítica, h = 0.1");

print('RK2_fig2','-dpng');
close(fig);

% Error
y_real = zeros(1, length(t1));
for i = 2:length(t1)
    y_real(i) = fy2(t1(i));
end
RK2_error_2_1 = immse(y_real, y1);
for i = 1:length(t1)
    temp1(i) = abs(y_real(i)-y1(i));
end
RK2_std_2_1 = std(temp1);

y_real = zeros(1, length(t2));
for i = 2:length(t2)
    y_real(i) = fy2(t2(i));
end
RK2_error_2_2 = immse(y_real, y2);
for i = 1:length(t2)
    temp2(i) = abs(y_real(i)-y2(i));
end
RK2_std_2_2 = std(temp2);

y_real = zeros(1, length(t3));
for i = 2:length(t3)
    y_real(i) = fy2(t3(i));
end
RK2_error_2_3 = immse(y_real, y3);
for i = 1:length(t3)
    temp3(i) = abs(y_real(i)-y3(i));
end
RK2_std_2_3 = std(temp3);




% Método de RK4

% Función 1
y1(1) = -1;
y2(1) = -1;
y3(1) = -1;
y_real(1) = -1;

for i = 2:length(t1)
    y_real(i) = fy1(t1(i));
end

tic;
for i = 2:length(t1)
    y1(i) = RK4(fy1p, t1(i), y1(i-1), h1);
end
time_RK4_1_1 = toc;

tic;
for i = 2:length(t2)
    y2(i) = RK4(fy1p, t2(i), y2(i-1), h2);
end
time_RK4_1_2 = toc;

tic;
for i = 2:length(t3)
    y3(i) = RK4(fy1p, t3(i), y3(i-1), h3);
end
time_RK4_1_3 = toc;

% plot
fig = figure('units','normalized','position',[1. 1. 1. 1.]);

p1 = subplot(2,2,1);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t1, y1, '.r', 'MarkerSize', 4);
title(p1, "h = 0.1");

p2 = subplot(2,2,2);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t2, y2, '.r', 'MarkerSize', 4);
title(p2, "h = 0.5");

p3 = subplot(2,2,3);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t3, y3, '.r', 'MarkerSize', 4);
title(p3, "h = 1");

p4 = subplot(2,2,4);
plot(t1, y_real, '.g', 'MarkerSize', 3);
title(p4, "Solución analítica, h = 0.1");

print('RK4_fig1','-dpng');
close(fig);

% Error
y_real = zeros(1, length(t1));
for i = 2:length(t1)
    y_real(i) = fy1(t1(i));
end
RK4_error_1_1 = immse(y_real, y1);
for i = 1:length(t1)
    temp1(i) = abs(y_real(i)-y1(i));
end
RK4_std_1_1 = std(temp1);

y_real = zeros(1, length(t2));
for i = 2:length(t2)
    y_real(i) = fy1(t2(i));
end
RK4_error_1_2 = immse(y_real, y2);
for i = 1:length(t2)
    temp2(i) = abs(y_real(i)-y2(i));
end
RK4_std_1_2 = std(temp2);

y_real = zeros(1, length(t3));
for i = 2:length(t3)
    y_real(i) = fy1(t3(i));
end
RK4_error_1_3 = immse(y_real, y3);
for i = 1:length(t3)
    temp3(i) = abs(y_real(i)-y3(i));
end
RK4_std_1_3 = std(temp3);



% Función 2
y1(1) = 1;
y2(1) = 1;
y3(1) = 1;
y_real(1) = 1;

for i = 2:length(t1)
    y_real(i) = fy2(t1(i));
end

tic;
for i = 2:length(t1)
    y1(i) = RK4(fy2p, t1(i), y1(i-1), h1);
end
time_RK4_2_1 = toc;

tic;
for i = 2:length(t2)
    y2(i) = RK4(fy2p, t2(i), y2(i-1), h2);
end
time_RK4_2_2 = toc;

tic;
for i = 2:length(t3)
    y3(i) = RK4(fy2p, t3(i), y3(i-1), h3);
end
time_RK4_2_3 = toc;

% plot
fig = figure('units','normalized','position',[1. 1. 1. 1.]);

p1 = subplot(2,2,1);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t1, y1, '.r', 'MarkerSize', 4);
title(p1, "h = 0.1");

p2 = subplot(2,2,2);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t2, y2, '.r', 'MarkerSize', 4);
title(p2, "h = 0.5");

p3 = subplot(2,2,3);
plot(t1, y_real, '.g', 'MarkerSize', 3);
hold on;
plot(t3, y3, '.r', 'MarkerSize', 4);
title(p3, "h = 1");

p4 = subplot(2,2,4);
plot(t1, y_real, '.g', 'MarkerSize', 3);
title(p4, "Solución analítica, h = 0.1");

print('RK4_fig2','-dpng');
close(fig);

% Error
y_real = zeros(1, length(t1));
for i = 2:length(t1)
    y_real(i) = fy2(t1(i));
end
RK4_error_2_1 = immse(y_real, y1);
for i = 1:length(t1)
    temp1(i) = abs(y_real(i)-y1(i));
end
RK4_std_2_1 = std(temp1);

y_real = zeros(1, length(t2));
for i = 2:length(t2)
    y_real(i) = fy2(t2(i));
end
RK4_error_2_2 = immse(y_real, y2);
for i = 1:length(t2)
    temp2(i) = abs(y_real(i)-y2(i));
end
RK4_std_2_2 = std(temp2);

y_real = zeros(1, length(t3));
for i = 2:length(t3)
    y_real(i) = fy2(t3(i));
end
RK4_error_2_3 = immse(y_real, y3);
for i = 1:length(t3)
    temp3(i) = abs(y_real(i)-y3(i));
end
RK4_std_2_3 = std(temp3);