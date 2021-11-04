function SaveGram3(DS2Pdf, genenum, k, dataname, name)

%% ���� Repeat length Pdf Matrix���� Phylogenetic Tree�� �׸��� ���α׷�

Z = linkage(DS2Pdf,'average');
DS2tree = phytree(Z,name);
% DS2tree = seqneighjoin(DS2Pdf, 'equivar', name);
Str = sprintf('Data\\RFdistance\\%s\\%s_%d_tree.dnd', dataname, dataname, k);
phytreewrite(Str,DS2tree,'BRANCHNAMES',false);

end