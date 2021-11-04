
simname = sprintf('DS2Pdf');
dataname = sprintf('Hepatitis');

for k = 1:8
    result = GetDS2(sequence, genenum, k, maxlength);
    SaveGram3(result, genenum, k, dataname, name);
    dos_test(k, genenum, dataname, simname);
end