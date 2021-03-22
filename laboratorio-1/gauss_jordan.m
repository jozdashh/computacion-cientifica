% Estudiantes: Josue Peña A., Jeffrey García G.

function [Ap, bp] = gauss_jordan(A, b)
    if diff(size(A)) == 0 && det(A) ~= 0
        for col = 1:size(A)
            p = A(col, col);
            while p == 0
                row_mod = mod(col, size(A,1))+1;
                tmp = A(col,:);
                A(col,:) = A(row_mod, :);
                A(row_mod,:) = tmp;
                tmp = b(col,1);
                b(col,1) = b(row_mod, 1);
                b(row_mod, 1) = tmp;
                p = A(col,col);
            end
            Ap = eye(size(A));
            for i = 1:size(A)
                if i ~= col
                    Ap(i,col) = -A(i,col)/p;
                end
            end
            b = Ap*b;
            A = Ap*A;
        end
    else
      disp("La matriz A no es cuadrada o su determinante es 0");
    end
    Ap = A;
    bp = b;

end
