dir0 = dir('*Phalloidin.tiff');
for k = 1:10
    %disp(k)
    disp(dir0(k).name)
    dataIn = imread(dir0(k).name);
    dataOut = PhalloidinRBD(dataIn);
    results(k,1) = mean([dataOut.edgeprops.Area]);
    results(k,2) = mean([dataOut.edgeprops.Orientation]);
    results(k,3) = mean([dataOut.edgeprops.Circularity]);
    results(k,4) = std2([dataOut.edgeprops.Area]);
    results(k,5) = std2([dataOut.edgeprops.Orientation]);
    results(k,6) = std2([dataOut.edgeprops.Circularity]);
end

dir0 = dir('*Phalloidin.tiff');
for k = 1:10
    disp(dir0(k).name)
    dataIn = imread(dir0(k).name);
    dataOut = PhalloidinRBD(dataIn);
    figure(k)
    imagesc(dataOut.red_channelR_split == red_channelR_split)
end


dir0 = dir('*Phalloidin.tiff')
numFiles            = numel(dir0);
figure(10)
for k =1:numFiles
subplot(2,5,k)
imagesc(imread(strcat(filesep,dir0(k).name)))
ylabel(dir0(k).name,'interpreter','none')
end