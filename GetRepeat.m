function RepeatPdf = GetRepeat(sequence, genenum, k, maxlength)

%% Gene sequence에서 특정 word가 반복되는 최대 길이를 얻어 여러가지를 수행하는 프로그램
num = 4^k;
maxrepeat = 30;

%% word repeat pdf 구하기
repeat = ones(1,k);
RepeatPdf = zeros(genenum,num,maxrepeat);
memory = zeros(1,2*k);
temp = zeros(1,2*k-1);

for i = 1:genenum
    for j = 1:maxlength
        temp = memory(1,1:2*k-1);
        memory(1,1) = sequence(i,j);
        memory(1,2:2*k) = temp;
        
        if memory(1,1:k) == memory(1,k+1:2*k)
            repeat(1,mod(j-1,k)+1) = repeat(1,mod(j-1,k)+1)+1;
        else
            if memory(1,1:k) ~= 0
                index = 0;
                for l = 1:k
                    index = index + 4^(l-1)*(memory(1,l)-1);
                end
                index = index + 1;
                RepeatPdf(i,index,repeat(1,mod(j-1,k)+1)) = RepeatPdf(i,index,repeat(1,mod(j-1,k)+1))+1;
            end
            repeat(1,mod(j-1,k)+1) = 1;
        end
    end
    repeat = ones(1,k);
    memory = zeros(1,2*k);
    temp = zeros(1,2*k-1);
    Str = sprintf('word %d (%d/%d, %2.2f%%) is completed', k, i, genenum, 100*i/genenum);
    disp(Str);
end

%% length normalization
% for i = 1:maxrepeat
%     RepeatPdf(:,:,i) = RepeatPdf(:,:,i)*i;
% end

%% 중첩허용
% for i = 1:maxrepeat
%     for j = 1:i-1
%         RepeatPdf(:,:,j) = RepeatPdf(:,:,j)+RepeatPdf(:,:,i)*(i-j+1);
%     end
% end

%% Repeat pdf normalization
for i = 1:genenum
    RepeatPdf(i,:,:) = RepeatPdf(i,:,:)/sum(sequence(i,:)~=0);
end

%% Clustering 및 denrogram
% Z = linkage(reshape(RepeatPdf,[genenum,maxrepeat*num]),'ward','Euclidean');
% C = cluster(Z,'maxclust',3);
% dendrogram(Z,0);

end