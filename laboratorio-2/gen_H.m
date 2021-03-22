function [H] = gen_H(v)
    H = eye(size(v,1)) - 2*((v*v')/(v'*v));
end