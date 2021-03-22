function [yk, tk] = finDiff(f,t0,tn,y0,y1,m)
    n = 2 + m;
    tk = linspace(t0,tn,n)';
    h = tk(2)-tk(1);
    yk = zeros(1,n)';
    yk(1) = y0;
    yk(n) = y1;
    if m > 0
        A = zeros(m,m);
        b = zeros(m,1);
        A(1,1:3) = [-2 1 0];
        b(1) = h^2 * feval(f,tk(2)) - y0;
        A(m,m-2:m) = [0 1 -2];
        b(m) = h^2 * feval(f,tk(n-1)) - y1;
        for k = 2:n-3
            A(k,k-1:k+1) = [1 -2 1];
            b(k) = h^2 * feval(f,tk(k+1));
        end
        [Ap, bp] = gauss_jordan(A,b);
        x = suc_sust_inf(Ap,bp);
        yk(2:n-1) = x;
    end
end