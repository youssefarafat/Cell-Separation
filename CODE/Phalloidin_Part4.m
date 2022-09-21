%% PHALLOIDIN METHOD PART 4 
figure

subplot(1,5,1)
h(1)= imagesc(edgedetect)
h(1)=gca;

subplot(1,5,2)
h(2) = imagesc(edge_filtered)
h(2) = gca;

subplot(1,5,3)
h(3)= imagesc(islands)
h(3) = gca;

subplot(1,5,4)
h(4)=imagesc(filtered_islands)
h(4) = gca;

subplot(1,5,5)
h(5) = imagesc(labeled_filt_islands)
h(5) = gca;