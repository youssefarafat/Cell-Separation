dirDAPI = dir('*DAPI.tiff');
dirPhalloidin = dir('*Phalloidin.tiff');

for k = 1:10
    disp(k)
    dataIn = imread(dirDAPI(k).name);
    dataIn1 = imread(dirPhalloidin(k).name);
    dataOut = cellseperationtest(dataIn);
    dataOut2 = PhalloidinRBD(dataIn1);
    h(k) = subplot(2,5,k);
    imagesc((dataOut.central_cells)+2*(dataOut2.labeled_filt_islands));
    colormap([0 0 0 ;rand(64,3)])
    title(num2str(k));
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