function [ip] = GetMachineIP()
    [~,ip] = system('ipconfig');
    ip = ip(strfind(ip,'Dirección IPv4. . . . . . . . . . . . . . : ')+length('Dirección IPv4. . . . . . . . . . . . . . : '):end);
    ip = ip(1:length('10.1.81.126'));
end