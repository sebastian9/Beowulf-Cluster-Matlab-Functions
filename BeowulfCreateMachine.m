function[] = BeowulfCreateMachine(status,IP)
    data = ['utf8=%E2%9C%93&machine%5Bstatus%5D=',status,'&machine%5BIP%5D=',IP,'&commit=Create+Machine'];   
    try
           webwrite('https://beowulf-rocket.herokuapp.com/machines/',data)  
       catch ME
           warning(ME.message)
    end
end
