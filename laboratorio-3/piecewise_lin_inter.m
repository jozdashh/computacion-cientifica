function [ pol ] = piecewise_lin_inter(t,y)
    n = size(t,1);
    u = linspace(t(1),t(end),100)';
    [k,k] = histc(u,t);     %Se usa para saber en qué segmento caen los
                            %puntos de u en la recta. Guarda los índices
                            %que lleva al bin en t.
    k(k == n) = n-1;
    %x = (u-t(k)) ./ (t(k+1) - t(k));
    %pol = (1-x) .* y(k) + x .* y(k+1);
    b = y(k);
    x = (y(k+1)-y(k)) ./ (t(k+1)-t(k));
    a = u - t(k);
    pol = b + (a .* x);
end