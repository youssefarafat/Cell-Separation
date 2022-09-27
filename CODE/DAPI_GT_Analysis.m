dir0 = dir('*DAPI.tiff');
dirGT = dir('*GT.mat');


figure
for k = 1:10
disp(k)    
dataIn = imread(dir0(k).name);
GTinitial = load(dirGT(k).name);
dataOut = cellseperationtest(dataIn,GTinitial);
h1(k) = subplot(2,5,k)
imagesc(dataOut.GTDAPI)
title(strcat('A=',32,num2str(dataOut.Accuracy,2),',J=',32,num2str(dataOut.Jaccard,2),',D=',num2str(dataOut.DICE_measure)))
ylabel = ylabel(dir0(k).name,'interpreter','none')

end

