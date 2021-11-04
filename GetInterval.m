function IntervalPdf = GetInterval(sequence, genenum, k, maxlength)

%% Gene sequence에서 기존의 k-word pdf를 이용하여 그래프를 얻음
num = 4^k;
StartPosition = zeros(genenum,num);
MaxPosition = zeros(genenum,num);
IntervalPdf = zeros(genenum,num);
memory = zeros(1,num);

%% interval pdf 구하기
for i = 1:genenum
    for j = 1:maxlength-k+1
        temp = sequence(i,j:j+k-1);
        if temp(:,:) ~= 0
            index = 0;
            for l = 1:k
                index = index + 4^(l-1)*(temp(1,l)-1);
            end
            index = index+1;
            if StartPosition(i,index) == 0
                StartPosition(i,index) = j;
            end
            memory(1,index) = memory(1,index)+1;
            MaxPosition(i,index) = MaxPosition(i,index)+j-StartPosition(1,index);
%             MaxPosition(i,index)=j;
        end
    end
    for n = 1:num
        m = memory(1,n);
        L = sum(sequence(i,:)~=0);
        if m == 0
        else
            IntervalPdf(i,n) = ((MaxPosition(i,n)))/(m*(L-k+1));
        end
    end
    MaxPosition = zeros(genenum,num);
    StartPosition = zeros(genenum,num);
    memory = zeros(1,4^k);
    temp = zeros(1,k);
    Str = sprintf('(%d/%d, %2.2f%%) is completed', i, genenum, 100*i/genenum);
    disp(Str);
end

%% Repeat pdf normalization
for i = 1:genenum
    IntervalPdf(i,:,:) = IntervalPdf(i,:,:)/sum(sequence(i,:)~=0);
end

end

%% Clustering 및 denrogram
% Z = linkage(IntervalPdf,'ward','Euclidean');
% C = cluster(Z,'maxclust',3);
% dendrogram(Z,0);