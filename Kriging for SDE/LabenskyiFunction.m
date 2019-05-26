function [integral] = LabenskyiFunction(x)
%UNTITLED3 Returns the integral of solutions of system of diff equations 
%   x - array of  p11, p12, p21, p22 - coefficients for the system of diff equations
%   Uses global interval [t0, t1] and starting points y10, y20 for the
%   system from the ModelInfo class
%   Given y1 and y1 are solutions of system, calsulates the value of
%   Integral(y1^2 + y2^2)
%   Uses ode45 to solve the system of differential equations

diap = [0 1];
y0 = [1 1];
[t,result] = solvedyfsystem(diap, y0, x(1), x(2), x(3), x(4));

Q1 = trapz(t,result(:,1));
Q2 = trapz(t,result(:,2));

integral = Q1^2 + Q2^2;

end

