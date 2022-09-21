
%% DAPI METHODS FINAL PART 1 
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