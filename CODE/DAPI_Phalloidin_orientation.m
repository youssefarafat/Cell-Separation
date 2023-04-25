dirDAPI             = dir('*DAPI.tiff');
dirPhalloidin       = dir('*Phalloi*.tiff');

for k = 1:10
    disp(k)
    dataIn = imread(dirDAPI(k).name);
    dataOut = cellseperationtest(dataIn);
    dataIn1 = imread(dirPhalloidin(k).name);
    dataOut2 = PhalloidinRBD(dataIn1);
    results(k) = ((dataOut.DAPI_orientation)/(dataOut2.islands_orientation));
end

[t,p,r] = ttest2(results([1:5]), results([6:10]));
figure
boxplot(results,[1 1 1 1 1 2 2 2 2 2])
title(strcat('p=',32,num2str(p,2)))

for k = 1:10
    disp(k)
    dataIn = imread(dirDAPI(k).name);
    dataOut = cellseperationtest(dataIn);
    dataIn1 = imread(dirPhalloidin(k).name);
    dataOut2 = PhalloidinRBD(dataIn1);
    results(k) = ((dataOut.std_DAPI_orientation)/(dataOut2.std_islands_orientation));
end



[t,p,r] = ttest2(results([1:5]), results([6:10]));
figure
boxplot(results,[1 1 1 1 1 2 2 2 2 2])
title(strcat('p=',32,num2str(p,2)))
