close all;
clc;

% Las dos funciones para probar los métodos de derivación
f1 = @(x) log(x) + x^5 + 4*(x^2);
f1_der = @(x) (1/x) + 5*(x^4) + 8*x; % Derivada analítica
f1_der2 = @(x) (-(1/(x^2))) + 20*(x^3) + 8; % Segunda derivada analítica

f2 = @(x) exp(-x) + sin(x) + 3*x;
f2_der = @(x) -exp(-x) + cos(x) + 3; % Derivada analítica
f2_der2 = @(x) exp(-x) + cos(x); % Segunda derivada analítica


% Las dos funciones para probar los métodos de integración
f3 = @(x) exp(-2*x) + cos(x);
f3_intg = @(x) -(1/2)*exp(-2*x) + sin(x); % Integral analítica

f4 = @(x) (1/x) + sin(x);
f4_intg = @(x) log(abs(x)) - cos(x); % Integral analítica


% 1. Métodos de derivación
rango = linspace(10, 110, 100);
h = 0.001;

% Aproximaciones de orden 1
    tic;
    aprox_1 = arrayfun(@(y) dif_adelante(f1, h, y), rango);
    time_1 = toc;
    
    tic
    aprox_2 = arrayfun(@(y) dif_atras(f1, h, y), rango);
    time_2 = toc;

    tic
    aprox_3 = arrayfun(@(y) dif_adelante(f2, h, y), rango);
    time_3 = toc;
    
    tic
    aprox_4 = arrayfun(@(y) dif_atras(f2, h, y), rango);
    time_4 = toc;

    % Aproximaciones de orden 2
    tic;
    aprox_5 = arrayfun(@(y) dif_centrada(f1, h, y), rango);
    time_5 = toc;
    
    tic;
    aprox_6 = arrayfun(@(y) seg_derivada(f1, h, y), rango);
    time_6 = toc;

    tic;
    aprox_7 = arrayfun(@(y) dif_centrada(f2, h, y), rango);
    time_7 = toc;
    
    tic;
    aprox_8 = arrayfun(@(y) seg_derivada(f2, h, y), rango);
    time_8 = toc;

    % Cálculo de valores anaĺiticos
    tic;
    exact_der1 = arrayfun(f1_der, rango);
    time_exact1 = toc;
    
    tic;
    exact_der1_2 = arrayfun(f1_der2, rango);
    time_exact1_2 = toc;
    
    tic;
    exact_der2 = arrayfun(f2_der, rango);
    time_exact2 = toc;
    
    tic;
    exact_der2_2 = arrayfun(f2_der2, rango);
    time_exact2_2 = toc;
    

    % 1.2 Calculos de error
    error_1 = immse(exact_der1, aprox_1);
    error_2 = immse(exact_der1, aprox_2);

    error_3 = immse(exact_der2, aprox_3);
    error_4 = immse(exact_der2, aprox_4);

    error_5 = immse(exact_der1, aprox_5);
    error_6 = immse(exact_der1_2, aprox_6);

    error_7 = immse(exact_der2, aprox_7);
    error_8 = immse(exact_der2_2, aprox_8);

    % 1.3 Gráficas
    
    % Diferencias centrada
    fig = figure('units','normalized','position',[1. 1. 1. 1.]);
    
    p1 = subplot(2,2,1);
    plot(rango, exact_der1, '.b', 'MarkerSize', 5);
    title(p1, "f_1'(x)");
    
    p2 = subplot(2,2,2);
    plot(rango, aprox_1, '.r', 'MarkerSize', 5);
    title(p2, "f_1'(x) aprox. por dif\_adelante.m");
    
    p3 = subplot(2,2,3);
    plot(rango, aprox_2, '.g', 'MarkerSize', 5);
    title(p3, "f_1'(x) aprox. por dif\_atras.m");
    
    p4 = subplot(2,2,4);
    plot(rango, aprox_5, '.c', 'MarkerSize', 5);
    title(p4, "f_1'(x) aprox. por dif\_centrada.m");
    
    print('fig1','-dpng');
    close(fig);
    
    % Segunda derivada
    fig = figure('units','normalized','position',[1. 1. 1. 1.]);
    
    p1 = subplot(1,2,1);
    plot(rango, exact_der1_2, '.b', 'MarkerSize', 5);
    title(p1, "f_1''(x)");
    
    p2 = subplot(1,2,2);
    plot(rango, aprox_6, '.r', 'MarkerSize', 5);
    title(p2, "f_1''(x) aprox. por seg\_derivada.m");
    
    print('fig2','-dpng');
    close(fig);
    
    
% 2. Métodos de integración
    a = 0.1;
    b = 2.0;

    % Cuadratura simple
    tic;
    aprox_1b = rectangular(f3, a, b);
    time_1b = toc;
    tic;
    aprox_2b = trapezoide(f3, a, b);
    time_2b = toc;
    tic;
    aprox_3b = simpson(f3, a, b);
    time_3b = toc;

    tic;
    aprox_4b = rectangular(f4, a, b);
    time_4b = toc;
    tic;
    aprox_5b = trapezoide(f4, a, b);
    time_5b = toc;
    tic;
    aprox_6b = simpson(f4, a, b);
    time_6b = toc;

    % Cuadratura compuesta
    tic;
    aprox_7b = rectangular_comp(f3, a, b, 500);
    time_7b = toc;
    tic;
    aprox_8b = trapezoide_comp(f3, a, b, 500);
    time_8b = toc;
    tic;
    aprox_9b = simpson_comp(f3, a, b, 500);
    time_9b = toc;

    tic;
    aprox_10b = rectangular_comp(f4, a, b, 500);
    time_10b = toc;
    tic;
    aprox_11b = trapezoide_comp(f4, a, b, 500);
    time_11b = toc;
    tic;
    aprox_12b = simpson_comp(f4, a, b, 500);
    time_12b = toc;

    % Cálculo de valores anaĺiticos
    tic;
    exact_intg1 = f3_intg(b)-f3_intg(a);
    time_exact1b = toc;
    
    tic;
    exact_intg2 = f4_intg(b)-f4_intg(a);
    time_exact2b = toc;

    % 2.2 Calculos de error
    error_1b = immse(exact_intg1, aprox_1b);
    error_2b = immse(exact_intg1, aprox_2b);
    error_3b = immse(exact_intg1, aprox_3b);

    error_4b = immse(exact_intg2, aprox_4b);
    error_5b = immse(exact_intg2, aprox_5b);
    error_6b = immse(exact_intg2, aprox_6b);

    error_7b = immse(exact_intg1, aprox_7b);
    error_8b = immse(exact_intg1, aprox_8b);
    error_9b = immse(exact_intg1, aprox_9b);

    error_10b = immse(exact_intg2, aprox_10b);
    error_11b = immse(exact_intg2, aprox_11b);
    error_12b = immse(exact_intg2, aprox_12b);