% ODEs DE PRIMER ORDEN %

% % Multipaso 2: ODE 1
f = @(t,y) 10-t;
y = @(t) 10.*t-(t.^2)./2 - 1;
y0 = -1;
h=[0.1 0.5 1];
n = 100;
i = 1;
figure(1);
titles = ["M�todo multi-paso 2 ODE 1, h=0.1","M�todo multi-paso 2 ODE 1, h=0.5","M�todo multi-paso 2 ODE 1, h=1"];

err_multi21 = [];
std_multi21 = [];
ecm_multi21 = [];
time = [];
for pl = 221:223
    tic;
    [yk, tk] = twoStep(f,0,y0,h(i),30);
    time = [time; toc];
    yt = feval(y,tk);
    
    subplot(pl);
    a1 = plot(tk,yt,'r'); M1 = 'Analytic';
    hold on;
    
    a2 = plot(tk,yk,'.g'); M2 = 'twoStep';
    xlabel('x');
    ylabel('y');
    title(titles(pl-220));
    legend([a1;a2], M1,M2);
    hold off;
    
    prom = mean(abs(yt-yk));
    err_multi21 = [err_multi21; prom];
    std_multi21 = [std_multi21; std(abs(yt-yk))];
    ecm_multi21 = [ecm_multi21; immse(yt,yk)];
    
    i = i + 1;
end
disp(err_multi21);
disp(std_multi21);
disp(ecm_multi21);
disp(time);


% % Multipaso 2: ODE 2
f = @(t,y) 9.*t.^2 - 4.*t;
y = @(t) 3.*t.^3 - 2.*t.^2 + 1;
y0 = 1;
i = 1;
figure(2);
titles = ["M�todo multi-paso 2 ODE 2, h=0.1","M�todo multi-paso 2 ODE 2, h=0.5","M�todo multi-paso 2 ODE 2, h=1"];

err_multi21 = [];
std_multi21 = [];
ecm_multi21 = [];
time = [];
for pl = 221:223
    tic;
    [yk, tk] = twoStep(f,0,y0,h(i),30);
    time = [time; toc];
    yt = feval(y,tk);
    
    subplot(pl);
    a1 = plot(tk,yt,'r'); M1 = 'Analytic';
    hold on;
    
    a2 = plot(tk,yk,'.g'); M2 = 'twoStep';
    xlabel('x');
    ylabel('y');
    title(titles(pl-220));
    legend([a1;a2], M1,M2);
    hold off;
    
    prom = mean(abs(yt-yk));
    err_multi21 = [err_multi21; prom];
    std_multi21 = [std_multi21; std(abs(yt-yk))];
    ecm_multi21 = [ecm_multi21; immse(yt,yk)];
    
    i = i + 1;
end
disp(err_multi21);
disp(std_multi21);
disp(ecm_multi21);
disp(time);


% % Multipaso 4: ODE 1
f = @(t,y) 10-t;
y = @(t) 10.*t-(t.^2)./2 - 1;
y0 = -1;
i = 1;
figure(3);
titles = ["M�todo multi-paso 4 ODE 1, h=0.1","M�todo multi-paso 4 ODE 1, h=0.5","M�todo multi-paso 4 ODE 1, h=1"];

err_multi21 = [];
std_multi21 = [];
ecm_multi21 = [];
time = [];
for pl = 221:223
    [yk, tk] = adamsBash(f,0,y0,h(i),30);
    tic;
    yt = feval(y,tk);
    time = [time; toc];
    
    subplot(pl);
    a1 = plot(tk,yt,'r'); M1 = 'Analytic';
    hold on;
    
    a2 = plot(tk,yk,'.g'); M2 = 'adamsBash';
    xlabel('x');
    ylabel('y');
    title(titles(pl-220));
    legend([a1;a2], M1,M2);
    hold off;
    
    prom = mean(abs(yt-yk));
    err_multi21 = [err_multi21; prom];
    std_multi21 = [std_multi21; std(abs(yt-yk))];
    ecm_multi21 = [ecm_multi21; immse(yt,yk)];
    
    i = i + 1;
end
disp(err_multi21);
disp(std_multi21);
disp(ecm_multi21);
disp(time);


% % Multipaso 4: ODE 2
f = @(t,y) 9.*t.^2 - 4.*t;
y = @(t) 3.*t.^3 - 2.*t.^2 + 1;
y0 = 1;
i = 1;
figure(4);
titles = ["M�todo multi-paso 4 ODE 2, h=0.1","M�todo multi-paso 4 ODE 2, h=0.5","M�todo multi-paso 4 ODE 2, h=1"];

err_multi21 = [];
std_multi21 = [];
ecm_multi21 = [];
time = [];
for pl = 221:223
    tic;
    [yk, tk] = adamsBash(f,0,y0,h(i),30);
    time = [time; toc];
    yt = feval(y,tk);
    
    subplot(pl);
    a1 = plot(tk,yt,'r'); M1 = 'Analytic';
    hold on;
    
    a2 = plot(tk,yk,'.g'); M2 = 'adamsBash';
    xlabel('x');
    ylabel('y');
    title(titles(pl-220));
    legend([a1;a2], M1,M2);
    hold off;
    
    prom = mean(abs(yt-yk));
    err_multi21 = [err_multi21; prom];
    std_multi21 = [std_multi21; std(abs(yt-yk))];
    ecm_multi21 = [ecm_multi21; immse(yt,yk)];
    
    i = i + 1;
end
disp(err_multi21);
disp(std_multi21);
disp(ecm_multi21);
disp(time);


% ODEs DE SEGUNDO ORDEN %

% % Diferencias finitas: ODE 1
f = @(t) 6.*t;
y = @(t) t.^3;
t0 = 0;
tn = 1;
y0 = 0;
y1 = 1;
r = tn-t0;
m = [100,50,30];
i = 1;
figure(5);
titles = ["M�todo diferencias finitas ODE 1, m=100","M�todo diferencias finitas ODE 1, m=50","M�todo diferencias finitas ODE 1, m=30"];

err_multi21 = [];
std_multi21 = [];
ecm_multi21 = [];
time = [];
for pl = 221:223
    tic;
    [yk, tk] = finDiff(f,t0,tn,y0,y1,m(i));
    time = [time; toc];
    yt = feval(y,tk);
    
    subplot(pl);
    a1 = plot(tk,yt,'r'); M1 = 'Analytic';
    hold on;
    
    a2 = plot(tk,yk,'.g'); M2 = 'finDiff';
    xlabel('x');
    ylabel('y');
    title(titles(pl-220));
    legend([a1;a2], M1,M2);
    hold off;
    
    prom = mean(abs(yt-yk));
    err_multi21 = [err_multi21; prom];
    std_multi21 = [std_multi21; std(abs(yt-yk))];
    ecm_multi21 = [ecm_multi21; immse(yt,yk)];
    
    i = i + 1;
end
disp(err_multi21);
disp(std_multi21);
disp(ecm_multi21);
disp(time);


% % Diferencias finitas: ODE 2
f = @(t) sin(t);
y = @(t) -sin(t)+1.6366.*t;
t0 = 0;
tn = pi/2;
y0 = 0;
y1 = 1.5708;
m = [100,50,30];
i = 1;
figure(6);
titles = ["M�todo diferencias finitas ODE 1, m=100","M�todo diferencias finitas ODE 1, m=50","M�todo diferencias finitas ODE 1, m=30"];

err_multi21 = [];
std_multi21 = [];
ecm_multi21 = [];
time = [];
for pl = 221:223
    tic;
    [yk, tk] = finDiff(f,t0,tn,y0,y1,m(i));
    time = [time; toc];
    yt = feval(y,tk);
    
    subplot(pl);
    a1 = plot(tk,yt,'r'); M1 = 'Analytic';
    hold on;
    
    a2 = plot(tk,yk,'.g'); M2 = 'finDiff';
    xlabel('x');
    ylabel('y');
    title(titles(pl-220));
    legend([a1;a2], M1,M2);
    hold off;
    
    prom = mean(abs(yt-yk));
    err_multi21 = [err_multi21; prom];
    std_multi21 = [std_multi21; std(abs(yt-yk))];
    ecm_multi21 = [ecm_multi21; immse(yt,yk)];
    
    i = i + 1;
end
disp(err_multi21);
disp(std_multi21);
disp(ecm_multi21);
disp(time);


% % Elementos finitos: ODE 1
f = @(t) 6.*t;
y = @(t) t.^3;
t0 = 0;
tn = 1;
y0 = 0;
y1 = 1;
m = [30,15,7];
t = linspace(t0,tn);
i = 1;
figure(7);
titles = ["M�todo diferencias finitas ODE 1, m=30","M�todo diferencias finitas ODE 1, m=15","M�todo diferencias finitas ODE 1, m=7"];

err_multi21 = [];
std_multi21 = [];
ecm_multi21 = [];
time = [];
for pl = 221:223
    tic;
    x = finElm(f,t0,tn,y0,y1,m(i));
    time = [time; toc];
    yt = feval(y,t);
    poly = flip(x);
    index = find(poly ~= 0, 1, 'first');
    poly = poly(index:end);
    poly = polyval(poly,t);
    
    subplot(pl);
    a1 = plot(t,yt,'r'); M1 = 'Analytic';
    hold on;
    
    a2 = plot(t,poly,'.g'); M2 = 'finElm';
    xlabel('x');
    ylabel('y');
    title(titles(pl-220));
    legend([a1;a2], M1,M2);
    hold off;
    
    prom = mean(abs(yt-poly));
    err_multi21 = [err_multi21; prom];
    std_multi21 = [std_multi21; std(abs(yt-poly))];
    ecm_multi21 = [ecm_multi21; immse(yt,poly)];
    
    i = i + 1;
end
disp(err_multi21);
disp(std_multi21);
disp(ecm_multi21);
disp(time);


% Elementos finitos: ODE 1
f = @(t) sin(t);
y = @(t) -sin(t)+1.6366.*t;
t0 = 0;
tn = pi/2;
y0 = 0;
y1 = 1.5708;
m = [30,15,7];
t = linspace(t0,tn);
i = 1;
figure(8);
titles = ["M�todo diferencias finitas ODE 1, m=30","M�todo diferencias finitas ODE 1, m=15","M�todo diferencias finitas ODE 1, m=7"];

err_multi21 = [];
std_multi21 = [];
ecm_multi21 = [];
time = [];
for pl = 221:223
    tic;
    x = finElm(f,t0,tn,y0,y1,m(i));
    time = [time; toc];
    yt = feval(y,t);
    poly = flip(x);
    index = find(poly ~= 0, 1, 'first');
    poly = poly(index:end);
    poly = polyval(poly,t);
    
    subplot(pl);
    a1 = plot(t,yt,'r'); M1 = 'Analytic';
    hold on;
    
    a2 = plot(t,poly,'.g'); M2 = 'finElm';
    xlabel('x');
    ylabel('y');
    title(titles(pl-220));
    legend([a1;a2], M1,M2);
    hold off;
    
    prom = mean(abs(yt-poly));
    err_multi21 = [err_multi21; prom];
    std_multi21 = [std_multi21; std(abs(yt-poly))];
    ecm_multi21 = [ecm_multi21; immse(yt,poly)];
    
    i = i + 1;
end
disp(err_multi21);
disp(std_multi21);
disp(ecm_multi21);
disp(time);