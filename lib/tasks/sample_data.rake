# -*- coding: utf-8 -*-
require 'date'

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

    car_driver_1 = CarDriver.create!(car_id: car1.id,
                                     driver_id: driver1.id)
    car_driver_2 = CarDriver.create!(car_id: car2.id,
                                     driver_id: driver2.id)
    car_driver_3 = CarDriver.create!(car_id: car3.id,
                                     driver_id: driver3.id)
    car_driver_4 = CarDriver.create!(car_id: car4.id,
                                     driver_id: driver4.id)
    car_driver_5 = CarDriver.create!(car_id: car5.id,
                                     driver_id: driver5.id)
    car_driver_6 = CarDriver.create!(car_id: car6.id,
                                     driver_id: driver6.id)

    dest1 = Destination.create!(name:"南昌变")
    dest2 = Destination.create!(name:"梦山变")
    dest3 = Destination.create!(name:"进贤变")
    dest4 = Destination.create!(name:"永修变")
    dest5 = Destination.create!(name:"安源变")
    dest6 = Destination.create!(name:"石钟山变")

    group1 = Group.create!(name:"一次一班")
    group2 = Group.create!(name:"一次二班")
    group3 = Group.create!(name:"一次三班")
    group4 = Group.create!(name:"二次一班")
    group5 = Group.create!(name:"二次二班")
    group6 = Group.create!(name:"二次三班")

    menber1 = Member.create!(name:"贺兆哲",
                             group_id: group1.id)
    menber2 = Member.create!(name:"杜海波",
                             group_id: group1.id)
    menber3 = Member.create!(name:"程文星",
                             group_id: group2.id)
    menber4 = Member.create!(name:"朱擘",
                             group_id: group2.id)
    menber5 = Member.create!(name:"刘小平",
                             group_id: group3.id)
    menber6 = Member.create!(name:"范思哲",
                             group_id: group3.id)
    menber7 = Member.create!(name:"刘德华",
                             group_id: group4.id)
    menber8 = Member.create!(name:"钟小思",
                             group_id: group5.id)
    menber9 = Member.create!(name:"刘宇",
                             group_id: group6.id)

    trip1 = Trip.create!(car_driver_id: car_driver_1.id,
                         destination_id: dest1.id,
                         departure_time:Date.new(2012,10,28),
                         back_time:Date.new(2012,10,29),
                         note:"年检")
    car_driver_1.current_trip = trip1.id
    car_driver_1.save


    trip2 = Trip.create!(car_driver_id: car_driver_3.id,
                         destination_id: dest3.id,
                         departure_time:Date.new(2012,10,27),
                         back_time:Date.new(2012,10,28),
                         note:"主变检修")
    car_driver_3.current_trip = trip2.id
    car_driver_3.save

    trip3 = Trip.create!(car_driver_id: car_driver_4.id,
                         destination_id: dest3.id,
                         departure_time:Date.new(2012,10,26),
                         back_time:Date.new(2012,10,30),
                         note:"开关检修")
    car_driver_4.current_trip = trip3.id
    car_driver_4.save

    trip4 = Trip.create!(car_driver_id: car_driver_6.id,
                         destination_id: dest5.id,
                         departure_time:Date.new(2012,10,28),
                         back_time:Date.new(2012,10,31),
                         note:"")
    car_driver_6.current_trip = trip4.id
    car_driver_6.save

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
    end
  end
end