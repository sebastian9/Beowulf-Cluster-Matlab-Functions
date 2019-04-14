function[] = BeowulfDestroyMachine(ID)
   try
       webwrite(['https://beowulf-rocket.herokuapp.com/machines/',num2str(ID,'%i')],'_method=delete')
   catch ME
       warning(ME.message)
   end
end
