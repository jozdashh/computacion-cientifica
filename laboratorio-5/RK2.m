function [ yk1 ] = RK2(f, t, yk, h)
    k1 = f(t, yk)*h;
    k2 = f(t + h, yk + k1)*h;
    yk1 = yk + (1/2)*(k1 + k2);
end