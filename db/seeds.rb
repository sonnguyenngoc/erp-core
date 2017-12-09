Erp::Department.destroy_all

manager_dept = Erp::Department.create(name: "Phòng quản lý")
admin_dept = Erp::Department.create(name: "Phòng kinh doanh")
tech_dept = Erp::Department.create(name: "Phòng kỹ thuật")
planing_dept = Erp::Department.create(name: "Phòng kế hoạch")
per_dept = Erp::Department.create(name: "Phòng nhân sự")
acc_dept = Erp::Department.create(name: "Phòng kế toán")

Erp::UserGroup.destroy_all

super_manager = Erp::UserGroup.create(name: "Trưởng phòng quản lý", permissions: '')
manual_emp = Erp::UserGroup.create(name: "Nhân viên", permissions: '')
manager_emp = Erp::UserGroup.create(name: "Trưởng phòng", permissions: '')
per_emp = Erp::UserGroup.create(name: "Nhân viên phòng nhân sự", permissions: '')
per_manager = Erp::UserGroup.create(name: "Trưởng phòng nhân sự", permissions: '')
acc_emp = Erp::UserGroup.create(name: "Nhân viên phòng kế toán", permissions: '')

Erp::Employee.destroy_all
ql_1 = Erp::Employee.create(code: "QL0001", tax_code: "1112223334", phone: "099 9999 999", birthdate: "1994-11-08", salary: '20,00,000', address: "Gò Vấp, TP. Hồ Chí Minh")

kd_1 = Erp::Employee.create(code: "KD0001", tax_code: "1112223331", phone: "099 9999 911", birthdate: "1995-11-08", salary: '5,000,000', address: "Quận 12, TP. Hồ Chí Minh")
kd_2 = Erp::Employee.create(code: "KD0002", tax_code: "1112223332", phone: "099 9999 922", birthdate: "1996-11-08", salary: '5,000,000', address: "Quận 8, TP. Hồ Chí Minh")
kd_3 = Erp::Employee.create(code: "KD0003", tax_code: "1112223333", phone: "099 9999 944", birthdate: "1997-11-08", salary: '5,000,000', address: "Gò Vấp, TP. Hồ Chí Minh")
kd_4 = Erp::Employee.create(code: "KD0004", tax_code: "1112223335", phone: "099 9999 933", birthdate: "1993-11-08", salary: '5,000,000', address: "Quận 10, TP. Hồ Chí Minh")
kd_5 = Erp::Employee.create(code: "KD0005", tax_code: "1112223336", phone: "099 9999 944", birthdate: "1992-11-08", salary: '5,000,000', address: "Quận 4, TP. Hồ Chí Minh")

kt_1 = Erp::Employee.create(code: "KT0001", tax_code: "1112223320", phone: "099 9999 811", birthdate: "1991-11-08", salary: '8,000,000', address: "Quận 8, TP. Hồ Chí Minh")
kt_2 = Erp::Employee.create(code: "KT0002", tax_code: "1112223321", phone: "099 9999 822", birthdate: "1990-11-08", salary: '8,000,000', address: "Quận 12, TP. Hồ Chí Minh")
kt_3 = Erp::Employee.create(code: "KT0003", tax_code: "1112223322", phone: "099 9999 833", birthdate: "1996-11-08", salary: '8,000,000', address: "Gò Vấp, TP. Hồ Chí Minh")
kt_4 = Erp::Employee.create(code: "KT0004", tax_code: "1112223323", phone: "099 9999 844", birthdate: "1992-11-08", salary: '8,000,000', address: "Quận 7, TP. Hồ Chí Minh")
kt_5 = Erp::Employee.create(code: "KT0005", tax_code: "1112223324", phone: "099 9999 855", birthdate: "1998-11-08", salary: '8,000,000', address: "Gò Vấp, TP. Hồ Chí Minh")

kh_1 = Erp::Employee.create(code: "KH0001", tax_code: "1112223341", phone: "099 9999 799", birthdate: "1991-1-06", salary: '7,000,000', address: "Gò Vấp, TP. Hồ Chí Minh")
kh_2 = Erp::Employee.create(code: "KH0002", tax_code: "1112223342", phone: "099 9999 788", birthdate: "1990-2-07", salary: '7,000,000', address: "Củ Chi, TP. Hồ Chí Minh")
kh_3 = Erp::Employee.create(code: "KH0003", tax_code: "1112223343", phone: "099 9999 777", birthdate: "1994-3-08", salary: '7,000,000', address: "Gò Vấp, TP. Hồ Chí Minh")
kh_4 = Erp::Employee.create(code: "KH0004", tax_code: "1112223344", phone: "099 9999 766", birthdate: "1993-4-09", salary: '7,000,000', address: "Bình Tân, TP. Hồ Chí Minh")
kh_5 = Erp::Employee.create(code: "KH0005", tax_code: "1112223345", phone: "099 9999 755", birthdate: "1992-5-20", salary: '7,000,000', address: "Quận 12, TP. Hồ Chí Minh")

ns_1 = Erp::Employee.create(code: "NS0001", tax_code: "1112223431", phone: "0985213345", birthdate: "1980-8-11", salary: '18,000,000', address: "Bình Chánh, TP. Hồ Chí Minh")
ns_2 = Erp::Employee.create(code: "NS0002", tax_code: "1112223421", phone: "0985212233", birthdate: "1993-6-3", salary: '16,000,000', address: "Quận 1, TP. Hồ Chí Minh")
ns_3 = Erp::Employee.create(code: "NS0003", tax_code: "1112223401", phone: "0985211153", birthdate: "1992-8-6", salary: '16,000,000', address: "Quận 1, TP. Hồ Chí Minh")

acc_1 = Erp::Employee.create(code: "AC0001", tax_code: "1112223311", phone: "0987556511", birthdate: "1996-8-12", salary: '16,000,000', address: "Quận 2, TP. Hồ Chí Minh")

# Create default admin user for developing
puts "Tao nhan vien phong quan ly"
Erp::User.create(
  email: "1633645@hcmut.edu.vn",
  password: "aA456321@",
  name: "Nguyễn Ngọc Sơn",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: manager_dept.id,
  user_group_id: super_manager.id,
  employee_id: ql_1.id,
) if Erp::User.where(email: "quanly@hcmut.edu.vn").empty?
puts "Ket thuc tao nhan vien phong quan ly"

puts "Tao nhan vien phong ke toan"
Erp::User.create(
  email: "ketoan@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Thị Thu Trang",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: acc_dept.id,
  user_group_id: acc_emp.id,
  employee_id: acc_1.id,
) if Erp::User.where(email: "ketoan@hcmut.edu.vn").empty?
puts "Ket thuc tao nhan vien phong ke toan"

puts "Tao nhan vien phong nhan su"
Erp::User.create(
  email: "nhansu1@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Thanh Hằng",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: per_dept.id,
  user_group_id: per_emp.id,
  employee_id: ns_2.id,
) if Erp::User.where(email: "nhansu1@hcmut.edu.vn").empty?

Erp::User.create(
  email: "nhansu2@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Văn Long",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: per_dept.id,
  user_group_id: per_emp.id,
  employee_id: ns_3.id,
) if Erp::User.where(email: "nhansu2@hcmut.edu.vn").empty?

Erp::User.create(
  email: "tpnhansu@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Văn Mạnh",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: per_dept.id,
  user_group_id: per_emp.id,
  employee_id: ns_1.id,
) if Erp::User.where(email: "tpnhansu@hcmut.edu.vn").empty?
puts "Ket thuc tao nhan vien phong nhan su"

puts "Tao nhan vien phong kinh doanh"
Erp::User.create(
  email: "kinhdoanh1@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Thu Trang",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: admin_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kd_2.id,
) if Erp::User.where(email: "kinhdoanh1@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kinhdoanh2@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Văn Lâm",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: admin_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kd_3.id,
) if Erp::User.where(email: "kinhdoanh2@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kinhdoanh3@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Văn Tiến",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: admin_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kd_4.id,
) if Erp::User.where(email: "kinhdoanh3@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kinhdoanh4@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Hoàng Sơn",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: admin_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kd_5.id,
) if Erp::User.where(email: "kinhdoanh4@hcmut.edu.vn").empty?
Erp::User.create(
  email: "tpkinhdoanh@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Hoàng Sơn",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: admin_dept.id,
  user_group_id: manager_emp.id,
  employee_id: kd_1.id,
) if Erp::User.where(email: "tpkinhdoanh@hcmut.edu.vn").empty?
puts "Ket thuc tao nhan vien phong kinh doanh"

puts "Tao nhan vien phong ky thuat"
Erp::User.create(
  email: "kythuat1@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Thu Vân",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: tech_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kt_2.id,
) if Erp::User.where(email: "kythuat1@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kythuat2@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Văn Hoàng Sơn",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: tech_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kt_3.id,
) if Erp::User.where(email: "kythuat2@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kythuat3@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Văn Phong",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: tech_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kt_4.id,
) if Erp::User.where(email: "kythuat3@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kythuat4@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Hoàng Minh",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: tech_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kt_5.id,
) if Erp::User.where(email: "kythuat4@hcmut.edu.vn").empty?
Erp::User.create(
  email: "tpkythuat@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Tôn Hùng",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: tech_dept.id,
  user_group_id: manager_emp.id,
  employee_id: kt_1.id,
) if Erp::User.where(email: "tpkythuat@hcmut.edu.vn").empty?
puts "Ket thuc tao nhan vien phong ky thuat"

puts "Tao nhan vien phong ke hoach"
Erp::User.create(
  email: "kehoach1@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Thu Thanh",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: planing_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kh_2.id,
) if Erp::User.where(email: "kehoach1@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kehoach2@hcmut.edu.vn",
  password: "123456789",
  name: "Nguyễn Văn Phi",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: planing_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kh_3.id,
) if Erp::User.where(email: "kehoach2@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kehoach3@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Văn Mạnh",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: planing_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kh_4.id,
) if Erp::User.where(email: "kehoach3@hcmut.edu.vn").empty?
Erp::User.create(
  email: "kehoach4@hcmut.edu.vn",
  password: "123456789",
  name: "Trần Hoàng Minh",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: planing_dept.id,
  user_group_id: manual_emp.id,
  employee_id: kh_5.id,
) if Erp::User.where(email: "kehoach4@hcmut.edu.vn").empty?
Erp::User.create(
  email: "tpkehoach@hcmut.edu.vn",
  password: "123456789",
  name: "Đỗ Quang Hòa",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: planing_dept.id,
  user_group_id: manager_emp.id,
  employee_id: kh_1.id,
) if Erp::User.where(email: "tpkehoach@hcmut.edu.vn").empty?
puts "Ket thuc tao nhan vien phong ke hoach"