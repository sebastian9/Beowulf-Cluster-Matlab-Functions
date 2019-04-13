function [result] = add(INPUTS)
    result = 0;
    for i = 1:length(INPUTS)
       result = result + INPUTS(i); 
    end
end