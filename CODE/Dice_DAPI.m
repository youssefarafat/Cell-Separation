% Jaccard
%imagesc((GT>0)+(central_cells>0))
%imagesc((GT>0)+2*(central_cells>0))
colormap jet
Jaccard1=((GT>0)+2*(central_cells>0));
Jaccard = (Jaccard1==2)/(Jaccard1>0)
Jaccard = sum(sum(Jaccard1==2))/sum(sum(Jaccard1>0))
Jaccard = sum(sum(Jaccard1==3))/sum(sum(Jaccard1>0))


% Accuracy 
%imagesc((GT>0)+2*(central_cells>0))
%imagesc((GT>0)==(central_cells>0))
truenp1 = ((GT>0)==(central_cells>0));
accuracy_test1 = sum(sum(truenp1 == 1))/sum(sum((truenp1 ==0) +(truenp1 == 1)))
%or
accuracy_test1 = sum(sum(truenp1 == 1))/sum(sum(GT>=0))
%or
accuracy_test1 = sum(sum((GT>0)==(central_cells>0)))/sum(sum(GT>=0))

% DICE 
%imagesc((GT1>0)+2*(central_cells1>0))
DICE_DAPI = ((GT10>0)+2*(central_cells10>0));
TP_DICE = (DICE_DAPI == 3);
FNFP_DICE = (DICE_DAPI > 0 & DICE_DAPI < 3);
DICE_measure10 = sum(sum(2*TP_DICE))/sum(sum((2*TP_DICE) + (FNFP_DICE)))