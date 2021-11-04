function SaveGram2(WordPdf, genenum, k, dataname, name)

%% ���� Repeat length Pdf Matrix���� Phylogenetic Tree�� �׸��� ���α׷�

Z = linkage(WordPdf,'average','euclidean');
Wordtree = phytree(Z,name);
% DistanceMatrix = pdist(WordPdf, 'euclidean');
% Wordtree = seqneighjoin(DistanceMatrix, 'equivar', name);
Str = sprintf('Data\\RFdistance\\%s\\%s_%d_tree.dnd', dataname, dataname, k);
phytreewrite(Str',Wordtree,'BRANCHNAMES',false);

end