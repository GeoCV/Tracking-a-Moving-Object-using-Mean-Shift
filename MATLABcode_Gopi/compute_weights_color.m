function weights = compute_weights_color(imPatchOld, TargetModel, ColorModel, Nbins)
%function to compute weights

% get size of patch
[nRows, nCols, nChannels] = size(imPatchOld);
binIntRange = 256/Nbins; %range of each bin

binMat = zeros(nRows, nCols); %to get the bin value of each pixel
weights = zeros(nRows, nCols, nChannels);

for nChannel = 1 : nChannels
    imPatch = imPatchOld(:,:,nChannel);
    % loop for each pixel and calculate weight
    for nRow = 1 : nRows
        for nCol = 1 : nCols
            
            for m = 0 : Nbins-1
                % check which bin to increment for each intensity
                if ((imPatch(nRow, nCol) >= m * binIntRange) && (imPatch(nRow, nCol) <= ((m+1) * binIntRange)-1))
                    binMat(nRow, nCol) = m+1;
                    break;
                end
            end
            
            % for each pixel calculate weight from targetmodel and colormodel
            % for the bin it belongs to!
            for u = 1 : Nbins
                deltaDiff = binMat(nRow, nCol) - u;
                %to check which bin it belongs to!
                if deltaDiff == 0
                    weights(nRow, nCol, nChannel) = sqrt(TargetModel(u)/ColorModel(u)); %calculate weight
                    break;
                else
                    continue;
                end
            end
        end
    end
end