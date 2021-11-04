
simname = sprintf('RepeatLengthPdf');
dataname = sprintf('Hepatitis');

for k = 1:8
    result = GetRepeat(sequence, genenum, k, maxlength);
    SaveGram(result, genenum, k, dataname, name);
    dos_test(k, genenum, dataname, simname);
end