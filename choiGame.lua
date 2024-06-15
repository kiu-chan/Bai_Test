math.randomseed(os.time())

local number = math.random(1, 100)
local point = 100
local penalty = -5
local select
local text = "Chon cac so tu 1 den 100 sao cho trung voi so ma tro choi dua ra, moi lan doan sai se bi tru 5 diem, tro choi se dua ra goi y moi lan doan sai. Diem so mac dinh la 100 diem"

function setPoint(value)
    point = point + value
end

print(text)

repeat
    select = tonumber(io.read("*l"))

    if select > number then
        print("so can tim la so nho hon")
        setPoint(penalty)
    elseif select < number then
        print("so can tim la so lon hon")
        setPoint(penalty)
    else
        print("ban da chon dung so can tim")
        setScore(point)
        print("Diem so hien tai cua ban la:"..score)
    end
until select == number

SetTask(taskNumber.choiGame, 1)