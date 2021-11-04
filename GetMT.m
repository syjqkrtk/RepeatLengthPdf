%% Gene sequence를 읽어 저장하는 프로그램
genenum = 30;
maxlength = 17245;
name = {'Human';'Commonchimpanzee';'Pigmychimpanzee';'Gorilla';'Orangutan';'Gibbon';'Baboon';'Horse';'Whiterhinoceros';'Harborseal';'Grayseal';'Cat';'Finwhale';'Bluewhale';'Cow';'Rat';'Mouse';'Opossum';'Wallaroo';'Platypus';'Squirrel';'Fatdormouse';'Guineapig';'Donkey';'Indianrhinoceros';'Dog';'Sheep';'Pig';'Hippopotamus';'Rabbit'};
locusname = zeros(genenum,15);
length = zeros(genenum);
sequence = zeros(genenum,maxlength);
filename = 'Data\MT_30.fas';
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