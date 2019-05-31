nn = 6;
Xplot=0:1/5:1;
LabenskyiPred = zeros(nn,nn,nn,nn);
LabenskyiTrue = zeros(nn,nn,nn,nn);
for i=1:nn
    for j=1:nn
        for k=1:nn
            for l=1:nn
                %LabenskyiPred(i,j,k,l)=pred([Xplot(i) Xplot(j) Xplot(k) Xplot(l)]);
                %LabenskyiTrue(i,j,k,l)=LabenskyiFunction([Xplot(i) Xplot(j) Xplot(k) Xplot(l)]);
            end
        end
    end
end

global ModelInfo

maxAbsDiff = 0;
meanSquareDev = 0;
rangeMax = ModelInfo.Ytest(1);
rangeMin = ModelInfo.Ytest(1);
for i=1:ModelInfo.ntest
    trueValue = ModelInfo.Ytest(i);
    diff = pred(ModelInfo.Xtest(i,:)) - trueValue;
    if (diff > maxAbsDiff)
        maxAbsDiff = diff;
    end
    
    if (trueValue > rangeMax)
        rangeMax = trueValue;
    end
    if (trueValue < rangeMin)
        rangeMin = trueValue;
    end
    
    meanSquareDev = meanSquareDev + diff^2;
end



% [X,Y] = meshgrid(-1:.2:1);
% nn = 11;
% ZTrue = zeros(nn, nn);
% for i=1:nn
%     for j=1:nn
%           ZTrue(i,j)=pred([X(i) Y(j)]);
%          % LabenskyiTrue(i,j,k,l)=LabenskyiFunction([Xplot(i) Xplot(j) Xplot(k) Xplot(l)]);
%     end
% end
% 
% 
% Z = X .* exp(-X.^2 - Y.^2);
% surf(X,Y,ZTrue)
% 
% 
% % plot(ModelInfo.ntest,sol.y(1,:), 'red');
% % hold on
% % plot(ModelInfo.ntest,sol.y(2,:), 'black');
% % grid on
% 
% legend('I(t)','Ia(t)','G(t)')
% 
% title("The dynamics of blood sugar levels. Hyperinsulin case. h = 3")
% xlabel("time t (hours)");
% ylabel("y(t)");



meanSquareDev = sqrt (meanSquareDev / ModelInfo.ntest );
meanSquareDev = meanSquareDev / (rangeMax - rangeMin);

fprintf("Maximum absolute deviation of the prediction is %d   \n", maxAbsDiff);
fprintf("Mean Square deviation of the prediction is %d   \n", meanSquareDev);