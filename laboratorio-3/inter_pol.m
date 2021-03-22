function [ x ] = inter_pol(n, t, y)
    D = gen_matrix_A(t, n);
    [A, b] = gauss_jordan(D, y);
    x = suc_sust_upper(A, b);
end

