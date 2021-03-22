function [ yk1 ] = euler(f, t, yk, h)
    yk1 = yk + f(t, yk)*h;
end