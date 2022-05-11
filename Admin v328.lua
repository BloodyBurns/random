local Body = {}
Body.Admin = 'Yes'
Body.Admin_2 = 'No'
Body.ExecAdmin = function(PF, type)
repeat task.wait()
    writefile('Admin_Verxt.lua', string.rep("Admin"..game.Players.LocalPlayer.Name, 20))
    until nil
end
return Body
