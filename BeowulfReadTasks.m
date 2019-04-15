function [tasks] = BeowulfReadTasks()
    temp = webread('https://beowulf-rocket.herokuapp.com');
    c = count(temp,'<tr>') - 1;
    VarTypes = {'string','string','string','string','string','string'};
    VarNames = {'id','status','ip','input','output','updated_at'};
    tasks = table('Size',[0,6],'VariableTypes',VarTypes,'VariableNames',VarNames);

    temp = temp(strfind(temp,'<tbody>')+length('<tbody>'):end);

    for i = (1:c)
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks.id(i) = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks.status(i) =(temp(1:strfind(temp,'</td>')-1));
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks.ip(i) = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks.input(i) = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks.output(i) = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<td>')+length('<td>'):end);
        tasks.updated_at(i) = temp(1:strfind(temp,'</td>')-1);
        temp = temp(strfind(temp,'<tr>')+length('<tr>'):end);
    end
end
