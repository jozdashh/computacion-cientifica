function x = suc_sust_upper(A, b)
    x = zeros(size(A,1),1);
    for row = size(A,1):-1:1
        col = size(A,2);
        while row ~= col
            b(row,1) = b(row,1) - A(row,col)*x(col,1);
            col = col-1;
        end
        x(row,1) = b(row,1)/A(row,col);
    end
end
