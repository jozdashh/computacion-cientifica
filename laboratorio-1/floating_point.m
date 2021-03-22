% Estudiantes: Josue Peña A., Jeffrey García G.

function V = floating_point(B, p, L, U, ticks)
    % ticks: saltos entre etiquetas del eje x (de 1 en 1, 0.5 en 0.5, etc)
    n = (B-1)*(B^(p-1))*(U-L+1);
    UFL = B^L;
    OFL = (1-B^(-p))*(B^(U+1));
    R = [UFL];
    ngroups = ceil(log10(OFL)/log10(B))+1;
    npoints = n/(ngroups);
    for i = 1:ngroups
        start = R(end);
        step = (B^(i-1)-start)/npoints;
        start = start + step;
        for j = 1:npoints
            R = [R, start];
            start = start + step;
        end
    end
    R(end) = [];
    V = [-flip(R),0,R];
    axis = zeros(1,(2*n)+1);
    plot(V,axis,'LineStyle', 'none','Marker', '.', 'MarkerEdgeColor','red','Markersize', 8)
    x0=10;
    y0=10;
    width=800;
    height=100;
    set(gcf,'position',[x0,y0,width,height])
    t = B^ceil(log10(OFL)/log10(B));
    set(gca, 'xtick', -t:ticks:t)
    set(gca, 'XAxisLocation', 'origin')
end
