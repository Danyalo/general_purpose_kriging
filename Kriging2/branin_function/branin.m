function f = branin(x)

if  length(x)~=2
    error("Branin function is for two variables only");
end
if x(1)<0 || x(1)>1 || x(2)<0 || x(2)>1
    error("Variable outside of range - use in {0,1}");
end

X1 = 15*x(1)-5;
X2 = 15*x(2);
a = 1;
b = 5.1/(4*pi^2);
c = 5/pi;
d = 6;
e = 10;
ff = 1/(8*pi);
f = (a*( X2 - b*X1^2 + c*X1 - d)^2 + e*(1-ff)*cos(X1) + e)+5*x(1);