function [ yk1 ] = RK4(f, t, yk, h)
    k1 = f(t, yk)*h;
    k2 = f(t + (h/2), yk + (k1/2))*h;
    k3 = f(t + (h/2), yk + (k2/2))*h;
    k4 = f(t + h, yk + k3)*h;
    yk1 = yk + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end