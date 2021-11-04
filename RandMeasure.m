%% Rand measure
Real = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3]';

score = 0;
TP = 0;
FP = 0;
TN = 0;
FN = 0;

%% Pair ºñ±³
for i = 1:genenum-1
    for j = i+1:genenum
        TP = TP + ((C(i)==C(j))&&(Real(i)==Real(j)));
        FP = FP + ((C(i)==C(j))&&(Real(i)~=Real(j)));
        FN = FN + ((C(i)~=C(j))&&(Real(i)==Real(j)));
        TN = TN + ((C(i)~=C(j))&&(Real(i)~=Real(j)));
    end
end

RepeatRM(k) = (TP+TN)/(TP+FP+FN+TN);