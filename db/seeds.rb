# Create User
user = User.create(
  name:"phong",
  password:"12345678",
  email:"admin@insal.com",
  address:"hue",
  phone:"01664304688",
  personal_card: "CMND",
  role:"1")
# Create bill
(1..20).to_a.each do |item|
bill = Bill.create(
  start_renting: "27/09/2018",
  end_renting: "22/11/2018",
  total: "39.000",
  status:"hết hạn",
  user_id: 1)
 end
