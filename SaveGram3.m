function SaveGram3(DS2Pdf, genenum, k, dataname, name)

%% 얻은 Repeat length Pdf Matrix에서 Phylogenetic Tree를 그리는 프로그램

Z = linkage(DS2Pdf,'average');
DS2tree = phytree(Z,name);
% DS2tree = seqneighjoin(DS2Pdf, 'equivar', name);
Str = sprintf('Data\\RFdistance\\%s\\%s_%d_tree.dnd', dataname, dataname, k);
phytreewrite(Str,DS2tree,'BRANCHNAMES',false);

end