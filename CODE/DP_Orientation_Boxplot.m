dirDAPI             = dir('*DAPI.tiff');
dirPhalloidin       = dir('*Phalloi*.tiff');
results2 = [];
results3 = [];

for k = 1:10
    disp(k)
    dataIn = imread(dirDAPI(k).name);
    dataOut = cellseperationtest(dataIn);
    dataIn1 = imread(dirPhalloidin(k).name);
    dataOut2 = PhalloidinRBD(dataIn1);
    results2 = [ results2 ;((dataOut.DAPI_orientation)-(dataOut2.islands_orientation))'];
    results3=[results3 ; k*ones(numel((dataOut.DAPI_orientation)-(dataOut2.islands_orientation)),1)];

end
[t,p,r] = ttest2(results2([1:243]),results2([244:445]))
%boxplot(results,[1 1 1 1 1 2 2 2 2 2])
%(1:10)>5
figure
 boxplot(results2,results3>5,'Labels',{'RBD','WT'})
 title(strcat('p=',32,num2str(p,2)))

 filename='DP_Orientation_Boxplot.png';
print('-dpng','-r200',filename)