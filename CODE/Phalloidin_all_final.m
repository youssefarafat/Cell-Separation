%%  PHALLOIDIN ALL FINAL OUTPUTS
figure
dir0 = dir('*Phalloidin.tiff');
    
    for k = 1:10
        disp(k)
        dataIn1 = imread(dir0(k).name);
        dataOut = PhalloidinRBD(dataIn1);
        h1(k) = subplot(2,5,k);
        h2(k) = imagesc(dataOut.labeled_filt_islands);
        %h2(k) = imagesc(dataIn1);
        %h3(k) = gca;
        title(num2str(k))
    end