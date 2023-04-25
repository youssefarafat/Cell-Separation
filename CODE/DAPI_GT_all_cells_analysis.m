dir0 = dir('*DAPI.tiff');
dirGT = dir('*GT.mat');

figure

for k = 1:10
disp(k)    
dataIn = imread(dir0(k).name);
GTinitial = load(dirGT(k).name);
dataOut = cellseperationtest(dataIn,GTinitial);
h(k) = subplot(2,5,k);
imagesc(dataOut.GTDAPI)
title(strcat('A=',32,num2str(dataOut.Accuracy,2),',J=',32,num2str(dataOut.Jaccard,2),',D=',num2str(dataOut.DICE_measure,2),',Cells/GT=',num2str(dataOut.numCells,2),'/',num2str(dataOut.num_GTCells,2)))
ylabel(dir0(k).name,'interpreter','none');
colormap gray
end


for k = 1:5
    h(k).Position = [-0.14+k*0.195 0.55 0.145 0.42];
    h(k).YLabel.FontSize=11;
    h(k).Title.FontSize=8;

end 

for k = 6:10
    h(k).Position = [-0.14+(k-5)*0.195 0.05 0.145 0.42];
    h(k).YLabel.FontSize=11;
    h(k).Title.FontSize=8;

end 