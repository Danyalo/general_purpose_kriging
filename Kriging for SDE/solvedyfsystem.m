function [t,Y] = solvedyfsystem(diap, y0, p11, p12, p21, p22)
    dy1dy2 = @(t,y)[p11*y(1) + p12*y(1)*y(2); p21*y(2) + p22*y(1)*y(2)];
    [t,Y] = ode45(dy1dy2, diap, y0);
end
