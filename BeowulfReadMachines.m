function [machines] = BeowulfReadMachines()
    temp = webread('https://beowulf-rocket.herokuapp.com/machines');
    c = count(temp,'<tr>') - 1;
    machines = struct('ID',{},'status',{},'ip',{},'last_seen',{});
    temp = temp(strfind(temp,'<tbody>')+length('<tbody>'):end);

    for i = (1:c)
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        machines(i).id = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        machines(i).ip = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        machines(i).status = (temp(1:strfind(temp,'</td>')-1));
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        machines(i).last_seen = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<tr>')+length('<tr>'):end);
    end
    machines = struct2table(machines);
end