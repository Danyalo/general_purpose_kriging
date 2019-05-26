function f = basis (varargin)
%USAGE basis(Code, r, [Sigma])

if nargin == 0
    error ('Basis requires input arguments. ');
elseif nargin == 1
    %We default to cubic splines
    Code = 2;
    r = varargin{1};
elseif nargin == 2
    %If only two arguments given, only non-parametric bases can be
    %calculated - if first argument greater, we default to 3.
    Code = min([varargin{1}, 3]);
    r = varargin{2};
else
    %Defaults to inverse multi-quadric if first argument >6
    Code = min([varargin{1}, 6]);
    r = varargin{2};
    Sigma = varargin{3};
end

switch Code
    case 1
        %Linear function
        f = r;
    case 2
        %Cubic
        f = r^3;
    case 3
        %thin plate spline
        if r < 1e-200
            f = 0;
        else
            f = r^2*log(r);
        end
    case 4
        %Gaussian
        f = exp(-(r^2)/(2*Sigma^2));
    case 5
        %Multi-quadric
        f = (r^2 + Sigma^2)^0.5;
    case 6
        %Inverse Multi-Quadric
        f = (r^2 + Sigma^2)^(-0.5);
end