function [v] = gen_v(a, row)
    if row ~= 1
        a(1:(row-1),1) = 0;
    end
    alpha = norm(a);
    if a(row) > 0
        alpha = -alpha;
    end
    a(row) = a(row)-alpha;
    v = a;
end

