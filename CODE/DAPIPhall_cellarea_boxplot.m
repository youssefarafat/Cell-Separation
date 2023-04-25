dirDAPI             = dir('*DAPI.tiff');
dirPhalloidin       = dir('*Phalloi*.tiff');

for k = 1:10
    disp(k)
    dataIn = imread(dirDAPI(k).name);
    dataOut = cellseperationtest(dataIn);
    dataIn1 = imread(dirPhalloidin(k).name);
    dataOut2 = PhalloidinRBD(dataIn1);
    central_cells_D_P = dataOut.central_cells;
    islands_D_P = dataOut2.labeled_filt_islands;
    dataOut = Dapi_Phalloidin_combination(central_cells_D_P,islands_D_P);
    results(k) = dataOut.fmean_ratio;
end

[t,p,r] = ttest2(results(1:5), results(6:10));
figure
boxplot(results,[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p,2)))
filename='DAPIPhall_cellarea_boxplot.png';
print('-dpng','-r200',filename)

