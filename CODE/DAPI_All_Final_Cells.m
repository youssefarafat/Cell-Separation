%% DAPI All Final Plot
dir0 = dir('*DAPI.tiff');
figure
for k = 1:10
disp(k)    
dataIn = imread(dir0(k).name);
dataOut = cellseperationtest(dataIn);
h1(k) = subplot(2,5,k)
imagesc(dataOut.overlaid)
title(num2str(k))
ylabel = ylabel(dir0(k).name,'interpreter','none')

end