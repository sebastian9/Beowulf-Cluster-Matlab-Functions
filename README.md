# BeowulfMatlabCRUD
Matlab CRUD HTTP interface with the RoR beowulf cluster

function [OUTPUTS,INVALID_INPUTS] = BeowulfMaster(INPUTS,TIME)
    % Recibe un string con los parámetros de los inputs separados por comas
    % y con los input batchs separados por punto y coma con un compromiso
    % entre el tiempo estimado que toma cada tarea (TIME) y el tiempo que toma realizar
    % el BeowulfUpdate*
    
    % Revisar Machines con status en waiting hasta encontrar una
    
    % Definir Inputs para la tarea a realizar desde el vector de entrada 
    
    % Crear una Task con los Inputs definidos y la Machine encontrada como
    % waiting
    
    % Corroborar status del task como working en un tiempo sensato
    
    % Revisar tasks en Done que no haya recopilado y recopilar su output
    
    % En caso de que una tarea tome un tiempo excesivo (TIME*2) invalidar
    % el ID y la Máquina y reasignar; si pasa más de una vez, mandar el 
    % INPUT a un Blacklist (INVALID_INPUTS)
    
    % Repetir hasta que los INPUTS se agoten y se recaben todos los
    % resultados
    
    % Regresar OUTPUTS e INVALID_INPUTS
end

function [] = BeowulfClient(@fun)
    % Registrarse en Machines
    
    % Revisar Tasks hasta encontrar una task en waiting con el IP de la
    % máquina
    
    % Actualizar status de Machines a working
    
    % Actualizar status de Task a working
    
    % Correr la función con los inputs de la task
    
    % Actualizar el task status a done y output al output de la función
    
    % Actualizar el Machine status a waiting
    
    % Regresar a revisar tasks hasta encontrar una task....
    
end
