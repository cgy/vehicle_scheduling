# -*- coding: utf-8 -*-
require 'date'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name:     "admin",
                         password: "000000",
                         password_confirmation:"000000")
    admin.toggle!(:admin)


    driver1 = User.create!(name:     "李年伟",
                           phone:    "668810",
                           password: "000000",
                           password_confirmation:"000000")
    driver2 = User.create!(name:     "王超",
                           phone:    "663563",
                           password: "000000",
                           password_confirmation:"000000")
    driver3 = User.create!(name:     "黄明辕",
                           phone:    "13970031807",
                           password: "000000",
                           password_confirmation:"000000")
    driver4 = User.create!(name:     "谈建军",
                           phone:    "664646",
                           password: "000000",
                           password_confirmation:"000000")
    driver5 = User.create!(name:     "魏群敏",
                           phone:    "668759",
                           password: "000000",
                           password_confirmation:"000000")
    driver6 = User.create!(name:     "周卫东",
                           phone:    "668740",
                           password: "000000",
                           password_confirmation:"000000")

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
    CarDriver.create!(car_id: car5.id, driver_id: driver2.id)
    trip1 = Trip.create!(car_id: car1.id,
                         user_id: driver1.id,
                         destination_id: dest1.id,
                         departure_time:Date.new(2012,10,28),
                         back_time:Date.new(2012,10,29),
                         note:"年检")
    car1.current_trip = trip1.id
    car1.save
    driver1.current_trip = trip1.id
    driver1.save
    CarDriver.create!(car_id: car1.id, driver_id: driver1.id)


    trip2 = Trip.create!(car_id: car2.id,
                         user_id: driver3.id,
                         destination_id: dest3.id,
                         departure_time:Date.new(2012,10,27),
                         back_time:Date.new(2012,10,28),
                         note:"主变检修")
    car2.current_trip = trip2.id
    car2.save
    driver3.current_trip = trip2.id
    driver3.save
    CarDriver.create!(car_id: car2.id, driver_id: driver3.id)

    trip3 = Trip.create!(car_id: car4.id,
                         user_id: driver5.id,
                         destination_id: dest3.id,
                         departure_time:Date.new(2012,10,26),
                         back_time:Date.new(2012,10,30),
                         note:"开关检修")
    car4.current_trip = trip3.id
    car4.save
    driver5.current_trip = trip3.id
    driver5.save
    CarDriver.create!(car_id: car4.id, driver_id: driver5.id)

    trip4 = Trip.create!(car_id: car5.id,
                         user_id: driver6.id,
                         destination_id: dest5.id,
                         departure_time:Date.new(2012,10,28),
                         back_time:Date.new(2012,10,31),
                         note:"")
    car5.current_trip = trip4.id
    car5.save
    driver6.current_trip = trip4.id
    driver6.save
    CarDriver.create!(car_id: car5.id, driver_id: driver6.id)

  end
end