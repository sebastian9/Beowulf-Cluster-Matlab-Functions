function [tasks] = BeowulfReadMachines()
    temp = webread('https://beowulf-rocket.herokuapp.com/machines');
    c = count(temp,'<tr>') - 1;
    tasks = struct('status',{},'Ip',{},'LastSeen',{});
    temp = temp(strfind(temp,'<tbody>')+length('<tbody>'):end);

    for i = (1:c)
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks(i).Ip = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks(i).status = (temp(1:strfind(temp,'</td>')-1));
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks(i).LastSeen = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<tr>')+length('<tr>'):end);
    end
    tasks = struct2table(tasks);
end