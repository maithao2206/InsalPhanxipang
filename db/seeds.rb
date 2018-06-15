data_category = ["Ao Dai", "Vest", "Ao Phong", "Quan Dui"]
data_product = ["Váy đuôi cá" , "Váy cưới đuôi mèo", "Váy cưới kim sa"]
r = Random.new
# Create User
user = User.create(
  name:"phong",
  password:"12345678",
  email:"admin@insal.com",
  address:"hue",
  phone:"01664304688",
  personal_card: "CMND",
  role:"1")

user = User.create(
  name:"insal",
  password:"12345678",
  email:"admin@insal.com",
  address:"hue",
  phone:"01664304688",
  personal_card: "CMND",
  role:"2")

  user = User.create(
    name:"tan",
    password:"12345678",
    email:"admin@insal.com",
    address:"hue",
    phone:"01664304688",
    personal_card: "CMND",
    role:"3")

#Create category
data_category.each do |item|
  Category.create(name: item)
end

#Create bill
(1..50).to_a.each do |item|
Bill.create(
  start_renting: "27/09/2018",
  end_renting: "22/11/2018",
  total: "39.000",
  status:"hết hạn",
  user_id: 1)

(1..50).to_a.each do |item|
    Product.create(
        name: "hihi#{item}",
        price: item,
        renting_fee: "15.000",
        # image:"ccccc",
        category_id: r.rand(1...3))
  end

size = Size.create(
  name:"XL"
)
ProductSize.create(
  color: "red",
  quantity: 3,
  note: "còn hàng",
  product_id: r.rand(1...49),
  size_id: 1
)
(1..50).to_a.each do |item|
  ProductBill.create(
    renting_quantity: 2,
    renting_fee_product: "30000",
    name_product: "Vay xe ta",
    product_id: r.rand(1...20),
    bill_id: r.rand(1...20),
    size_id: 1)
end
