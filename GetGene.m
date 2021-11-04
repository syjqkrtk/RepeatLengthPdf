%% Gene sequence를 읽어 저장하는 프로그램
genenum = 47;
maxlength = 7277;
name = {'B1_I';'B2_I';'I3_I';'NP1_I';'P2_I';'Yam67_I';'C1_I';'C2_I';'C3_I';'C4_I';'Chinahebei_I';'P1_I';'I1_I';'Morocco_I';'T3_I';'M1_II';'HEJA10_III';'JKNSap_III';'JMYHAW_III';'SWUS1_III';'US1_III';'US2_III';'JBOAR1HYO04_III';'JDEERHYO03L_III';'JJTKAN_III';'JMOHYO03L_III';'JRA1_III';'JSOHYO03L_III';'JTHHYO03L_III';'JYOHYO03L_III';'SWJ570_III';'KYRGYZ_III';'ARKELL_III';'HEJA1_IV';'HEJK4_IV';'HEJI4_IV ';'JAKSai_IV';'JKKSAP_IV';'JSMSAP95_IV';'JSNSAPFH_IV';'JSNSAPFH02C_IV';'JTSSAP02_IV';'JYWSAP02_IV';'SWJ131_IV';'SWCH25_IV';'T1_IV';'CCC220_IV';};
locusname = zeros(genenum,15);
length = zeros(genenum);
sequence = zeros(genenum,maxlength);
filename = 'Data\\Hepatitis_47.fas';
file = fopen(filename, 'w');
RepeatRM = zeros(1,8);

%% 데이터 읽기
for i = 1:genenum
    Data = getgenbank(GeneSerial(i));
    Str = sprintf('>%s\n%s\n',char(name(i,:)),char(Data.Sequence-32));
    fwrite(file, Str);
    length = str2num(Data.LocusSequenceLength);
    sequence(i,1:length) = Data.Sequence;
    Str = sprintf('(%d/%d, %2.2f%%) is loaded', i, genenum, 100*i/genenum);
    disp(Str);
end
fclose(file);

%% A=1,T=2,C=3,G=4
rawsequence = char(sequence);
sequenceA = (sequence == 'a');
sequenceT = 2*(sequence == 't');
sequenceC = 3*(sequence == 'c');
sequenceG = 4*(sequence == 'g');

sequence = sequenceA+sequenceT+sequenceC+sequenceG;