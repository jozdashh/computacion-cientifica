function [A] = gen_matrix_A(t, d)
    A = zeros(size(t,1),d+1);
    for i = 1:(d+1)
        A(:,i) = t.^(i-1);
    end
end
