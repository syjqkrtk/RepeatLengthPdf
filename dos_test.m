function dos_test(k, genenum, dataname, simname)

Str = sprintf('java -jar D:\\Download\\MATLAB\\phylonet_v2_4\\phylonet_v2_4\\phylonet_v2_4.jar rf -m D:\\Download\\MATLAB\\RepeatLengthPdf\\Data\\%s_%d.dnd -e D:\\Download\\MATLAB\\RepeatLengthPdf\\Data\\RFdistance\\%s\\%s_%d_tree.dnd -o D:\\Download\\MATLAB\\RepeatLengthPdf\\Data\\RFdistance\\%s\\%s_%d.txt',dataname, genenum, dataname, dataname, k, dataname, simname, k);
[status, result] = dos(Str);
disp(Str);

end