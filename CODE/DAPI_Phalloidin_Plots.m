figure(1)

subplot(2,6,1)
imagesc(dataIn)

subplot(2,6,2)
imagesc(blue_channel)

subplot(2,6,3)
imagesc(blue_channel_filt)

subplot(2,6,4)
imagesc(blue_channel_thres)

subplot(2,6,5)
imagesc(blue_channel_labelled)

subplot(2,6,6)
imagesc(blue_channel_filled)

subplot(2,6,7)
imagesc(cells_0)

subplot(2,6,8)
imagesc(cells_single)

subplot(2,6,9)
imagesc(cells_merged)

subplot(2,6,10)
imagesc(cells_3morecells)

subplot(2,6,11)
imagesc(cells_2cells)

subplot(2,6,12)
imagesc(all_cells)

%%
figure(2)

subplot(2,2,1)
imagesc(central_cells)

subplot(2,2,2)
imagesc(edges_cells)

subplot(2,2,3)
imagesc(overlaid_cells)

subplot(2,2,4)
imagesc(overlaid_cells)
imagesc(overlaid_cells)
hold on 
triplot(DT,x,y);
for k=1:numTriangles
    DTarea            = polyarea(x(DT(k,:)),y(DT(k,:)));
end

%%
figure(1)

subplot(2,6,1)
h1 = imagesc(dataIn)

subplot(2,6,2)
h2 = imagesc(blue_channel)

subplot(2,6,3)
h3 = imagesc(blue_channel_filt)

subplot(2,6,4)
h4 = imagesc(blue_channel_thres)

subplot(2,6,5)
h5 = imagesc(blue_channel_labelled)

subplot(2,6,6)
h6 = imagesc(blue_channel_filled)

subplot(2,6,7)
h7x = imagesc(dataIn);
h7x = gca;
h7x.Xlim=[0 400]
h7x.Ylim=[0 400]


subplot(2,6,8)
h8x = imagesc(blue_channel);
h8x = gca;
h8x.Xlim=[0 400]
h8x.Ylim=[0 400]

subplot(2,6,9)
h9x = imagesc(blue_channel_filt);
h9x = gca;
h9x.Xlim=[0 400]
h9x.Ylim=[0 400]

subplot(2,6,10)
h10x = imagesc(blue_channel_thres);
h10x = gca;
h10x.XLim=[0 400]
h10x.YLim=[0 400]

subplot(2,6,11)
h11x = imagesc(blue_channel_labelled);
h11x = gca;
h11x.XLim=[0 400]
h11x.YLim=[0 400]

%%
figure 

subplot(2,6,1)
h13x = imagesc(cells_0);
h13x = gca;


subplot(2,6,2)
h14x = imagesc(cells_single);
h14x = gca;

subplot(2,6,3)
h15x = imagesc(cells_merged);
h15x = gca;

subplot(2,6,4)
h16x = imagesc(cells_3morecells);
h16x = gca;

subplot(2,6,5)
h17x = imagesc(cells_2cells);
h17x = gca;

subplot(2,6,6)
h18x = imagesc(all_cells);
h18x = gca;

subplot(2,6,7)
h19x = imagesc(cells_0);
h19x = gca;
h19x.XLim=[0 400];
h19x.YLim=[0 400];


subplot(2,6,8)
h20x = imagesc(cells_single);
h20x = gca;
h20x.XLim=[0 400];
h20x.YLim=[0 400];


subplot(2,6,9)
h21x = imagesc(cells_merged);
h21x = gca;
h21x.XLim=[0 400];
h21x.YLim=[0 400];

subplot(2,6,10)
h22x = imagesc(cells_3morecells);
h22x = gca;
h22x.XLim=[0 400];
h22x.YLim=[0 400];

subplot(2,6,11)
h23x = imagesc(cells_2cells);
h23x = gca;
h23x.XLim=[0 400];
h23x.YLim=[0 400];

subplot(2,6,12)
h24x = imagesc(all_cells);
h24x = gca;
h24x.XLim=[0 400];
h24x.YLim=[0 400];

%%
dir0 = dir('*DAPI.tiff');
figure
for k = 1:10
dataIn = imread(dir0(k).name);
dataOut = cellseperationtest(dataIn);
subplot(2,5,k)
h(k) = imagesc(dataOut.overlaid)
h(k) = gca;
end

%%
figure

subplot(2,5,1)
dataIn = imread("RBD_LKR13_1_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h1y = imagesc(dataOut.overlaid);
h1y=gca;

subplot(2,5,2)
dataIn = imread("RBD_LKR13_Rep1_1_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h2y = imagesc(dataOut.overlaid);
h2y=gca;

subplot(2,5,3)
dataIn = imread("RBD_LKR13_Rep1_2_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h3y = imagesc(dataOut.overlaid);
h3y=gca;

subplot(2,5,4)
dataIn = imread("RBD_LKR13_Rep1_4_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h4y = imagesc(dataOut.overlaid);
h4y=gca;

subplot(2,5,5)
dataIn = imread("RBD_LKR13_Rep1_5_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h5y = imagesc(dataOut.overlaid);
h5y=gca;

subplot(2,5,6)
dataIn = imread("WT_LKR13_1_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h6y = imagesc(dataOut.overlaid);
h6y=gca;

subplot(2,5,7)
dataIn = imread("WT_LKR13_Rep1_1_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h7y = imagesc(dataOut.overlaid);
h7y=gca;

subplot(2,5,8)
dataIn = imread("WT_LKR13_Rep1_2_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h8y = imagesc(dataOut.overlaid);
h8y=gca;

subplot(2,5,9)
dataIn = imread("WT_LKR13_Rep1_3_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h9y = imagesc(dataOut.overlaid);
h9y=gca;

subplot(2,5,10)
dataIn = imread("WT_LKR13_Rep1_6_DAPI.tiff");
dataOut = cellseperationtest(dataIn);
h10y = imagesc(dataOut.overlaid);
h10y=gca;

%%
dir0 = dir('*DAPI.tiff');
figure
for k = 1:10
    h(k) = imagesc(imread(dir0(k).name));
h(k) = gca;
end

%%
dir0 = dir('*DAPI.tiff');
figure
for k = 1:10
h(k) = imagesc(imread(dir0(k).name));
h(k) = gca;
subplot(2,5,k)
end
%%
dir0 = dir('*DAPI.tiff')
numFiles            = numel(dir0);
figure(10)
for k =1:numFiles
   subplot(2,5,k)
    
    imagesc(imread(strcat(filesep,dir0(k).name)))
    ylabel(dir0(k).name,'interpreter','none')
end

%%
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

%%
figure
boxplot([results1,results2])
boxplot([results1,results,results3,results4,results5,results6,results7,results8,results9,results10,results11,results12,results13,results14,results15,results16,results17])
figure
boxplot([results1,results,results3,results4,results5,results6,results7,results8,results9,results10,results11,results12,results13,results14,results15,results16,results17])
figure
boxplot([results1,results2,results3,results4,results5])
figure
boxplot([results6,results7,results8,results9,results10])
figure
boxplot([results11,results12,results13,results14,results15,results16,results17])

%%
figure
subplot(2,4,1)
h(1) = imagesc(imread("RBD_LKR13_1_Phalloidin.tiff"))
h(1) = gca;

subplot(2,4,2)
h(2) = imagesc(red_channelR)
h(2) = gca;

subplot(2,4,3)
h(3) = imagesc(red_channelR_filt)
h(3) = gca;

subplot(2,4,4)
h(4) = imagesc(red_channelR_thres)
h(4) = gca;

subplot(2,4,5)
h(5) = imagesc(imread("RBD_LKR13_1_Phalloidin.tiff"))
h(5) = gca;
h(5).XLim=[700 950];
h(5).YLim=[200 400];

subplot(2,4,6)
h(6) = imagesc(red_channelR)
h(6) = gca;
h(6).XLim=[700 950];
h(6).YLim=[200 400];

subplot(2,4,7)
h(7) = imagesc(red_channelR_filt)
h(7) = gca;
h(7).XLim=[700 950];
h(7).YLim=[200 400];

subplot(2,4,8)
h(8) = imagesc(red_channelR_thres)
h(8) = gca;
h(8).XLim= [700 950];
h(8).YLim= [200 400];

%%
figure
subplot(2,4,1)
h(1) = imagesc((red_channelR_labelled))
h(1) = gca;

subplot(2,4,2)
h(2) = imagesc(red_channelR_filled)
h(2) = gca;

subplot(2,4,3)
h(3) = imagesc(red_channelR_clean)
h(3) = gca;

subplot(2,4,4)
h(4) = imagesc(red_channelR_closed)
h(4) = gca;

subplot(2,4,5)
h(5) = imagesc(red_channelR_labelled)
h(5) = gca;
h(5).XLim=[700 950];
h(5).YLim=[200 400];

subplot(2,4,6)
h(6) = imagesc(red_channelR_filled)
h(6) = gca;
h(6).XLim=[700 950];
h(6).YLim=[200 400];

subplot(2,4,7)
h(7) = imagesc(red_channelR_clean)
h(7) = gca;
h(7).XLim=[700 950];
h(7).YLim=[200 400];

subplot(2,4,8)
h(8) = imagesc(red_channelR_closed)
h(8) = gca;
h(8).XLim= [700 950];
h(8).YLim= [200 400];

%%
figure

subplot(2,6,1)
h(1) = imagesc((red_channelR_distance))
h(1) = gca;

subplot(2,6,2)
h(2) = imagesc((red_channelR_dilate))
h(2) = gca;

subplot(2,6,3)
h(3) = imagesc(red_channelR_skel)
h(3) = gca;

subplot(2,6,4)
h(4) = imagesc(step4)
h(4) = gca;

subplot(2,6,5)
h(5) = imagesc(red_channelR_dilatesplit)
h(5) = gca;

subplot(2,6,6)
h(6) = imagesc(red_channelR_split)
h(6) = gca;

subplot(2,6,7)
h(7) = imagesc(red_channelR_distance)
h(7) = gca;
h(7).XLim=[700 950];
h(7).YLim=[200 400];

subplot(2,6,8)
h(8) = imagesc(red_channelR_dilate)
h(8) = gca;
h(8).XLim=[700 950];
h(8).YLim=[200 400];

subplot(2,6,9)
h(9) = imagesc(red_channelR_skel)
h(9) = gca;
h(9).XLim=[700 950];
h(9).YLim=[200 400];

subplot(2,6,10)
h(10) = imagesc(step4)
h(10) = gca;
h(10).XLim=[700 950];
h(10).YLim=[200 400];

subplot(2,6,11)
h(11) = imagesc(red_channelR_dilatesplit)
h(11) = gca;
h(11).XLim= [700 950];
h(11).YLim= [200 400];

subplot(2,6,12)
h(12) = imagesc(red_channelR_split)
h(12) = gca;
h(12).XLim= [700 950];
h(12).YLim= [200 400];