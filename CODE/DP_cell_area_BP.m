%% DAPI PHALLOIDIN COMBINATION MEAN CELL AREA RATIO P-VALUE & BOXPLOT
ratio_findings1 = rand(10,2);
[t,p,r] = ttest2(ratio_findings([1:5]),ratio_findings([6:10]))
figure
boxplot(ratio_findings1)
boxplot(ratio_findings)

%t =

     %0


%p =

   % 0.0813


%r =

   %1.0e-03 *

   %-0.3769    0.0273