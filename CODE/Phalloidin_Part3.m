%% PHALLOIDIN METHOD PART 3
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
