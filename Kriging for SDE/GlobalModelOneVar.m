global ModelInfoOneVar

% Number of variables
k=1;

% Number of sample points
ModelInfoOneVar.ntrain = 100;

% Create sampling plan
ModelInfoOneVar.Xtrain=0:1/(ModelInfoOneVar.ntrain - 1):1;

% Calculate observed data
for i=1:ModelInfoOneVar.ntrain
    ModelInfoOneVar.Ytrain(i)=onevar(ModelInfoOneVar.Xtrain(i));
end

ModelInfoOneVar.ntest = 33;
ModelInfoOneVar.Xtest=0:1/(ModelInfoOneVar.ntest - 1):1;
for i=1:ModelInfoOneVar.ntest
    ModelInfoOneVar.Ytest(i)=onevar(ModelInfoOneVar.Xtest(i));
end

% Set upper and lower bounds for search of log theta
UpperTheta=ones(1,k).*2;
LowerTheta=ones(1,k).* - 3;
% Run GA search of likelihood
[ModelInfoOneVar.Theta,MinNegLnLikelihood]=...
    ga(@likelihood,k,[],[],[],[], LowerTheta,UpperTheta);
% Put Cholesky factorization of Psi, into ModelInfo
[NegLnLike,ModelInfoOneVar.Psi,ModelInfoOneVar.U]=likelihood(ModelInfoOneVar.Theta);