function x = suc_sust_lower(A, b)
    x = zeros(size(A,1),1);
    for row = 1:size(A,1)
        col = 1;
        while row ~= col
            b(row,1) = b(row,1) - A(row,col)*x(col,1);
            col = col+1;
        end
        x(row,1) = b(row,1)/A(row,col);
    end
end
