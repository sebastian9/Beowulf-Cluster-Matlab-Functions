inputs = {};
i=1;
while i <= 25
    single_input = [num2str(i^2),'+',num2str(i^3),'+',num2str(i^4),'+',num2str(i*9),'+',num2str(i*2)];
    inputs{i} = single_input;
    i = i+1;
end
disp(inputs)
[outputs,invalid_inputs] = BeowulfMaster(inputs,1);
