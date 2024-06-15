print("Duoi day la thong tin cua ban")
print("Diem so cua ban la: "..score)

if #profile.name == 0 then
    print("Ban chua nhap thong tin ca nhan")
else
    print("Ho ten: "..profile.name)
    print("Tuoi: "..profile.age)
    print("Gioi tinh: "..profile.gender)
end

SetTask(taskNumber.xemThongTin, 1)