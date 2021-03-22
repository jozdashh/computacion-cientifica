function [ res ] = rectangular_comp(f, a, b, n)
    x = linspace(a, b, n);
    res = x(1)*f((x(1))/2);
    for i = 2:n
        res = res + (x(i)-x(i-1))*f((x(i-1) + x(i))/2);
    end
end