function [machines] = BeowulfReadMachines()
    temp = webread('https://beowulf-rocket.herokuapp.com/machines');
    c = count(temp,'<tr>') - 1;
    VarTypes = {'string','string','string','string'};
    VarNames = {'id','status','ip','last_seen'};
    machines = table('Size',[0,4],'VariableTypes',VarTypes,'VariableNames',VarNames);
    temp = temp(strfind(temp,'<tbody>')+length('<tbody>'):end);

    for i = (1:c)
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        machines.id(i) = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        machines.ip(i) = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        machines.status(i) = (temp(1:strfind(temp,'</td>')-1));
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        machines.last_seen(i) = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<tr>')+length('<tr>'):end);
    end
end