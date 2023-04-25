%% PHALLOIDIN MEAN AREA ISLANDS P-VALUE & BOXPLOT
figure
clear results*
results2=[];
results3=[];
results4=[];

dir0 = dir('*Phalloidin.tiff');
for k = 1:10

    dataIn1 = imread(dir0(k).name);
    dataOut2 = PhalloidinRBD(dataIn1);
    %results(k) = dataOut2.mean_area_islands;
    %results(k) = dataOut2.ftotal_area;
    %results(k) = dataOut2.total_area;
    results2=[results2 ; dataOut2.total_area'];
    results3=[results3 ; k*ones(numel(dataOut2.total_area),1)];

        
    for y = 1:(dataOut2.n_islands)
        %results(k)  = dataOut2.area_results(y);
        results(k,y) = dataOut2.total_area(y);
        %results2=[results2 ; ]
        %results(k) = dataOut2.area_results;
    end
end
%%
[t,p,r] = ttest2(results2([1:19]),results2([20:29]));
%boxplot(results,[1 1 1 1 1 2 2 2 2 2])
(1:10)>5
 boxplot(results2,results3>5,'Labels',{'RBD','WT'})
 title(strcat('p=',32,num2str(p,2)))
 filename='Phalloidin_Area_boxplot.png';
print('-dpng','-r200',filename)

 bar(results2,results3>5)