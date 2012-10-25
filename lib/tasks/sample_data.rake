namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name:     "admin",
                         password: "000000",
                         password_confirmation:"000000")
    admin.toggle!(:admin)

    driver1 = User.create!(name:     "小强",
                         password: "000000",
                         password_confirmation:"000000")
    driver2 = User.create!(name:     "小任",
                           password: "000000",
                           password_confirmation:"000000")
    driver3 = User.create!(name:     "小钟",
                           password: "000000",
                           password_confirmation:"000000")
    driver4 = User.create!(name:     "申辉",
                           password: "000000",
                           password_confirmation:"000000")
    driver5 = User.create!(name:     "小李",
                           password: "000000",
                           password_confirmation:"000000")
    driver6 = User.create!(name:     "小季",
                           password: "000000",
                           password_confirmation:"000000")


    93.times do |n|
      name = Faker::Name.name
      password = "password"
      User.create!(name:     name,
                   password: password,
                   password_confirmation:password)
    end


    car1 = Car.create!(model: "风神",
                plate:"赣A25568")
    car2 = Car.create!(model: "全顺",
                plate:"赣B14524")
    car3 = Car.create!(model: "风神",
                plate:"赣A78945")
    car4 = Car.create!(model: "皮卡",
                plate:"赣A26364")
    car5 = Car.create!(model: "东风",
                plate:"赣A74841")
    car6 = Car.create!(model: "陆虎",
                plate:"赣A26501")



    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
    end
  end
end