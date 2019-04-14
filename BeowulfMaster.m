function [outputs,invalid_inputs] = BeowulfMaster(inputs,timemax)
    % Recibe un string con los parámetros de los inputs separados por comas
    % y con los input batchs separados por punto y coma con un compromiso
    % entre el tiempo estimado que toma cada tarea (TIME) y el tiempo que 
    % toma realizar el BeowulfUpdate*
    
    % Revisar Machines con status en waiting hasta encontrar una
    warned_inputs = {};
    invalid_inputs = {};
    finished_inputs = {};
    finished_outputs = {};
    while length(inputs)>0
        Machines = BeowulfReadMachines();
        i=1;
        while i <= height(Machines)
            if strcmp(cell2mat(Machines.status(i)),'Waiting')
                Client = cell2mat(Machines.ip(i));
                
    % Definir Inputs para la tarea a realizar desde el vector de entrada 
      
                Task = inputs{1};
                inputs(1) = [];
    
    % Crear una Task con los Inputs definidos y la Machine encontrada como
    % waiting
        
                BeowulfCreateTask('Waiting',Client,Task,'Pending')
                break
            end
            i=i+1;
        end
        

        
    % Corroborar status del task como working en un tiempo sensato
    
        Tasks = BeowulfReadTasks();
        i=1;
        
        while i <= height(Tasks)
            if strcmp(cell2mat(Tasks.status(i)),'Waiting')
                Date = cell2mat(Tasks.updated_at(i));
                t = datetime('now')-datetime(Date,'InputFormat','dd-MMM-yyyy HH:mm:ss');
                time = strsplit(char(t),':');
                timemin = str2num(time{1})*60+str2num(time{2});
                if timemin >= 1
                    BeowulfUpdateTask(cell2mat(Tasks.id(i)),'Computer not responding',cell2mat(Tasks.ip(i)),cell2mat(Tasks.input(i)),cell2mat(Tasks.output(i)));
                    inputs{end+1} = cell2mat(Tasks.input(i));
                    machines = BeowulfReadMachines();
                    for j = 1:height(machines)
                           if strcmp(cell2mat(machines.ip(j)),Tasks.ip(i))
                                machine_ID = cell2mat(machines.id(j));
                                machine_status = cell2mat(machines.status(j));
                           end
                    end
                    if ~strcmp(machine_status,'Disconnected')
                        BeowulfUpdateMachine(machine_ID,'Disconnected',cell2mat(Tasks.ip(i)))
                    end
                end
            end
    % En caso de que una tarea tome un tiempo excesivo (TIME*2) invalidar
    % el ID y la Máquina y reasignar; si pasa más de una vez, mandar el 
    % INPUT a un Blacklist (INVALID_INPUTS)
            if strcmp(cell2mat(Tasks.status(i)),'Working')
                Date = cell2mat(Tasks.updated_at(i));
                t = datetime('now')-datetime(Date,'InputFormat','dd-MMM-yyyy HH:mm:ss');
                time = strsplit(char(t),':');
                timemin = str2num(time{1})*60+str2num(time{2});
                if timemin > 2*timemax
                    BeowulfUpdateTask(cell2mat(Tasks.id(i)),'Failed',cell2mat(Tasks.input(i)),cell2mat(Tasks.output(i)));
                    if sum(ismember(warned_inputs,cell2mat(Tasks.input(i))))==0
                        warned_inputs{end+1} = cell2mat(Tasks.input(i));
                        inputs{end+1} = cell2mat(Tasks.input(i));
                    end
                    if sum(ismember(warned_inputs,cell2mat(Tasks.input(i))))>0
                        invalid_inputs{end+1} = cell2mat(Tasks.input(i));
                    end
                end
            end
    % Revisar tasks en Done que no haya recopilado y recopilar su output
            if strcmp(cell2mat(Tasks.status(i)),'Done')
                if sum(ismember(finished_inputs,cell2mat(Tasks.input(i))))==0
                    finished_inputs{end+1} = cell2mat(Tasks.input(i));
                    finished_outputs{end+1} = cell2mat(Tasks.output(i));
                end
            end
            i=i+1;
        end
        
    % Repetir hasta que los INPUTS se agoten y se recaben todos los
    % resultados
    
    % Regresar outputs e invalid_inputs.
    
    outputs = {finished_inputs;finished_outputs};
    
    pause(15)
    
    end
end
