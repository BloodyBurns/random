local Body = {}
Body.Admin = 'Yes'
Body.Admin_2 = 'No'
Body.ExecAdmin = function(PF, type)
repeat task.wait()
    writefile('Admin_Verxt.lua', (PF .. '\n' .. type))
    until nil
end
return Body
