-- Say(string, int, [str1, str2,...])
-- 	int là số lượng các str phía sau nó.
-- 		VD: Say("text1", 2, "yes/foo", "no/fa")
-- 		yes/foo: có nghĩa khi chọn yes sẽ call function foo() ở trong file đấy
-- 		no/fa: có nghĩa khi chọn no sẽ call function fa() ở trong file đấy

-- SetTask(id, value)
-- 	id là mã lưu có định dạng là int
-- 	value là giá trị của mã lưu
	
-- GetTask(id)
-- 	Dùng để lấy giá trị của mã lưu.
	
-- AddGift()
-- 	Dùng để đưa phần quà.
	
-- Include(filename)
-- 	Dùng để include code của một 1 LUA khác vào file LUA hiện tại.

    	
-- Tự nghĩ ra một chuỗi đối thoại ít nhất 5 bước.
-- Mỗi bước là một file LUA, hàm thực thi của mỗi file LUA luôn mặc định là function main().

-- 	1 trong các bước yêu cầu sử dụng hàm Say phía trên có 5 lựa chọn nhưng 5 lựa chọn này phải có thứ tự ngẫu nhiên khi được gọi thực thi.
-- 	Mỗi bước chỉ có thể thực thi duy nhất một lần khi thực thi lại từ bước 1 sẽ có thông báo là đã thực hiện rồi, từ bước thứ 2 trở đi phải có 1 lựa chọn hủy để thực hiện lại từ đầu. ở bước cuối cùng thì không thể hủy.

localcheckReset = false
restartValue = -1
Restart = 1
endGame = "ok"

score = 0
cnt = 0
profile = {
    name = "",
    age = 0,
    gender = "",
}
taskValue = {
    "gioiThieu",
    "choiGame",
    "tangQua",
    "cauHoi",
    "xemThongTin",
}
taskNumber = {
    gioiThieu = 1;
    choiGame = 2,
    tangQua = 3,
    cauHoi = 4,
    xemThongTin = 5,
}
task = {
    gioiThieu = 0;
    choiGame = 0,
    tangQua = 0,
    cauHoi = 0,
    xemThongTin = 0,
}

math.randomseed(os.time())

function Say(string, int, str)
    if not(#str == 1 and str[1] == endGame) then
        local func = {}

        print(string)
        print("Xin hay nhap lua chon cua ban")

        for i = 1, int do
            local j = string.find(str[i], '/')
            local text = string.sub(str[i], 1, j - 1)
            table.insert(func,string.sub(str[i], j + 1))
            print(text.." - "..i)
        end

        local num =io.read("*l")
        Include(func[tonumber(num)])
    end
end

function reset()
    checkReset = true
    profile.name = ""
    profile.age = 0
    profile.gender = ""
    score = 0
    cnt = 0
    Restart = 1
    task.gioiThieu = 0
    task.choiGame = 0
    task.tangQua = 0
    task.cauHoi = 0
    task.xemThongTin = 0
end

function SetTask(id, value)
    if id == taskNumber.gioiThieu then
        task.gioiThieu = value
    elseif id == taskNumber.choiGame then
        task.choiGame = value
    elseif id == taskNumber.tangQua then
        task.tangQua = value
    elseif id == taskNumber.cauHoi then
        task.cauHoi = value
    elseif id == taskNumber.xemThongTin then
        task.xemThongTin = value
    end

    Restart = Restart + 1
    setCnt()
end

function GetTask(id)
    
end

function AddGift()
    local number = math.random(1, 100)
    print("chuc mung ban da duoc phan qua la "..number.." diem")
    setScore(number)
    print("Diem so cua ban hien tai la: "..score)
end

function Include(filename)
    dofile(filename..".lua")    
end

function setScore(value)
    score = score + value
end

function setCnt()
    cnt = cnt + 1
end

function setProfile(name, age, gender)
    profile.name = name
    profile.age = age
    profile.gender = gender
end

function checkNumber(number)
    if number == taskNumber.gioiThieu and task.gioiThieu == 0 then
        return true
    elseif number == taskNumber.choiGame and task.choiGame == 0 then
        return true
    elseif number == taskNumber.tangQua and task.tangQua == 0 then
        return true
    elseif number == taskNumber.cauHoi and task.cauHoi == 0 then
        return true
    elseif number == taskNumber.xemThongTin and task.xemThongTin == 0 then
        return true
    end

    return false
end

while cnt < 5 do
    local number = math.random(1, 5)
    if checkNumber(number) then
        if Restart > 1 and Restart < 5 then
            print("Luu y ban co the bat dau lai tu dau khi nhap gia tri la: "..restartValue)
            print("Nhap gia tri bat ky de tiep tuc")
            local i = tonumber(io.read())
            if i == restartValue then
                reset()
                print("Ban da thuc hien lai tu dau")
            else
                print("Ban tiep tuc thuc hien")
            end
        end
        
        Include(taskValue[number])
    end
end
print("Ban da hoan thanh voi diem so la: "..score)

-- Include("cauHoi")