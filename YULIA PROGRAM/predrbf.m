function y = predrbf(x) 
% Calculates the value of a Radial Basis Function surrogate model at x, 
% where all model information (including the parameters, if needed for the 
% type of basis function being used) are specified in the global variable 
% ModelInfo. 
% 
 
global ModelInfo
 
d = zeros(1,size(ModelInfo.X,1)); 
 
for k=1:size(ModelInfo.X,1) 
   d(k) = norm(x-ModelInfo.X(k,:),2); 
end 
 
 
phi = []; 
for k=1:size(ModelInfo.X,1) 
    if isfield(ModelInfo,'Sigma') 
        phi(k) = basis(ModelInfo.Code,d(k),ModelInfo.Sigma); 
    else 
        phi(k) = basis(ModelInfo.Code,d(k)); 
    end 
end 
     
 
y = phi*ModelInfo.Weights;