%% PHALLOIDIN METHOD PART 2
figure

subplot(2,5,1)
h1 = imagesc(red_channelR_filled)
h1 = gca;

subplot(2,5,2)
h2 = imagesc(red_channelR_clean)
h2 = gca;

subplot(2,5,3)
h3 = imagesc(red_channelR_closed)
h3 = gca;

subplot(2,5,4)
h4 = imagesc((red_channelR_distance))
h4 = gca;

subplot(2,5,5)
h5 = imagesc((red_channelR_dilate))
h5 = gca;

filename='Phalloidin_segmentation_2.png';
print('-dpng','-r200',filename)

subplot(2,5,6)
h6 = imagesc(red_channelR_filled)
h6 = gca;
h6.XLim=[700 950];
h6.YLim=[200 400];

subplot(2,5,7)
h7 = imagesc(red_channelR_clean)
h7 = gca;
h7.XLim=[700 950];
h7.YLim=[200 400];

subplot(2,5,8)
h8 = imagesc(red_channelR_closed)
h8 = gca;
h8.XLim= [700 950];
h8.YLim= [200 400];

subplot(2,5,9)
h9 = imagesc((red_channelR_distance))
h9 = gca;
h9.XLim= [700 950];
h9.YLim= [200 400];

subplot(2,5,10)
h10 = imagesc((red_channelR_dilate))
h10 = gca;
h10.XLim= [700 950];
h10.YLim= [200 400];

for k = 1:5
    h(k).Position = [-0.14+k*0.195 0.55 0.145 0.42];
    h(k).YLabel.FontSize=11;
    h(k).Title.FontSize=9;

end 

for k = 6:10
    h(k).Position = [-0.14+(k-5)*0.195 0.05 0.145 0.42];
    h(k).YLabel.FontSize=11;
    h(k).Title.FontSize=9;

end 
filename='Phalloidin_segmentation_2.png';
print('-dpng','-r200',filename)