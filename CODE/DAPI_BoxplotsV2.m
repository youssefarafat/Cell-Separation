dir0 = dir('*DAPI.tiff');
%%
for k = 1:10
    dataIn = imread(dir0(k).name);
    dataOut = cellseperationtest(dataIn);
    results(k,1) = dataOut.numCells;
    results(k,2) = mean([dataOut.central_props.Area]);
    results(k,3) = mean([dataOut.central_props.Centroid]);
    results(k,4) = mean([dataOut.central_props.Orientation]);
results(k,5) = mean([dataOut.central_props.Solidity]);
results(k,6) = mean([dataOut.central_props.MeanIntensity]);
results(k,7) = mean([dataOut.central_props.MinIntensity]);
results(k,8) = mean([dataOut.central_props.MaxIntensity]);
results(k,9)= mean([dataOut.central_props.MaxFeretDiameter]);
results(k,10) = mean([dataOut.central_props.MaxFeretAngle]);
results(k,11) = std2([dataOut.central_props.Area]);
results(k,12) = dataOut.std_DAPI_centroid;
results(k,13) = std2([dataOut.central_props.Orientation]);
results(k,14) = std2([dataOut.central_props.Solidity]);
results(k,15) = std2([dataOut.central_props.MeanIntensity]);
results(k,16) = std2([dataOut.central_props.MinIntensity]);
results(k,17) = std2([dataOut.central_props.MaxIntensity]);
results(k,18) = std2([dataOut.central_props.MaxFeretDiameter]);
results(k,19) = std2([dataOut.central_props.MaxFeretAngle]);
end

[t1,p1,r1] = ttest2(results([1:5],1),results([6:10],1))
[t2,p2,r2] = ttest2(results([1:5],2),results([6:10],2))
[t3,p3,r3] = ttest2(results([1:5],3),results([6:10],3))
[t4,p4,r4] = ttest2(results([1:5],4),results([6:10],4))
[t5,p5,r5] = ttest2(results([1:5],5),results([6:10],5))
[t6,p6,r6] = ttest2(results([1:5],6),results([6:10],6))
[t7,p7,r7] = ttest2(results([1:5],7),results([6:10],7))
[t8,p8,r8] = ttest2(results([1:5],8),results([6:10],8))
[t9,p9,r9] = ttest2(results([1:5],9),results([6:10],9))
[t10,p10,r10] = ttest2(results([1:5],10),results([6:10],10))
[t11,p11,r11] = ttest2(results([1:5],11),results([6:10],11))
[t12,p12,r12] = ttest2(results([1:5],12),results([6:10],12))
[t13,p13,r13] = ttest2(results([1:5],13),results([6:10],13))
[t14,p14,r14] = ttest2(results([1:5],14),results([6:10],14))
[t15,p15,r15] = ttest2(results([1:5],15),results([6:10],15))
[t16,p16,r16] = ttest2(results([1:5],16),results([6:10],16))
[t17,p17,r17] = ttest2(results([1:5],17),results([6:10],17))
[t18,p18,r18] = ttest2(results([1:5],18),results([6:10],18))
[t19,p19,r19] = ttest2(results([1:5],19),results([6:10],19))

figure
boxplot(results(:,1),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p1,2)))
filename='Num_cells_boxplot.png';
print('-png','-r200',filename)


figure
boxplot(results(:,2),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p2,2)))
filename1='Mean_Area_boxplot.png';
print('-png','-r200',filename1)

figure
boxplot(results(:,3),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p3,2)))
filename2='Mean_Centroid_boxplot.png';
print('-png','-r200',filename2)

figure
boxplot(results(:,4),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p4,2)))
filename3='Mean_Orientation_boxplot.png';
print('-png','-r200',filename3)

figure
boxplot(results(:,5),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p5,2)))
filename4='Mean_Solidity_boxplot.png';
print('-png','-r200',filename4)

figure
boxplot(results(:,6),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p6,2)))
filename5='Mean_MeanIntensity_boxplot.png';
print('-png','-r200',filename5)

figure
boxplot(results(:,7),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p7,2)))
filename6='Mean_MinIntensity_boxplot.png';
print('-png','-r200',filename6)

figure
boxplot(results(:,8),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p8,2)))
filename7='Mean_MaxIntensity_boxplot.png';
print('-png','-r200',filename7)

figure
boxplot(results(:,9),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p9,2)))
filename8='Mean_MaxFeret_boxplot.png';
print('-png','-r200',filename8)

figure
boxplot(results(:,10),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p10,2)))
filename9='Mean_MaxFeretAngle_boxplot.png';
print('-png','-r200',filename9)

figure
boxplot(results(:,11),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p11,2)))
filename10='Std_Area_boxplot.png';
print('-png','-r200',filename10)

figure
boxplot(results(:,12),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p12,2)))
filename11='Std_Centroid_boxplot.png';
print('-png','-r200',filename11)

figure
boxplot(results(:,13),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p13,2)))
filename12='Std_Orientation_boxplot.png';
print('-png','-r200',filename12)

figure
boxplot(results(:,14),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p14,2)))
filename13='Std_Solidity_boxplot.png';
print('-png','-r200',filename13)

figure
boxplot(results(:,15),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p15,2)))
filename14='Std_MeanIntensity_boxplot.png';
print('-png','-r200',filename14)

figure
boxplot(results(:,16),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p16,2)))
filename15='Std_MinIntensity_boxplot.png';
print('-png','-r200',filename15)

figure
boxplot(results(:,17),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p17,2)))
filename16='Std_MaxIntensity_boxplot.png';
print('-png','-r200',filename16)

figure
boxplot(results(:,18),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p18,2)))
filename17='Std_MaxFeretD_boxplot.png';
print('-png','-r200',filename17)

figure
boxplot(results(:,19),[1 1 1 1 1 2 2 2 2 2],'Labels',{'RBD','WT'})
title(strcat('p=',32,num2str(p19,2)))
filename18='Std_MaxFeretA_boxplot.png';
print('-png','-r200',filename18)