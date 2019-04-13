function [ip] = GetMachineIP()
    [~,ip] = system('ipconfig');
    ip = ip(strfind(ip,'IPv4. . . . . . . . . . . . . . : ')+length('IPv4. . . . . . . . . . . . . . : '):end);
    ip = ip(1:strfind(ip,'M')-5);
end
