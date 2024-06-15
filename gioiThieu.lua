local name = ""
local age
local gender = ""
local genderNumber
local checkName = false
local checkAge = false
local checkGender = false

function isValidName(text)
    local pattern = "[^a-zA-Z0-9%s]"
    return text:match(pattern) ~= nil
end

function isValidAge(value)
    if value > 0 then
        return true
    end
    return false
end

function isValidGender(value)
    if value < 4 and value > 0 then
        return true
    end
    return false
end

print("Ban hay gioi thieu ban than")

repeat
    if(checkName) then
        print("Ten khong hop le, xin hay nhap lai")
    end
    print("Ten cua ban la?")
    name = io.read()
    checkName = true
until not isValidName(name)

repeat
    if(checkAge) then
        print("Tuoi khong hop le, xin hay nhap lai")
    end
    print("Ban bao nhieu tuoi?")
    age = tonumber(io.read())
    checkAge = true
until isValidAge(age)

repeat
    if(checkGender) then
        print("Tuoi khong hop le, xin hay nhap lai")
    end

    print("Gioi tinh cua ban la")
    print("Nam - 1")
    print("Nu - 2")
    print("Toi khong muon noi - 3")

    genderNumber = tonumber(io.read())
    checkGender = true
until isValidGender(genderNumber)

if genderNumber == 1 then
    gender = "Nam"
elseif genderNumber == 2 then
    gender = "Nu"
else 
    gender = "Khac"
end

setProfile(name, age, gender)
SetTask(taskNumber.gioiThieu, 1)