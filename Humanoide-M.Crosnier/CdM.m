function [ x, y, z ] = CdM( Ts, x0, dx0, y0, dy0, px, py )

    global zc Tc
    kx = 0.01;
    ky = 0.01;
    
    dt = 0.01;               % periode d'echantillonnage
    N = floor(Ts/dt+1);     % nombre de points
    
    
    for i=1:N
        t = (i-1)*dt;
        
        x(i) = (x0 - px)*cosh(t/Tc) + Tc*dx0*sinh(t/Tc) + px;
        dx(i) = (x0 - px)*sinh(t/Tc)/Tc + dx0*cosh(t/Tc);
    
        y(i) = (y0 - py)*cosh(t/Tc) + Tc*dy0*sinh(t/Tc) + py;
        dy(i) = (y0 - py)*sinh(t/Tc)/Tc + dy0*cosh(t/Tc);
        
        z(i) = kx*x(i) + ky*y(i) + zc;
    
        xx = [x(i) px];
        yy = [y(i) py];
        zz = [z(i) 0];

        line(xx, yy, zz)
    end
end

