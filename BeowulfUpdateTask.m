function[] = BeowulfUpdateTask(ID,status,IP,input,output)
    data = join(['utf8=%E2%9C%93&_method=patch&task%5Bstatus%5D=',status,'&task%5Bmachine%5D=',IP,'&task%5Binput%5D=',input,'&task%5Boutput%5D=',output,'&commit=Create+Task'],'');   
    try
           webwrite(join(['https://beowulf-rocket.herokuapp.com/tasks/',ID],''),data);
       catch ME
           warning(ME.message)
    end
end
