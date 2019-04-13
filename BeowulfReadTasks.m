function [tasks] = BeowulfReadTasks()
    temp = webread('https://beowulf-rocket.herokuapp.com');
    c = count(temp,'<tr>') - 1;
    tasks = struct('status',{},'input',{},'output',{});
    temp = temp(strfind(temp,'<tbody>')+length('<tbody>'):end);

    for i = (1:c)
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks(i).id = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks(i).status =(temp(1:strfind(temp,'</td>')-1));
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks(i).ip = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks(i).input = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks(i).output = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<tr>')+length('<tr>'):end);
        tasks(i).updated_at = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<tr>')+length('<tr>'):end);
    end
    tasks = struct2table(tasks);
end
