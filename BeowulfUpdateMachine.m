function[] = BeowulfUpdateMachine(ID,status,IP)
    data = join(['utf8=%E2%9C%93&_method=patch&machine%5Bstatus%5D=',status,'&machine%5BIP%5D=',IP,'&commit=Update+Machine'],'');   
    try
           webwrite(join(['https://beowulf-rocket.herokuapp.com/machines/',ID],''),data);
       catch ME
           warning(ME.message)
    end
end
