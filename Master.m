inputs = {};
i=1;
while i <= 25
    single_input = {num2str(randi(100)),num2str(randi(100)),num2str(randi(100)),num2str(randi(100)),num2str(randi(100))};
    inputs{end+1} = single_input;
    i = i+1;
end

[outputs,invalid_inputs] = BeowulfMaster(inputs,1);
