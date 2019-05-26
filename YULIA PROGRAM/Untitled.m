% Make ModelInfo visible to all functions
% global ModelInfo
% % Sampling plan
% ModelInfo.X=bestlh(10,2,50,25);
% 
% % Compute objective function values – in this case using
% % the dome.m test function
% for i=1:size(ModelInfo.X,1)
% Exact_Solution(i)=dome(ModelInfo.X(i,:));
% end
% ModelInfo.y=Exact_Solution';
% % Basis function type:
% ModelInfo.Code=3;
% % Estimate model parameters
% rbf
% 
% X_test = lhsdesign(10,2);
% for k=1:length(X_test)
% exact = dome([X_test(k,1) X_test(k,2)]);
% approximation_testX(k) = predrbf([X_test(k,1) X_test(k,2)]);
% end
% 
% mistake = maxmistake(exact,approximation_testX)
% 
% % Plot the predictor
% x=(0:0.025:1);
% for i=1:length(x)
% for j=1:length(x)
% F(j,i)=dome([x(i) x(j)]);
% M(j,i)=predrbf([x(i) x(j)]);
% end
% end
% hold on
% contour(x,x,F);
% hold on
% contour(x,x,M,'--');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% % Make ModelInfo visible to all functions
% global ModelInfo
% % Sampling plan
% rng('shuffle');
% ModelInfo.X = rand(10,1);
% % Compute objective function values – in this case using
% % the dome.m test function
% for i=1:size(ModelInfo.X)
% Exact_Solution(i)=funcone(ModelInfo.X(i));
% end
% ModelInfo.y=Exact_Solution';
% % Basis function type:
% ModelInfo.Code=3;
% % Estimate model parameters
% rbf
% 
% X_train = rand(10,1);
% X_test = rand(10,1);
% for k=1:length(X_train)
% approximation_trainX(k) = predrbf(X_train(k));
% approximation_testX(k) = predrbf(X_test(k));
% end
% 
% mistake = maxmistake(approximation_trainX,approximation_testX)
% 
% % Plot the predictor
% x=(0:0.025:1);
% for i=1:length(x)
% F(i)=funcone(x(i));
% M(i)=predrbf(x(i));
% end
% hold on
% plot(x,F);
% hold on
% plot(x,M,'--');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

diap = [0 1];
y0 = [1 1];
[t,result] = solvedyfsystem(diap, y0, -1, 2, 2, -4)