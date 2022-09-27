%% Accuracy PLot

GT = GT1;
central_cells = central_cells1;

h(1) = subplot(1,2,1)
imagesc((GT>0)+2*(central_cells>0))

h(2) = subplot (1,2,2)
imagesc((GT>0)+2*(central_cells>0))
h(2).XLim = [200 350];
h(2).YLim = [50 250];

