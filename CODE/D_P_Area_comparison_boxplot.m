dirDAPI             = dir('*DAPI.tiff');
dirPhalloidin       = dir('*Phalloi*.tiff');

for k = 1:10
    disp(k)
    dataIn = imread(dirDAPI(k).name);
    dataOut = cellseperationtest(dataIn);
    dataIn1 = imread(dirPhalloidin(k).name);
    dataOut2 = PhalloidinRBD(dataIn1);
    D_results = dataOut.total_cell_area
    P_results  = dataOut2.ftotal_area
    results(k) = D_results/P_results
end

[t,p,r] = ttest2(results(1:5), results(6:10));
figure
boxplot(results,[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p,2)))
filename='D_P_Area_comparison_boxplot.png';
print('-dpng','-r200',filename)


bar(results);