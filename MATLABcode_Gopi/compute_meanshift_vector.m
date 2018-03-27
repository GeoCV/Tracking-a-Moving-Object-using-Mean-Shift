function z = compute_meanshift_vector(imPatch, weights)
%function to compute the mean shift vector

% get size of patch
[nRows, nCols] = size(imPatch);
zNum = 0;
sum = 0;

for nRow = 1:nRows
    for nCol =1:nCols

%         zNum = [zNum; [nRow nCol].*weights(nRow, nCol)];
        currentLoc = [nRow nCol];
        zNum = zNum + currentLoc.*weights(nRow, nCol);
        sum = sum + weights(nRow,nCol);
    end
end

z = ceil(zNum/sum);
% z = flip(z);
% z = z;