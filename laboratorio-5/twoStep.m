function [yk, tk] = twoStep(f,t0,y0,h,tf)
    %n = n - 1;
    %n = ceil((tf-t0)/h);
    %tk = (t0 + (0:n)*h)';
    tk = (t0:h:tf)';
    n = length(tk);
    yk = zeros(n,1);
    yk(1) = y0;
    if n > 0
        % Aplicar método de Euler para calcular y1
        yk(2) = y0 + feval(f,t0,y0) * h;
        if n > 1
            for k = 2:n-1
                yk(k+1) = yk(k) + (1/2)*(3* feval(f,tk(k),yk(k)) - feval(f,tk(k-1),yk(k-1))) * h;
            end
        end
    end
end