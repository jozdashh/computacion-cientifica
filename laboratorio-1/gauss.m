% Estudiantes: Josue Peña A., Jeffrey García G.

function [Ap, bp] = gauss(A, b)
    if diff(size(A)) == 0 && det(A) ~= 0
        for row = 1:size(A)-1
            p = A(row, row);
            while p == 0
                row_mod = mod(row, size(A,1))+1;
                tmp = A(row,:);
                A(row,:) = A(row_mod, :);
                A(row_mod,:) = tmp;
                tmp = b(row,1);
                b(row,1) = b(row_mod,1);
                b(row_mod,1) = tmp;
                p = A(row,row);
            end
            Ap = eye(size(A));
            for col = row+1:size(A)
                Ap(col, row) = -A(col,row)/p;
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
