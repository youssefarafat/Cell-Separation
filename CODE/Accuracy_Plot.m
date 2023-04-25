%% Accuracy PLot

figure

h(1) = subplot(1,2,1)
imagesc((GT>0)+2*(central_cells>0))
 %h(1).Position = [-0.14+k*0.195 0.55 0.145 0.42];
 h(1).YLabel.FontSize=11;
 h(1).Title.FontSize=9;

colormap gray
h(2) = subplot (1,2,2)
imagesc((GT>0)+2*(central_cells>0))
colormap gray
h(2).XLim = [200 350];
h(2).YLim = [50 250];
%h(2).Position = [-0.14+k*0.195 0.55 0.145 0.42];
h(2).YLabel.FontSize=11;
h(2).Title.FontSize=9;

