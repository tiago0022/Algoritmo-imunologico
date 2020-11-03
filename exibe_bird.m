if exibe_grafico
    x = linspace(-2*pi,2*pi);
    y = linspace(-2*pi,2*pi);
    [x, y] = meshgrid(x,y);
    z = bird(x, y);
    contour(x, y, z);
%     fmesh(@(x,y) bird(x, y), [-2*pi 2*pi])
    alpha(0)
end