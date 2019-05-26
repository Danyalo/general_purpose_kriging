function [t,Y] = solvedyfsystem(diap, y0,p1,p12,p2,p21)
dy1dy2 = @(t,y)[p1*y(1) + p12*y(1)*y(2); p2*y(2) + p21*y(1)*y(2)];
[t,Y] = ode45(dy1dy2, diap, y0);
end

