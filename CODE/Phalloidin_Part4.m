%% PHALLOIDIN METHOD PART 4 
figure

subplot(2,5,1)
h1= imagesc(edge_filtered)
h1=gca;

subplot(2,5,2)
h2 = imagesc(islands)
h2 = gca;

subplot(2,5,3)
h3= imagesc(filtered_islands)
h3 = gca;

subplot(2,5,4)
h4=imagesc(labeled_filt_islands)
h4 = gca;

subplot(2,5,6)
h6 = imagesc(edge_filtered)
h6 = gca;
h6.XLim=[700 950];
h6.YLim=[200 400];

subplot(2,5,7)
h7 = imagesc(islands)
h7 = gca;
h7.XLim=[700 950];
h7.YLim=[200 400];

subplot(2,5,8)
h8 = imagesc(filtered_islands)
h8 = gca;
h8.XLim= [700 950];
h8.YLim= [200 400];

subplot(2,5,9)
h9 = imagesc(labeled_filt_islands)
h9 = gca;
h9.XLim= [700 950];
h9.YLim= [200 400];

for k = 1:4
    h(k).Position = [-0.14+k*0.195 0.55 0.145 0.42];
    h(k).YLabel.FontSize=11;
    h(k).Title.FontSize=9;

end 

for k = 6:9
    h(k).Position = [-0.14+(k-5)*0.195 0.05 0.145 0.42];
    h(k).YLabel.FontSize=11;
    h(k).Title.FontSize=9;

end 

filename='Phalloidin_segmentation_4.png';
print('-dpng','-r200',filename)