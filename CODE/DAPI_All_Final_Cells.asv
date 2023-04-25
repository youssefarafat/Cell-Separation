%% DAPI All Final Plot
dir0 = dir('*DAPI.tiff');
figure
for k = 1:10
disp(k)    
dataIn = imread(dir0(k).name);
dataOut = cellseperationtest(dataIn);
h(k) = subplot(2,5,k)
imagesc(dataOut.overlaid)
title(num2str(k))
%ylabel = ylabel(dir0(k).name,'interpreter','none')

end

for k = 1:5
    h(k).Position = [-0.14+k*0.195 0.55 0.145 0.42];
    h(k).YLabel.FontSize=11;
    h(k).Title.FontSize=9;

end 

for k = 6:10
    h(k).Position = [-0.14+(k-5)*0.195 0.05 0.145 0.42];
    h(k).YLabel.FontSize=11;
    h(k).Title.FontSize=9;

end 