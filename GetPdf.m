function WordPdf = GetPdf(sequence, genenum, k, maxlength)

%% Gene sequence에서 기존의 k-word pdf를 이용하여 그래프를 얻음
num = 4^k;
WordPdf = zeros(genenum,num);
temp = zeros(1,k);

%% word pdf 구하기
for i = 1:genenum
    for j = 1:maxlength-k+1
        temp = sequence(i,j:j+k-1);
        if temp(:,:) ~= 0
            index = 0;
            for l = 1:k
                index = index + 4^(l-1)*(temp(1,l)-1);
            end
            index = index+1;
            WordPdf(i,index) = WordPdf(i,index)+1;
        end
    end
    temp = zeros(1,k);
    Str = sprintf('(%d/%d, %2.2f%%) is completed', i, genenum, 100*i/genenum);
    disp(Str);
end

%% Repeat pdf normalization
for i = 1:genenum
    WordPdf(i,:,:) = WordPdf(i,:,:)/sum(sequence(i,:)~=0);
end

%% Clustering 및 denrogram
% Z = linkage(WordPdf,'ward','Euclidean');
% C = cluster(Z,'maxclust',3);
% dendrogram(Z,0);
end