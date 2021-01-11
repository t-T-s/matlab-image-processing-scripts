function [summation] = getSum(vector)

summation = 0;
    for elem = 1:length(vector)
        summation = summation+vector(elem);
    end
end