global ModelInfo

% Coefficients for diff system
ModelInfo.p12 = 2;
ModelInfo.p22 = -4;

% Number of variables
k=2;
% Number of sample points
ModelInfo.ntrain = 100;

% Create sampling plan
ModelInfo.Xtrain=bestlh(ModelInfo.ntrain,k,50,20);

% Calculate observed data
for i=1:ModelInfo.ntrain
    ModelInfo.Ytrain(i,1) = branin(ModelInfo.Xtrain(i,:));
end


ModelInfo.ntest = fix(ModelInfo.ntrain / 4);

% Create sampling plan
ModelInfo.Xtest=bestlh(ModelInfo.ntest,k,50,20);

% Calculate observed data
for i=1:ModelInfo.ntest
    ModelInfo.Ytest(i,1)=branin(ModelInfo.Xtest(i,:));
end


% Set upper and lower bounds for search of log theta
UpperTheta=ones(1,k).*2;
LowerTheta=ones(1,k).* - 3;

% Run GA search of likelihood
[ModelInfo.Theta, MinNegLnLikelihood]=...
    ga(@likelihood,k,[],[],[],[], LowerTheta,UpperTheta);
% Put Cholesky factorization of Psi, into ModelInfo
[NegLnLike,ModelInfo.Psi,ModelInfo.U]=likelihood(ModelInfo.Theta);