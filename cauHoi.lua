local text = "Ban co the lua chon buoc tiep theo"
local list = {}

SetTask(taskNumber.cauHoi, 1)   --để đây để nó mất đi lựa chọn Câu hỏi
for key, value in pairs(task) do
    if value == 0 then
        table.insert(list, tostring(key).."/"..tostring(key))
    end
end

if #list == 0 then
    table.insert(list, endGame)
end


Say(text, #list, list)