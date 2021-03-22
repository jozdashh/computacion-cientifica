function [x] = householder(d, t, y)
    A = gen_matrix_A(t, d);
    b = y;
    for i = 1:(d+1)
        vi = gen_v(A(:,i),i);
        Hi = gen_H(vi);
        A = Hi*A;
        b = Hi*b;
    end
    A = round(A,3);
    b = round(b,3);
    x = round(suc_sust_upper(A(1:size(A,2),:), b(1:(d+1), 1)),3);
end 
