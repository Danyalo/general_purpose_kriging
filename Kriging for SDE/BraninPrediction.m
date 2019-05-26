Xplot=0:1/20:1;
BraninPred = zeros(21,21);
BraninTrue = zeros(21,21);
for i=1:21
    for j=1:21
        BraninPred(j,i)=pred([Xplot(i) Xplot(j)]);
        BraninTrue(j,i)=branin([Xplot(i) Xplot(j)]);
    end
end


fun = @branin;
x0 = [0.1,0.8]; % important
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0,0];
ub = [1,1];
nonlcon = [];
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');

[x_min,fval] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub, nonlcon, options);

fun2 = @pred;

[x_min_pred,fval_pred] = fmincon(fun2,x0,A,b,Aeq,beq,lb,ub, nonlcon, options);



% Find the minimum:

minVal = BraninPred(1,1);
minI = 1;
minJ = 1;
for i=1:21
    for j=1:21
        if (BraninPred(j,i) < minVal)
            minVal = BraninPred(j,i);
            minI = i;
            minJ = j;
        end
    end
end
% fmincon
%fprintf("Predicted function's minimum value is %d   \n", minVal);
%fprintf("at the indeces (%d, %d)  \n", minI, minJ);
%fprintf("at the point (%d, %d)  \n\n\n", Xplot(minI), Xplot(minJ));

% Calculate deviation:

maxAbsDiff = BraninPred(1,1) - BraninTrue(1,1);
meanSquareDev = 0;
for i=1:21
    for j=1:21
        diff = BraninPred(j,i) - BraninTrue(j,i);
        if (diff > maxAbsDiff)
            maxAbsDiff = diff;
        end
                        
        meanSquareDev = meanSquareDev + diff^2;
    end
end

meanSquareDev = meanSquareDev / (21 * 21);

%fprintf("Maximum absolute deviation of the prediction is %d   \n", maxAbsDiff);
%fprintf("Mean Square deviation of the prediction is %d   \n", meanSquareDev);
