nn = 6;
Xplot=0:1/5:1;
LabenskyiPred = zeros(nn,nn,nn,nn);
LabenskyiTrue = zeros(nn,nn,nn,nn);
for i=1:nn
    for j=1:nn
        for k=1:nn
            for l=1:nn
                LabenskyiPred(i,j,k,l)=pred([Xplot(i) Xplot(j) Xplot(k) Xplot(l)]);
                LabenskyiTrue(i,j,k,l)=LabenskyiFunction([Xplot(i) Xplot(j) Xplot(k) Xplot(l)]);
            end
        end
    end
end

global ModelInfo

maxAbsDiff = 0;
meanSquareDev = 0;
for i=1:ModelInfo.ntest
    diff = pred(ModelInfo.Xtest(i,:)) - LabenskyiFunction(ModelInfo.Xtest(i,:));
    if (diff > maxAbsDiff)
        maxAbsDiff = diff;
    end
                        
    meanSquareDev = meanSquareDev + diff^2;
end

meanSquareDev = meanSquareDev / (ModelInfo.ntest * ModelInfo.ntest);

fprintf("Maximum absolute deviation of the prediction is %d   \n", maxAbsDiff);
fprintf("Mean Square deviation of the prediction is %d   \n", meanSquareDev);