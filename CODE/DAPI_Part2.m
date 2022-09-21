%% DAPI METHODS FINAL PART 2
figure 

subplot(2,6,1)
h13x = imagesc(cells_0);
h13x = gca;


subplot(2,6,2)
h14x = imagesc(cells_single);
h14x = gca;

subplot(2,6,3)
h15x = imagesc(cells_merged);
h15x = gca;

subplot(2,6,4)
h16x = imagesc(cells_3morecells);
h16x = gca;

subplot(2,6,5)
h17x = imagesc(cells_2cells);
h17x = gca;

subplot(2,6,6)
h18x = imagesc(all_cells);
h18x = gca;

subplot(2,6,7)
h19x = imagesc(cells_0);
h19x = gca;
h19x.XLim=[0 400];
h19x.YLim=[0 400];


subplot(2,6,8)
h20x = imagesc(cells_single);
h20x = gca;
h20x.XLim=[0 400];
h20x.YLim=[0 400];


subplot(2,6,9)
h21x = imagesc(cells_merged);
h21x = gca;
h21x.XLim=[0 400];
h21x.YLim=[0 400];

subplot(2,6,10)
h22x = imagesc(cells_3morecells);
h22x = gca;
h22x.XLim=[0 400];
h22x.YLim=[0 400];

subplot(2,6,11)
h23x = imagesc(cells_2cells);
h23x = gca;
h23x.XLim=[0 400];
h23x.YLim=[0 400];

subplot(2,6,12)
h24x = imagesc(all_cells);
h24x = gca;
h24x.XLim=[0 400];
h24x.YLim=[0 400];