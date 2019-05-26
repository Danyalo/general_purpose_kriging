global ModelInfo
% Number of variables
k=4;
% Number of sample points
n=100;
ModelInfo.ntrain = 80;
ModelInfo.ntest = 20;
% Create sampling plan
ModelInfo.X=bestlh(n,k,50,20);
% Calculate observed data
for i=1:n
    ModelInfo.y(i,1)=LabenskyiFunction(ModelInfo.X(i,:));
end

ModelInfo.Xtrain = ModelInfo.X(1 : ModelInfo.ntrain, :);
ModelInfo.Xtest = ModelInfo.X(ModelInfo.ntrain+1 : end, :);
ModelInfo.Ytrain = ModelInfo.y(1 : ModelInfo.ntrain);
ModelInfo.Ytest = ModelInfo.y(ModelInfo.ntrain+1 : end);

% Set upper and lower bounds for search of log theta
UpperTheta=ones(1,k).*2;
LowerTheta=ones(1,k).* - 3;
% Run GA search of likelihood
[ModelInfo.Theta,MinNegLnLikelihood]=...
    ga(@likelihood,k,[],[],[],[], LowerTheta,UpperTheta);
% Put Cholesky factorization of Psi, into ModelInfo
[NegLnLike,ModelInfo.Psi,ModelInfo.U]=likelihood(ModelInfo.Theta);