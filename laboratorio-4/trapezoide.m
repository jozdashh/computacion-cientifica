function [ res ] = trapezoide(f, a, b)
    res = ((b-a)/2)*(f(a)+f(b));
end