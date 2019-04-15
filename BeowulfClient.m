function [] = BeowulfClient(fun)
    % Registrarse en Machines y obtener el ID de la Máquina
    IP = GetMachineIP();
    machine_ID = '0';
    machines = BeowulfReadMachines();
    for i = 1:height(machines)
           if strcmp(machines.ip(i),IP)
               machine_ID = machines.id(i);
               BeowulfUpdateMachine(machine_ID,'Waiting',IP);
           end
    end
    
    machines = BeowulfReadMachines();
    if strcmp(machine_ID,'0')
        BeowulfCreateMachine('Waiting',IP)
    end
    for i = 1:height(machines)
           if strcmp(machines.ip(i),IP)
               machine_ID = machines.id(i);
           end
    end
    % Revisar Tasks hasta encontrar una task en waiting con el IP de la
    % máquina
   while 1
        tasks = BeowulfReadTasks();
        for i = 1:height(tasks)
           if strcmp(tasks.ip(i),IP) && strcmp(tasks.status(i),'Waiting')
                % Actualizar status de Machines a working
                BeowulfUpdateMachine(machine_ID,'Working',IP);
                % Actualizar status de Task a working
                BeowulfUpdateTask(tasks.id(i),'Working',IP,tasks.input(i),tasks.output(i));
                % Parse Inputs
                temp = split(tasks.input(i));
                INPUTS = zeros(length(temp),1);
                for j = 1:length(INPUTS)
                    INPUTS(j) = str2double( temp(j) );
                end
                % Correr la función con los inputs de la task
                OUTPUTS = fun(INPUTS);
                % Parse OUTPUTS
                temp = OUTPUTS;
                OUTPUTS = '';
                for j = 1:length(temp)
                   OUTPUTS = [OUTPUTS,' ',num2str(temp(j))]; %#ok<AGROW>
                end
                % Actualizar el task status a done y output al output de la función
                BeowulfUpdateTask(tasks.id(i),'Done',IP,tasks.input(i),OUTPUTS);
                % Actualizar el Machine status a waiting
                BeowulfUpdateMachine(machine_ID,'Waiting',IP);
           else
               pause(1); % Pause to prevent server saturation
           end
        end
    end
end
