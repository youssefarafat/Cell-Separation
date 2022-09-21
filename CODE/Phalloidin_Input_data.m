  %% PHALLOIDIN INPUT DATA
dir0 = dir('*Phalloidin.tiff');
figure
for k = 1:10
h(k) = subplot(2,5,k)
imagesc(imread(dir0(k).name));
title(num2str(k))
end