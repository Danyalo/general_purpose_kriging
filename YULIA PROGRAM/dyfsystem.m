function dy1dy2 = dyfsystem(t,y,p1,p12,p2,p21)
dy1dy2 = [p1*y(1) + p12*y(1)*y(2); 
          p2*y(2) + p21*y(1)*y(2)];
end

