# Beowulf Cluster Matlab Interface 

Matlab HTTP interface with the RoR beowulf cluster, for the web application task manager check the Beowulf Cluster repo.

## Usage

Run the matlab client function on the client machines for them to start waiting for tasks to run. The client machines should have the necessary files and matlab functions to work with in it’s #current folder#. 

After getting clients on line run the matlab master function with the inputs to be passed and the expected time per case.

## Master Function

function [OUTPUTS,INVALID_INPUTS] = BeowulfMaster(INPUTS,TIME) 

1) Recibe un string con los parámetros de los inputs separados por comas y con los input batchs separados por punto y coma con un compromiso entre el tiempo estimado que toma cada tarea (TIME) y el tiempo que toma realizar el BeowulfUpdate*

2) Revisar Machines con status en waiting hasta encontrar una

3) Definir Inputs para la tarea a realizar desde el vector de entrada.

4) Crear una Task con los Inputs definidos y la Machine encontrada como waiting

6) Corroborar status del task como working en un tiempo sensato

7) Revisar tasks en Done que no haya recopilado y recopilar su output

8) En caso de que una tarea tome un tiempo excesivo (TIME*2) invalidar el ID y la Máquina y reasignar; si pasa más de una vez, mandar el INPUT a un Blacklist (INVALID_INPUTS)

9) Repetir hasta que los INPUTS se agoten y se recaben todos los resultados

10) Regresar OUTPUTS e INVALID_INPUTS

## Client Function

function [] = BeowulfClient(@fun) 

1)Registrarse en Machines

2) Revisar Tasks hasta encontrar una task en waiting con el IP de la máquina

3) Actualizar status de Machines a working

4) Actualizar status de Task a working

5) Correr la función con los inputs de la task

6) Actualizar el task status a done y output al output de la función

7) Actualizar el Machine status a waiting

8) Regresar a revisar tasks hasta encontrar una task....

## CRUD Function Groups

The create, read, update, delete basic actions are implemented as matlab functions for the Tasks and Machines registres.

## LICENSE 

MIT LICENSE
