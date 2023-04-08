puts "Seeding user data to the database ...."

User.create!([{
  first_name:              "Admin",
  last_name:               "Test",
  email:                   "admin@test.com",
  password:                "password",
  address:                 "PlotNo: ABC, XYZ, 22222",
  phone_number:            "1111111111"
},
{
  first_name:              "Employee1",
  last_name:               "Test",
  email:                   "employee1@test.com",
  password:                "password",
  address:                 "PlotNo: ABC, XYZ, 22222",
  phone_number:            "2222222222"
},
{
  first_name:              "Employee2",
  last_name:               "Test",
  email:                   "employee2@test.com",
  password:                "password",
  address:                 "PlotNo: ABC, XYZ, 22222",
  phone_number:            "3333333333"
}])

puts "Seeding user data to the database completed"
