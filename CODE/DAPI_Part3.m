%% DAPI METHODS FINAL PART 3
figure

h1 = subplot(2,2,1)
imagesc(central_cells)

h2 = subplot(2,2,2)
imagesc(edges_cells)

h3 = subplot(2,2,3)
imagesc(overlaid_cells)

h4 = subplot(2,2,4)
imagesc(overlaid_cells)
imagesc(overlaid_cells)
hold on 
triplot(DT,x,y);
for k=1:numTriangles
    DTarea            = polyarea(x(DT(k,:)),y(DT(k,:)));
end