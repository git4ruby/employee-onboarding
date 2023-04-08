admin_user =    User.find_by_first_name("Admin")

admin_role =    Role.find_by_name("admin")

admin_user.roles << admin_role