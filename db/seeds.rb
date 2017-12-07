# Create default admin user for developing
puts "Create default admin user"
Erp::User.create(
  email: "1633645@hcmut.edu.vn",
  password: "aA456321@",
  name: "Nguyễn Ngọc Sơn",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true
) if Erp::User.where(email: "1633645@hcmut.edu.vn").empty?
puts "Finish create default admin user"