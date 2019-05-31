function [integral] = LotkaVolterra(x)
%LotkaVolterra Returns the integral of solutions of system of diff equations 
%   x - array of  p11, p12, p21, p22 - coefficients for the system of diff equations
%   Given y1 and y1 are solutions of system, calsulates the value of
%   Integral(y1^2 + y2^2)

diap = [0 1];
y0 = [1 1];

x1 = x(1);
x2 = - x(2);
x3 = - x(3);
x4 = 0.75;

[t,result] = solvedyfsystem(diap, y0, x1, x2, x3, x4);

Q1 = trapz(t,result(:,1));
Q2 = trapz(t,result(:,2));
integral = Q1^2 + Q2^2;

end

