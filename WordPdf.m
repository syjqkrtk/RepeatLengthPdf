simname = sprintf('WordPdf');
dataname = sprintf('Hepatitis');

for k = 1:8
    result = GetPdf(sequence, genenum, k, maxlength);
    SaveGram2(result, genenum, k, dataname, name);
    dos_test(k, genenum, dataname, simname);
end