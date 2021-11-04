%% Hepatitis average/euclidean data
% RepeatPdf = [23,13,11,10,5,3,2,3];
% WordPdf = [32,23,15,12,8,5,6,6];

% RepeatPdf2 = [24,11,9,10,5,4,2,3];

%% Hepatitis2 average/euclidean data
RepeatPdf = [24,13,11,10,5,3,2,3];
% RepeatPdf2 = [30,20,13,11,5,3,2,3];
FFP = [33,24,15,12,8,5,6,6];
D2 = [33,24,15,12,7,7,6,6];
Interval = [41,33,31,17,18,13,11,12];
% IntervalPdf2 = [37,32,31,16,18,13,11,12];

%% Hepatitis average/correlation data
% RepeatPdf = [26,15,11,10,4,3,1,3];
% WordPdf = [32,23,15,12,8,5,6,6];

% RepeatPdf2 = [23,12,9,10,4,4,1,3];

%% Hepatitis single/euclidean data
% RepeatPdf = [25,20,12,10,9,6,5,6];
% WordPdf = [32,23,15,12,8,5,6,6];

% RepeatPdf2 = [25,15,13,11,9,7,5,3];

%% MT data
% RepeatPdf = [17,12,8,5,3,3,1,1];
% WordPdf = [18,16,10,7,5,6,5,4];

% RepeatPdf2 = [16,10,6,5,3,2,1,1];


% RepeatPdf = [0.891787439613527,0.971014492753623,0.943961352657005,0.943961352657005,0.943961352657005,0.918840579710145];
% RepeatPdf2 = [0.942028985507246,0.971014492753623,0.943961352657005,0.943961352657005,0.943961352657005,0.918840579710145];
% WordPdf = [0.843434343434343,0.908108108108108,0.851282051282051,0.851282051282051,0.851282051282051,0.800970873786408];
% ylim([0.75 1]);

plot(RepeatPdf, 'o-');
hold on
grid on
plot(Interval, 'd-');
% plot(IntervalPdf2, 'd-');
plot(FFP, 'x-');
plot(D2, 's-');
legend('Distribution of repeated k-word','New normalized k-word average relative distance','FFP','D2');
% legend('RepeatPdf','Normalized k-word average interval distance','New normalized k-word average relative distance','FFP');
xlabel('k')
ylabel('RF distance')
