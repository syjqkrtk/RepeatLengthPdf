function DS2 = GetDS2(sequence, genenum, k, maxlength)

%% Gene sequence에서 특정 word가 반복되는 최대 길이를 얻어 여러가지를 수행하는 프로그램
num = 4^k;

%% word repeat pdf 구하기
WordPdf = zeros(genenum,num);
XwPdf = zeros(genenum,num);
Pw = zeros(4,genenum);

Pw(1,:)=(sum(sequence==1,2)./sum(sequence~=0,2))';
Pw(2,:)=(sum(sequence==2,2)./sum(sequence~=0,2))';
Pw(3,:)=(sum(sequence==3,2)./sum(sequence~=0,2))';
Pw(4,:)=(sum(sequence==4,2)./sum(sequence~=0,2))';

for i = 1:genenum
    pw = ones(1,num);
    for j = 1:num
        l = j;
        while(l>0)
            w = mod(l,4)+1;
            l = floor(l/4);
            pw(j) = pw(j)*Pw(w,i);
        end
    end
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
%     XwPdf(i,:) = WordPdf(i,:) - sum(sequence(i,:)~=0).*pw;
    XwPdf(i,:) = WordPdf(i,:);
    temp = zeros(1,k);
    Str = sprintf('(%d/%d, %2.2f%%) is completed', i, genenum, 100*i/genenum);
    disp(Str);
end

%% Calculate DS2

DS2Pdf = zeros(genenum,genenum);
DS2distance = zeros(genenum,genenum);

for i = 1:genenum
    for j = 1:genenum
        for l = 1:num
            if (XwPdf(i,l) ~= 0) && (XwPdf(j,l) ~= 0)
                DS2Pdf(i,j) = DS2Pdf(i,j) + XwPdf(i,l)*XwPdf(j,l);
%                 DS2Pdf(i,j) = DS2Pdf(i,j) + XwPdf(i,l)*XwPdf(j,l)/sqrt(XwPdf(i,l)^2+XwPdf(j,l)^2);
            end
        end
        Str = sprintf('(%d/%d, %d/%d, %2.2f%%) is completed', i, genenum, j, genenum, 100*((i-1)*genenum+j)/(genenum^2));
        disp(Str);
    end
end

for i = 1:genenum
    for j = 1:genenum
        DS2distance(i,j) = abs(log(DS2Pdf(i,j)/sqrt(DS2Pdf(i,i)*DS2Pdf(j,j))));
    end
end

DS2 = zeros(1,genenum*(genenum-1)/2);
count = 0;

for i = 1:genenum-1
    for j = i+1:genenum
        count = count + 1;
        DS2(1,count) = DS2distance(j,i);
    end
end


%% Clustering 및 denrogram
% Z = linkage(reshape(RepeatPdf,[genenum,maxrepeat*num]),'ward','Euclidean');
% C = cluster(Z,'maxclust',3);
% dendrogram(Z,0);

end