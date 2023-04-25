%%DAPI & PHALLOIDIN COMBINATION
function dataOut = Dapi_Phalloidin_combination(central_cells_D_P,islands_D_P)




%central_cells_D_P = dataOut.central_cells;
%islands_D_P = dataOut.islands;
%dataIn2 = ((central_cells_D_P).*(islands_D_P));
island_properties = regionprops(islands_D_P,'Area');
%must find out how to find number of labels,*SOLVED* look down.
n_island_image = max(islands_D_P(:));
for k = 1:n_island_image  
    Cells_in_Island = ((central_cells_D_P).*(islands_D_P==k));
    %disp('-----')
    %disp(k)
    uni_cells= unique(Cells_in_Island);
    nnz_uni_cells(k) = nnz(uni_cells);
    Unique_cells_island = sum(nnz_uni_cells(k));
    cells_area_ratio = (Unique_cells_island)/(island_properties(k).Area);
    loop_fmean_unique_cells_island = sum(nnz_uni_cells)/n_island_image;
    ratio_sum(k) = (cells_area_ratio);
    loop_fmean_ratio = sum(ratio_sum/(n_island_image));
end
fmean_unique_cells_island = sum(nnz_uni_cells)/n_island_image;
fmean_ratio = sum(ratio_sum/(n_island_image));

dataOut.Unique_cells_island = Unique_cells_island;
dataOut.cells_area_ratio = cells_area_ratio;
dataOut.fmean_unique_cells_island = fmean_unique_cells_island;
dataOut.fmean_ratio = fmean_ratio;

end

%%
%mean_ratio ttest 
%[t,p,r] =
%ttest2(([mean_ratio1,mean_ratio2,mean_ratio3,mean_ratio4,mean_ratio5]),([mean_ratio6,mean_ratio7,mean_ratio8,mean_ratio9,mean_ratio10]));
%t =

     %0


%p =

    %0.7810


%r =

   %-0.0714    0.0917
%mean_unique ttest
%[t1,p1,r1] = ttest2(([mean_unique1,mean_unique2,mean_unique3,mean_unique4,mean_unique5]),([mean_unique6,mean_unique7,mean_unique8,mean_unique9,mean_unique10]))
%t1 =

     %0


%p1 =

    %0.4233


%r1 =

   %-2.4085    5.1879

%[t,p,r] = ttest2(([fmean_ratio1,fmean_ratio2,fmean_ratio3,fmean_ratio4,fmean_ratio5]),([fmean_ratio6,fmean_ratio7,fmean_ratio8,fmean_ratio9,fmean_ratio10]))

%t =

     %0


%p =

    %0.0813


%r =

   %1.0e-03 *

  % -0.3769    0.0273

%[t1,p1,r1] = ttest2(([fmean_unique_cells_island1,fmean_unique_cells_island2,fmean_unique_cells_island3,fmean_unique_cells_island4,fmean_unique_cells_island5]),([fmean_unique_cells_island6,fmean_unique_cells_island7,fmean_unique_cells_island8,fmean_unique_cells_island9,fmean_unique_cells_island10]))

%t1 =

     %0


%p1 =

    %0.1642


%r1 =

  %-57.4407   11.5968   
