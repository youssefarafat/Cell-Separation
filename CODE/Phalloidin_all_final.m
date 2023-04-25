%%  PHALLOIDIN ALL FINAL OUTPUTS
figure
dir0 = dir('*Phalloidin.tiff');
    
    for k = 1:10
        disp(k)
        dataIn1 = imread(dir0(k).name);
        dataOut2 = PhalloidinRBD(dataIn1);
        h1(k) = subplot(2,5,k);
        h2(k) = imagesc(dataOut2.labeled_filt_islands);
        %h2(k) = imagesc(dataIn1);
        %h3(k) = gca;
        title(strcat('Number of Islands=',32,num2str(dataOut2.n_islands,2)))
        ylabel(dir0(k).name,'interpreter','none')
    end
    

    for k = 1:5
    h1(k).Position = [-0.14+k*0.195 0.55 0.145 0.42];
    h1(k).YLabel.FontSize=11;
    h1(k).Title.FontSize=9;

end 

for k = 6:10
    h1(k).Position = [-0.14+(k-5)*0.195 0.05 0.145 0.42];
    h1(k).YLabel.FontSize=11;
    h1(k).Title.FontSize=9;

end 
