# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    admin: true
)
u.skip_confirmation!
u.save!


u = User.new(
    username: "user",
    email: "user@example.com",
    password: "1234",
    admin: false,
    first_name: "Kay",
    last_name: "Blair",
    birthday: Date.today - 30.years,
    position: "Accountant",
    telephone_home: "30932094/3432",
    mobile_phone: "28304/2354",
    telephone_work: "9893/23432",
    marital_status: "single"
)
u.skip_confirmation!
u.save!
