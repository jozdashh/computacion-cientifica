function [ res ] = dif_adelante(f, h, x)
    res = (f(x+h)-f(x))/h;
end