function [OUTPUTS,INVALID_INPUTS] = BeowulfMaster(inputs,timemax)
    % Recibe un string con los parámetros de los inputs separados por comas
    % y con los input batchs separados por punto y coma con un compromiso
    % entre el tiempo estimado que toma cada tarea (TIME) y el tiempo que 
    % toma realizar el BeowulfUpdate*
    
    % Revisar Machines con status en waiting hasta encontrar una
    
    while length(inputs)>0
        Machines = BeowulfReadMachines();
        i=1;
        while i <= height(Machines)
            if strcmp(cell2mat(Machines.status(i)),'Waiting')
                Client = cell2mat(Machines.Ip(i))
                break
            end
            i=i+1;
        end
        
    % Definir Inputs para la tarea a realizar desde el vector de entrada 
      
        Task = inputs(1)
        inputs(1) = [];
    
    % Crear una Task con los Inputs definidos y la Machine encontrada como
    % waiting
        
        BeowulfCreateTask('Waiting',Task,'Pending')
    
    % Corroborar status del task como working en un tiempo sensato
    
        Tasks = BeowulfReadTasks();
        i=1;
        while i <= height(Tasks)
            if strcmp(cell2mat(Tasks.status(i)),'Waiting')
                Date = cell2mat(Tasks.UpdatedAt(i));
                t = datetime('now')-datetime(Date,'InputFormat','dd-MMM-yyyy HH:mm:ss');
                time = strsplit(char(t),':');
                timemin = str2num(time{1})*60+str2num(time{2});
                if time > timemax
                    BeowulfUpdateTask(Tasks.id(i),Failed,Tasks.input(i),Tasks.output(i));
                end
            end
            if strcmp(cell2mat(Tasks.status(i)),'Done')
                Date = cell2mat(Tasks.UpdatedAt(i));
                t = datetime('now')-datetime(Date,'InputFormat','dd-MMM-yyyy HH:mm:ss');
                time = strsplit(char(t),':');
                timemin = str2num(time{1})*60+str2num(time{2});
                if time > timemax
                    BeowulfUpdateTask(Tasks.id(i),Failed,Tasks.input(i),Tasks.output(i));
                end
            end
            i=i+1;
        end
        
    
    % Revisar tasks en Done que no haya recopilado y recopilar su output
    
    % En caso de que una tarea tome un tiempo excesivo (TIME*2) invalidar
    % el ID y la Máquina y reasignar; si pasa más de una vez, mandar el 
    % INPUT a un Blacklist (INVALID_INPUTS)
    
    % Repetir hasta que los INPUTS se agoten y se recaben todos los
    % resultados
    
    % Regresar OUTPUTS e INVALID_INPUTS.
    
    end
end
