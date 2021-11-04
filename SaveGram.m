function SaveGram(RepeatPdf, genenum, k, dataname, name)

%% ���� Repeat length Pdf Matrix���� Phylogenetic Tree�� �׸��� ���α׷�

[temp1 temp2 maxrepeat] = size(RepeatPdf);

result = reshape(RepeatPdf,[genenum,maxrepeat*4^k]);
% DistanceMatrix = pdist(result, 'euclidean');
% Repeattree = seqlinkage(DistanceMatrix, 'average', name);
Z = linkage(result,'average','euclidean');
Repeattree = phytree(Z,name);
% DistanceMatrix = pdist(result, 'euclidean');
% Repeattree = seqneighjoin(DistanceMatrix, 'equivar', name);
Str = sprintf('Data\\RFdistance\\%s\\%s_%d_tree.dnd', dataname, dataname, k);
phytreewrite(Str,Repeattree,'BRANCHNAMES',false);

end