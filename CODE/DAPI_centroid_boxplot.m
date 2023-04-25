dirDAPI             = dir('*DAPI.tiff');

for k = 1:10
    disp(k)
    dataIn = imread(dirDAPI(k).name);
    dataOut = cellseperationtest(dataIn);
    results(k) = dataOut.std_DAPI_centroid;
end

[t,p,r] = ttest2(results([1:5]),results([6:10]));

figure
boxplot(results,[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p,2)))
filename11='Std_Centroid_boxplot.png';
print('-dpng','-r200',filename11)