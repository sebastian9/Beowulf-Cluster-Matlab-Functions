function [OUTPUTS,INVALID_INPUTS] = BeowulfMaster(inputs,time)
    % Recibe un string con los parámetros de los inputs separados por comas
    % y con los input batchs separados por punto y coma con un compromiso
    % entre el tiempo estimado que toma cada tarea (TIME) y el tiempo que 
    % toma realizar el BeowulfUpdate*
    
    % Revisar Machines con status en waiting hasta encontrar una
    
    while length(inputs)>0
        Machines = BeowulfReadTasks()
        i=1;
        while i <= height(Machines)
            if Machines(i).status == -1
                Client = Machines(i);
                break
            end
            i=i+1;
        end
        
    % Definir Inputs para la tarea a realizar desde el vector de entrada 
      
        Task = inputs(1);
        inputs(1) = [];
    
    % Crear una Task con los Inputs definidos y la Machine encontrada como
    % waiting
        
        webstring = 'utf8=%E2%9C%93&task%5Bstatus%5D=waiting&task%5Binput%5D=',char(Task),'&task%5Boutput%5D=+&commit=Create+Task'
        
    
    % Corroborar status del task como working en un tiempo sensato
    
    % Revisar tasks en Done que no haya recopilado y recopilar su output
    
    % En caso de que una tarea tome un tiempo excesivo (TIME*2) invalidar
    % el ID y la Máquina y reasignar; si pasa más de una vez, mandar el 
    % INPUT a un Blacklist (INVALID_INPUTS)
    
    % Repetir hasta que los INPUTS se agoten y se recaben todos los
    % resultados
    
    % Regresar OUTPUTS e INVALID_INPUTS.
    
    end
end
