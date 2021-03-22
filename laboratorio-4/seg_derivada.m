function [ res ] = seg_derivada(f, h, x)
    res = (f(x+h)-2*f(x)+f(x-h))/(h^2);
end