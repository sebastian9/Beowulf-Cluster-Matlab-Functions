function [] = BeowulfClient(fun)
    % Registrarse en Machines
    IP = GetMachineIP();
    BeowulfCreateMachine('Wating',IP)
    % Obtener el ID de la M�quina
    Machine_ID = -1;
    % Revisar Tasks hasta encontrar una task en waiting con el IP de la
    % m�quina
    while 1
        for i = 1:height(tasks)
           if cell2mat(tasks.ip(i)) == IP && strcmp(cell2mat(tasks.status(i)),'Waiting')
                % Actualizar status de Machines a working
                BeowulfUpdateMachine(Machine_ID,'Working',IP);
                % Actualizar status de Task a working
                BeowulfUpdateTask(cell2mat(tasks.id(i)),'Working',cell2mat(tasks.input(i)),cell2mat(tasks.output(i)));
                % Parse Inputs
                INPUTS = [];
                temp = split(cell2mat(tasks.input(2)));
                for j = 1:length(temp)
                    INPUTS(j) = cell2mat(temp(j));
                end
                % Correr la funci�n con los inputs de la task
                fun(
           end
        end
    end
   
    
    
    
    
    
    % Actualizar el task status a done y output al output de la función
    
    % Actualizar el Machine status a waiting
    
    % Regresar a revisar tasks hasta encontrar una task....
    
end
