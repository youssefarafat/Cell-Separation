%% PHALLOIDIN METHOD PART 1 
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