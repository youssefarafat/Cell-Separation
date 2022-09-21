 %% DAPI PHALLOIDIN COMBINATION MEAN UNIQUE CELLS ISLAND  P-VALUE & BOXPLOT

unique_findings1 = rand(10,2);
[t1,p1,r1] = ttest2(unique_findings([1:5]),unique_findings([6:10]))
figure
boxplot(unique_findings1)
boxplot(unique_findings)  

%t1 =

    % 0


%p1 =

   % 0.2569


%r1 =

  %-52.8482   16.2616