function colorDistribution = color_distribution(imPatch, Nbins)
% function to compute color distribition of a GRAY LEVEL patch given the number of
% bins

[nRows, nCols] = size(imPatch);
colorDistribution = zeros(1, Nbins);

binIntRange = 256/Nbins;

binMat = zeros(nRows, nCols);

% find the correct bin to each pixel (x,y)
for nRow = 1 : nRows
    for nCol = 1 : nCols
        
        for m = 0 : Nbins-1
            % check which bin to increment for each intensity
            if ((imPatch(nRow, nCol) > m * binIntRange) && (imPatch(nRow, nCol) < ((m+1) * binIntRange)-1))
                binMat(nRow, nCol) = m+1;
                break;
            end
        end
        
        %calculate distance between each pixel and center and normalise
        %with max distance
        distance = norm([nRow nCol] - [nRows/2 nCols/2])/norm([1 1] - [nRows/2 nCols/2]);
        if distance < 1
            kernelDist = 1/(2*pi) * (1-distance);
        else
            kernelDist = 0;
        end
        
        %check which bin the pixel correspond to and increment the color
        %distribution of the same bin
        for u = 1 : Nbins
            deltaDiff = binMat(nRow, nCol) - u;
            
            if deltaDiff == 0
                delta = 1;
                intResult = kernelDist * delta;
                colorDistribution(1,u) = colorDistribution(1,u) + intResult;
                break;
            else
                continue;
            end
        end
    end
    
end
colorDistribution = colorDistribution/sum(colorDistribution);
% bar(colorDistribution)




