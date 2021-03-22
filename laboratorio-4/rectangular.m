function [ res ] = rectangular(f, a, b)
    res = (b-a)*f((a+b)/2);
end