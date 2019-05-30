function f = onevar(x)

if  length(x)~=1
    error("onevar function is for one variable only");
end
if x(1)<0 || x(1)>1
    error("Variable outside of range - use in {0,1}");
end


a = 6;
b = 2;
c = 12;
d = 4;

f = (a*x - 2)^2 * sin(c*x - d);