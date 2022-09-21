%% PHALLOIDIN MEAN AREA ISLANDS BARPLOT
figure
dir0 = dir('*Phalloidin.tiff');
for k = 1:10
dataIn1 = imread(dir0(k).name);
dataOut = PhalloidinRBD(dataIn1);
reults(k) = dataOut.mean_area_islands
end
bar([results])