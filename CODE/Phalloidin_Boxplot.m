%% PHALLOIDIN MEAN AREA ISLANDS P-VALUE & BOXPLOT
figure
dir0 = dir('*Phalloidin.tiff');
for k = 1:10
dataIn1 = imread(dir0(k).name);
dataOut = PhalloidinRBD(dataIn1);
results(k) = dataOut.mean_area_islands
end
results1 = rand(10,2)
[t,p,r] = ttest2(results([1:5]),results([6:10]))
boxplot(results1)