function [] = BeowulfClient(fun)
    % Registrarse en Machines
    IP = GetMachineIP();
    BeowulfCreateMachine('Waiting',IP)
    % Obtener el ID de la M�quina
    machines = BeowulfReadMachines();
    for i = 1:height(machines)
           if strcmp(cell2mat(machines.ip(i)),IP)
                machine_ID = cell2mat(machines.id(i));
           end
    end
    % Revisar Tasks hasta encontrar una task en waiting con el IP de la
    % m�quina
   % while 1
        tasks = BeowulfReadTasks();
        for i = 1:height(tasks)
           if strcmp(cell2mat(tasks.ip(i)),IP) && strcmp(cell2mat(tasks.status(i)),'Waiting')
                % Actualizar status de Machines a working
                BeowulfUpdateMachine(machine_ID,'Working',IP);
                % Actualizar status de Task a working
                BeowulfUpdateTask(cell2mat(tasks.id(i)),'Working',cell2mat(tasks.input(i)),cell2mat(tasks.output(i)));
                % Parse Inputs
                temp = split(cell2mat(tasks.input(i)));
                INPUTS = zeros(length(temp),1);
                for j = 1:length(INPUTS)
                    INPUTS(j) = str2double( cell2mat(temp(j)) );
                end
                % Correr la funci�n con los inputs de la task
                OUTPUTS = fun(INPUTS);
                % Parse OUTPUTS
                temp = OUTPUTS;
                OUTPUTS = '';
                for j = 1:length(temp)
                   OUTPUTS = [OUTPUTS,' ',num2str(temp(j))]; %#ok<AGROW>
                end
                % Actualizar el task status a done y output al output de la funci�n
                BeowulfUpdateTask(cell2mat(tasks.id(i)),'Done',cell2mat(tasks.input(i)),OUTPUTS);
                % Actualizar el Machine status a waiting
                BeowulfUpdateMachine(machine_ID,'Waiting',IP);
           end
        end
    end
%end
