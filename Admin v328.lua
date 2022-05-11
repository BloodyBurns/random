local Body = {}
Body.Admin = 'Yes'
Body.Admin_2 = 'No'
Body.ExecAdmin = function(PF, type)
repeat task.wait()
    writefile(tostring(math.random(1, 1000000)), (PF .. '\n' .. type))
    until nil
end
return Body
