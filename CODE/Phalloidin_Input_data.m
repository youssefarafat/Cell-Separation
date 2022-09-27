  %% PHALLOIDIN INPUT DATA
dir0 = dir('*Phalloidin.tiff');
figure
for k = 1:10
h(k) = subplot(2,5,k)
imagesc(imread(dir0(k).name));
ylabel(dir0(k).name,'interpreter','none')
title(num2str(k))
end

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
