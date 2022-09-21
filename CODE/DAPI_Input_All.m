%% DAPI INPUT 
dir0 = dir('*DAPI.tiff');
figure
for k = 1:10
h(k) = subplot(2,5,k)
imagesc(imread(dir0(k).name));
title(num2str(k))
end