%% DAPI METHODS FINAL PART 2
figure 

subplot(2,5,1)
h1 = imagesc(blue_channel_filled);
h1 = gca;
colormap(h1,[0 0 0 ;rand(64,3)])

subplot(2,5,2)
h2 = imagesc(cells_single);
h2 = gca;


subplot(2,5,3)
h3 = imagesc(cells_merged);
h3 = gca;
colormap(h3,[0 0 0 ;rand(64,3)])

subplot(2,5,4)
h4 = imagesc(cells_3morecells);
h4 = gca;
colormap(h4,[0 0 0 ;rand(64,3)])

subplot(2,5,5)
h5 = imagesc(cells_2cells);
h5 = gca;
colormap(h5,[0 0 0 ;rand(64,3)])


subplot(2,5,6)
h6 = imagesc(blue_channel_filled);
h6 = gca;
h6.XLim=[0 400];
h6.YLim=[0 400];
colormap(h6,[0 0 0 ;rand(64,3)])


subplot(2,5,7)
h7 = imagesc(cells_single);
h7 = gca;
h7.XLim=[0 400];
h7.YLim=[0 400];


subplot(2,5,8)
h8 = imagesc(cells_merged);
h8 = gca;
h8.XLim=[700 1000];
h8.YLim=[200 450];
colormap(h8,[0 0 0 ;rand(64,3)])

subplot(2,5,9)
h9 = imagesc(cells_3morecells);
h9 = gca;
h9.XLim=[0 400];
h9.YLim=[0 400];
colormap(h9,[0 0 0 ;rand(64,3)])

subplot(2,5,10)
h10 = imagesc(cells_2cells);
h10 = gca;
h10.XLim=[700 1000];
h10.YLim=[200 450];
colormap(h10,[0 0 0 ;rand(64,3)])

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

filename='DAPI_segmentation_2.png';
print('-dpng','-r200',filename)