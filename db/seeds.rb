Erp::Department.destroy_all

department = Erp::Department.create(name: "Phòng quản lý")
Erp::Department.create(name: "Phòng nhân sự")
Erp::Department.create(name: "Phòng kế toán")
Erp::Department.create(name: "Phòng kinh doanh")
Erp::Department.create(name: "Phòng kế hoạch")

Erp::UserGroup.destroy_all
user_group = Erp::UserGroup.create(name: "Quyền phòng quản lý", permissions: "")

Erp::Employee.destroy_all
employee = Erp::Employee.create(code: "NV0001")

# Create default admin user for developing
puts "Create default admin user"
Erp::User.create(
  email: "1633645@hcmut.edu.vn",
  password: "aA456321@",
  name: "Nguyễn Ngọc Sơn",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true,
  department_id: department.id,
  user_group_id: user_group.id,
  employee_id: employee.id,
) if Erp::User.where(email: "1633645@hcmut.edu.vn").empty?
puts "Finish create default admin user"