function [result] = mysum(INPUTS)
    result = 0;
    for i = 1:length(INPUTS)
       result = result + INPUTS(i); 
    end
    pause(5)
end