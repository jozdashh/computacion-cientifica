function [ res ] = dif_atras(f, h, x)
    res = (f(x)-f(x-h))/h;
end