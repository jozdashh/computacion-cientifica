%  Referencia: https://en.wikipedia.org/wiki/Linear_multistep_method
function [yk, tk] = adamsBash(f,t0,y0,h,tf)
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
            yk(3) = yk(2) + h * ( (3/2)*feval(f,tk(2),yk(2)) - (1/2)*feval(f,tk(1),yk(1)) );
            if n > 2
                yk(4) = yk(3) + h * ( (23/12)*feval(f,tk(3),yk(3)) - (16/12)*feval(f,tk(2),yk(2)) + (5/12)*feval(f,tk(1),yk(1)) );
                if n > 3
                    for k = 4:n-1
                        yk(k+1) = yk(k) + (1/24)*( 55*feval(f,tk(k),yk(k)) - 59*feval(f,tk(k-1),yk(k-1)) + 37*feval(f,tk(k-2),yk(k-2)) - 9*feval(f,tk(k-3),yk(k-3)) ) * h;
                    end
                end
            end
        end
    end
end