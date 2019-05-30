nn = 20;
Xplot=0:1/(nn - 1):1;
LabenskyiPred = zeros(nn);
LabenskyiTrue = zeros(nn);
for i=1:nn
    LabenskyiPred(i)=pred1Var([Xplot(i)]);
    LabenskyiTrue(i)=onevar([Xplot(i)]);
end

global ModelInfoOneVar

maxAbsDiff = 0;
meanSquareDev = 0;
for i=1:ModelInfoOneVar.ntest
    diff = pred(ModelInfoOneVar.Xtest(i)) - onevar(ModelInfoOneVar.Xtest(i));
    if (diff > maxAbsDiff)
        maxAbsDiff = diff;
    end
                        
    meanSquareDev = meanSquareDev + diff^2;
end

meanSquareDev = sqrt (meanSquareDev / ModelInfoOneVar.ntest);

fprintf("Maximum absolute deviation of the prediction is %d   \n", maxAbsDiff);
fprintf("Mean Square deviation of the prediction is %d   \n", meanSquareDev);