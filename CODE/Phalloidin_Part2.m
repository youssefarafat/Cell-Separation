%% PHALLOIDIN METHOD PART 2
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