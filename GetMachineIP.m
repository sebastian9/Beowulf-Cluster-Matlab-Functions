function [ip] = GetMachineIP()
    [~,ip] = system('ipconfig');
    ip = ip(strfind(ip,'Direcci�n IPv4. . . . . . . . . . . . . . : ')+length('Direcci�n IPv4. . . . . . . . . . . . . . : '):end);
    ip = ip(1:length('10.1.81.126'));
end