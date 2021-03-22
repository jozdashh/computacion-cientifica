function [x] = normal_equations(d, t, y)
    A = gen_matrix_A(t, d);
    b = y;
    ATA = A'*A;
    ATb = A'*b;
    L = chol(ATA,'lower');
    y_alt = suc_sust_lower(L, ATb);
    x = suc_sust_upper(L',y_alt);
end
