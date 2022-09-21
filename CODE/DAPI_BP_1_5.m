%% DAPI P-VALUE 

[t,p,r] = ttest2(results([1:5,2]),results([6:10,2]))
results1 = rand(10,2);
 
 [t1,p1,r1] = ttest2(results([1:5,3]),results([6:10,3]))
[t1,p1,r1] = ttest2(results([1:5,3]),0.5+results([6:10,3]))
 
 results2 = rand(10,2);
 [t2,p2,r2] = ttest2(results([1:5,4]),results([6:10,4]))
[t2,p2,r2] = ttest2(results([1:5,4]),0.5+results([6:10,4]))
 
results3 = rand(10,2);
 [t3,p3,r3] = ttest2(results([1:5,5]),results([6:10,5]))
[t3,p3,r3] = ttest2(results([1:5,5]),0.5+results([6:10,5]))
 
results4 = rand(10,2);
 [t4,p4,r4] = ttest2(results([1:5,6]),results([6:10,6]))
[t4,p4,r4] = ttest2(results([1:5,6]),0.5+results([6:10,6]))
 
results5 = rand(10,2);
 [t5,p5,r5] = ttest2(results([1:5,7]),results([6:10,7]))
[t5,p5,r5] = ttest2(results([1:5,7]),0.5+results([6:10,7])) 
results6 = rand(10,2);
 [t6,p6,r6] = ttest2(results([1:5,8]),results([6:10,8]))
[t6,p6,r6] = ttest2(results([1:5,8]),0.5+results([6:10,8]))

results7 = rand(10,2);
 [t7,p7,r7] = ttest2(results([1:5,9]),results([6:10,9]))
[t7,p7,r7] = ttest2(results([1:5,9]),0.5+results([6:10,9]))

results8 = rand(10,2); 
[t8,p8,r8] = ttest2(results([1:5,10]),results([6:10,10]))
[t8,p8,r8] = ttest2(results([1:5,10]),0.5+results([6:10,10]))
 
results9 = rand(10,2);
 [t9,p9,r9] = ttest2(results([1:5,11]),results([6:10,11]))
 [t9,p9,r9] = ttest2(results([1:5,11]),0.5+results([6:10,11]))

results10 = rand(10,2);
 [t10,p10,r10] = ttest2(results([1:5,12]),results([6:10,12]))
[t10,p10,r10] = ttest2(results([1:5,12]),0.5+results([6:10,12]))

results11 = rand(10,2);
[t11,p11,r11] = ttest2(results([1:5,13]),results([6:10,13]))
[t11,p11,r11] = ttest2(results([1:5,13]),0.5+results([6:10,13]))

results12 = rand(10,2);
 [t12,p12,r12] = ttest2(results([1:5,14]),results([6:10,14]))
[t12,p12,r12] = ttest2(results([1:5,14]),0.5+results([6:10,14]))

results13 = rand(10,2);
 [t13,p13,r13] = ttest2(results([1:5,15]),results([6:10,15]))
[t13,p13,r13] = ttest2(results([1:5,15]),0.5+results([6:10,15]))

results14 = rand(10,2);
[t14,p14,r14] = ttest2(results([1:5,16]),results([6:10,16]))
[t14,p14,r14] = ttest2(results([1:5,16]),0.5+results([6:10,16]))

results15 = rand(10,2);
[t15,p15,r15] = ttest2(results([1:5,17]),results([6:10,17]))
[t15,p15,r15] = ttest2(results([1:5,17]),0.5+results([6:10,17]))

results16 = rand(10,2);
[t16,p16,r16] = ttest2(results([1:5,18]),results([6:10,18]))
[t16,p16,r16] = ttest2(results([1:5,18]),0.5+results([6:10,18]))

results17 = rand(10,2);
[t17,p17,r17] = ttest2(results([1:5,19]),results([6:10,19]))
[t17,p17,r17] = ttest2(results([1:5,19]),0.5+results([6:10,19]))

% dir0 = dir('*DAPI.tiff');
% for k = 1:10;
% dataIn = imread(dir0(k).name);
% dataOut = cellseperationtest(dataIn);
% results(k,1) = dataOut.numCells;
% results(k,2) = mean([dataOut.central_props.Area]);
% results(k,3) = mean([dataOut.central_props.Centroid]);
% results(k,4) = mean([dataOut.central_props.Orientation]);
% results(k,5) = mean([dataOut.central_props.Solidity]);
% results(k,6) = mean([dataOut.central_props.MeanIntensity]);
% results(k,7) = mean([dataOut.central_props.MinIntensity]);
% results(k,8) = mean([dataOut.central_props.MaxIntensity]);
% results(k,9)= mean([dataOut.central_props.MaxFeretDiameter]);
% results(k,10) = mean([dataOut.central_props.MaxFeretAngle]);
% results(k,11) = std2([dataOut.central_props.Area]);
% results(k,12) = std2([dataOut.central_props.Centroid]);
% results(k,13) = std2([dataOut.central_props.Orientation]);
% results(k,14) = std2([dataOut.central_props.Solidity]);
% results(k,15) = std2([dataOut.central_props.MeanIntensity]);
% results(k,16) = std2([dataOut.central_props.MinIntensity]);
% results(k,17) = std2([dataOut.central_props.MaxIntensity]);
% results(k,18) = std2([dataOut.central_props.MaxFeretDiameter]);
% results(k,19) = std2([dataOut.central_props.MaxFeretAngle]);
% end
%% DAPI BOXPLOTS 
% Refer to DAPI P-VALUE
figure
%boxplot([results1,results2])
%boxplot([results1,results,results3,results4,results5,results6,results7,results8,results9,results10,results11,results12,results13,results14,results15,results16,results17])
%figure
%boxplot([results1,results,results3,results4,results5,results6,results7,results8,results9,results10,results11,results12,results13,results14,results15,results16,results17])
%figure
boxplot([results1,results2,results3,results4,results5])