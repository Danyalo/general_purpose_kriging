function y = dome(x)

% for i=1:size(X)
%   Y(i) = 1/2 * (1 - 2* X(i) - 1).^2;

y = sum(1-(2*x-1).^2)/length(x);
end