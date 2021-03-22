function [ res ] = dif_centrada(f, h, x)
    res = (f(x+h)-f(x-h))/(2*h);
end