# -*- coding: utf-8 -*-
require 'date'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = Admin.create!(name:     "admin",
                         password: "000000",
                         password_confirmation:"000000")


    driver1 = Driver.create!(name:     "余靓",
                           phone:    "663941",
                           password: "000000",
                           password_confirmation:"000000")
    driver2 = Driver.create!(name:     "唐振军",
                           phone:    "663984",
                           password: "000000",
                           password_confirmation:"000000")
    driver3 = Driver.create!(name:     "钱家意",
                           phone:    "665701",
                           password: "000000",
                           password_confirmation:"000000")
    driver4 = Driver.create!(name:     "程鹏",
                           phone:    "668799",
                           password: "000000",
                           password_confirmation:"000000")
    driver5 = Driver.create!(name:     "邹睿",
                           phone:    "668346",
                           password: "000000",
                           password_confirmation:"000000")
    driver6 = Driver.create!(name:     "黄明辕",
                           phone:    "13970031807",
                           password: "000000",
                           password_confirmation:"000000")
    driver7 = Driver.create!(name:     "谢强",
                           phone:    "665840",
                           password: "000000",
                           password_confirmation:"000000")
    driver8 = Driver.create!(name:     "章建兵",
                           phone:    "663942",
                           password: "000000",
                           password_confirmation:"000000")
    driver9 = Driver.create!(name:     "梁红林",
                           phone:    "660304",
                           password: "000000",
                           password_confirmation:"000000")
    driver10 = Driver.create!(name:     "李年伟",
                             phone:    "668810",
                             password: "000000",
                             password_confirmation:"000000")
    driver11 = Driver.create!(name:     "魏群敏",
                             phone:    "668759",
                             password: "000000",
                             password_confirmation:"000000")
    driver12 = Driver.create!(name:     "胡晓俊",
                             phone:    "665643",
                             password: "000000",
                             password_confirmation:"000000")
    driver13 = Driver.create!(name:     "徐志华",
                             phone:    "668812",
                             password: "000000",
                             password_confirmation:"000000")
    driver14 = Driver.create!(name:     "蔡浩",
                             phone:    "660351",
                             password: "000000",
                             password_confirmation:"000000")
    driver15 = Driver.create!(name:     "徐后勤",
                             phone:    "18979128743",
                             password: "000000",
                             password_confirmation:"000000")
    driver16 = Driver.create!(name:     "孟建忠",
                             phone:    "663546",
                             password: "000000",
                             password_confirmation:"000000")
    driver17 = Driver.create!(name:     "谭建军",
                             phone:    "664646",
                             password: "000000",
                             password_confirmation:"000000")
    driver18 = Driver.create!(name:     "周卫东",
                             phone:    "668740",
                             password: "000000",
                             password_confirmation:"000000")
    driver19 = Driver.create!(name:     "张建新",
                             phone:    "668467",
                             password: "000000",
                             password_confirmation:"000000")

    car1 = Car.create!(model: "风行",
                       plate:"赣M87711")
    car2 = Car.create!(model: "瑞风",
                       plate:"赣M71479")
    car3 = Car.create!(model: "风神",
                       plate:"赣M71479")
    car4 = Car.create!(model: "皮卡",
                       plate:"赣A26364")
    car5 = Car.create!(model: "东风",
                       plate:"赣A74841")
    car6 = Car.create!(model: "陆虎",
                       plate:"赣A26501")
    car7 = Car.create!(model: "全顺",
                       plate:"赣A28978")
    car8 = Car.create!(model: "顺风",
                       plate:"赣A28725")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")
    car9 = Car.create!(model: "陆虎",
                       plate:"赣A22554")


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

    member1 = User.create!(name:"贺兆哲",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    member2 = User.create!(name:"杜海波",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    member3 = User.create!(name:"程文星",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    member4 = User.create!(name:"朱擘",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    member5 = User.create!(name:"刘小平",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    member6 = User.create!(name:"范思哲",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    member7 = User.create!(name:"刘德华",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group4.id)
    member8 = User.create!(name:"钟小思",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group5.id)
    member9 = User.create!(name:"刘宇",
                             password: "000000",
                             password_confirmation:"000000",
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
    TripMember.create!(trip_id:trip1.id, member_id:member1.id)
    TripMember.create!(trip_id:trip1.id, member_id:member2.id)

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
    TripMember.create!(trip_id:trip2.id, member_id:member3.id)
    TripMember.create!(trip_id:trip2.id, member_id:member4.id)



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
    TripMember.create!(trip_id:trip3.id, member_id:member5.id)
    TripMember.create!(trip_id:trip3.id, member_id:member6.id)

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
    TripMember.create!(trip_id:trip4.id, member_id:member8.id)
    TripMember.create!(trip_id:trip4.id, member_id:member9.id)

  end
end