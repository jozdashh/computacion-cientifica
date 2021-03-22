function x = finElm(f,t0,tn,y0,y1,m)
    n = m + 2;
    tk = linspace(t0,tn,n)';
    %h = tk(2)-tk(1);
    A = zeros(n,n);
    A(1,:) = t0 .* ones(n,1);
    A(2,2:n) = tn .* ones(n-1,1);
    temp = zeros(n,1);
    b = zeros(n,1);
    b(1) = y0;
    b(2) = y1;
    temp(1) = 0;
    temp(2) = 0;
    % Creación del vector que representa la segunda derivada
    for i = 2:n-1
        temp(i+1) = i * (i-1);
    end
    for k = 3:n
        for exp = 0:n-3
            A(k,3+exp) = temp(3+exp) * (tk(k-1)^exp);
        end
        b(k) = feval(f,tk(k-1));
    end
    if sum(A(1,:)) == 0 && sum(A(:,1)) == 0
        [Ap,bp] = gauss_jordan(A(2:n,2:n),b(2:n));
        x = suc_sust_inf(Ap,bp);
        temp = x;
        x(1) = 0;
        x(2:n) = temp;
    else
        [Ap,bp] = gauss_jordan(A,b);
        x = suc_sust_inf(Ap,bp);
    end
end