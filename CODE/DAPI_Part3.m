%% DAPI METHODS FINAL PART 3
figure
 h1 = subplot (2,5,1)
 imagesc(all_cells)
 colormap(h1,[0 0 0 ;rand(64,3)])


 h2 = subplot(2,5,2)
imagesc(central_cells)
colormap(h2,[0 0 0 ;rand(64,3)])


h3 = subplot(2,5,3)
 imagesc(edges_cells)

h4 = subplot(2,5,4)
imagesc(overlaid_cells)

h5 = subplot(2,5,5)
imagesc(overlaid_cells)
imagesc(overlaid_cells)
hold on 
triplot(DT,x,y);
for k=1:numTriangles
    DTarea            = polyarea(x(DT(k,:)),y(DT(k,:)));
end

h6 = subplot(2,5,6)
 imagesc(all_cells)
h6.XLim=[0 400];
h6.YLim=[0 400];
colormap(h6,[0 0 0 ;rand(64,3)])


h7 = subplot(2,5,7)
imagesc(central_cells)
h7.XLim=[0 400];
h7.YLim=[0 400];
colormap(h7,[0 0 0 ;rand(64,3)])

h8 = subplot(2,5,8)
imagesc(edges_cells)
h8.XLim=[0 400];
h8.YLim=[0 400];

h9 = subplot(2,5,9)
imagesc(overlaid_cells)
h9.XLim=[0 400];
h9.YLim=[0 400];

h10 = subplot(2,5,10)
imagesc(overlaid_cells)
imagesc(overlaid_cells)
hold on 
triplot(DT,x,y);
for k=1:numTriangles
    DTarea            = polyarea(x(DT(k,:)),y(DT(k,:)));
end
h10.XLim=[0 400];
h10.YLim=[0 400];

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
filename='DAPI_segmentation_3.png';
print('-dpng','-r200',filename)