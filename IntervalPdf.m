simname = sprintf('IntervalPdf');
dataname = sprintf('Hepatitis');

for k = 1:8
    result = GetInterval(sequence, genenum, k, maxlength);
    SaveGram2(result, genenum, k, dataname, name);
    dos_test(k, genenum, dataname, simname);
end