function SaveGram2(WordPdf, genenum, k, dataname, name)

%% 얻은 Repeat length Pdf Matrix에서 Phylogenetic Tree를 그리는 프로그램

Z = linkage(WordPdf,'average','euclidean');
Wordtree = phytree(Z,name);
% DistanceMatrix = pdist(WordPdf, 'euclidean');
% Wordtree = seqneighjoin(DistanceMatrix, 'equivar', name);
Str = sprintf('Data\\RFdistance\\%s\\%s_%d_tree.dnd', dataname, dataname, k);
phytreewrite(Str',Wordtree,'BRANCHNAMES',false);

end