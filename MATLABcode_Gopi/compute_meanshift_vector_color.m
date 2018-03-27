function z = compute_meanshift_vector_color(imPatchOld, weights)
%function to compute the mean shift vector

% get size of patch
[nRows, nCols, nChannels] = size(imPatchOld);
zNum = 0;
sum = 0;

for nChannel = 1:nChannels
    for nRow = 1:nRows
        for nCol =1:nCols
            
            %         zNum = [zNum; [nRow nCol].*weights(nRow, nCol)];
            currentLoc = [nRow nCol];
            zNum = zNum + currentLoc.*weights(nRow, nCol, nChannel);
            sum = sum + weights(nRow,nCol, nChannel);
        end
    end
    
    z(nChannel,:) = ceil(zNum/sum);
end
z = mean(z);
