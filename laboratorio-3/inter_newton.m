function [ x ] = inter_newton(n, t, y)
    A = tril(ones(n+1));
    for i = 2:n+1
        j = 2;
        while j ~= (i+1)
            for k = 1:(j-1)
                A(i,j) = A(i,j)*(t(i) - t(k));
            end
            j = j+1;
        end
    end
    x = suc_sust_lower(A, y);
end

