function [ip] = GetMachineIP()
    [~,ip] = system('ipconfig');
    ip = ip(strfind(ip,'Dirección IPv4. . . . . . . . . . . . . . : ')+length('Dirección IPv4. . . . . . . . . . . . . . : '):end);
    ip = ip(1:strfind(ip,'Máscara')-5);
end
