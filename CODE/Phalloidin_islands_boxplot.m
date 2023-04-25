
dirPhalloidin       = dir('*Phalloi*.tiff');

for k = 1:10
    disp(k)

    dataIn1 = imread(dirPhalloidin(k).name);
    dataOut2 = PhalloidinRBD(dataIn1);
    results(k) = dataOut2.n_islands
  
end

[t,p,r] = ttest2(results(1:5), results(6:10));
figure
boxplot(results,[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p,2)))
filename='Phalloidin_islands_boxplot.png';
print('-dpng','-r200',filename)
