# -*- coding: utf-8 -*-
require 'date'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = Admin.create!(name:     "admin",
                         password: "000000",
                         password_confirmation:"000000")

    car1 = Car.create!(model: "风行",
                       plate:"赣M87711",
                       limit:7)
    car2 = Car.create!(model: "瑞风",
                       plate:"赣M71479",
                       limit:7)
    car3 = Car.create!(model: "全顺工程车",
                       plate:"赣AC0325",
                       limit:10)
    car4 = Car.create!(model: "全顺工程车",
                       plate:"赣AC1767",
                       limit:10)
    car5 = Car.create!(model: "瑞风",
                       plate:"赣A0T567",
                       limit:7)
    car6 = Car.create!(model: "全顺",
                       plate:"赣M71806",
                       limit:7)
    car7 = Car.create!(model: "依维柯",
                       plate:"赣AT0062",
                       limit:7)
    car8 = Car.create!(model: "猎豹",
                       plate:"赣M91691",
                       limit:0)
    car9 = Car.create!(model: "瑞风",
                       plate:"赣A0T123",
                       limit:0)
    car10 = Car.create!(model: "风行",
                       plate:"赣M86360",
                       limit:0)
    car11 = Car.create!(model: "风行",
                       plate:"赣A9J223",
                       limit:0)
    car12 = Car.create!(model: "全顺V348",
                       plate:"赣M71801",
                       limit:0)
    car13 = Car.create!(model: "全顺",
                       plate:"赣M96016",
                       limit:0)
    car14 = Car.create!(model: "宝威",
                       plate:"赣A2D973",
                       limit:0)
    car15 = Car.create!(model: "依维柯",
                       plate:"赣M06627",
                       limit:11)
    car16 = Car.create!(model: "全顺工程车",
                       plate:"赣M05231",
                       limit:10)


    dest1 = Destination.create!(name:"南昌变")
    dest2 = Destination.create!(name:"梦山变")
    dest3 = Destination.create!(name:"永修变")
    dest4 = Destination.create!(name:"石钟山变")
    dest5 = Destination.create!(name:"抚州变")
    dest6 = Destination.create!(name:"进贤变")
    dest7 = Destination.create!(name:"鹰潭变")
    dest8 = Destination.create!(name:"乐平变")
    dest9 = Destination.create!(name:"信州变")
    dest10 = Destination.create!(name:"洪源变")
    dest11 = Destination.create!(name:"罗坊变")
    dest12 = Destination.create!(name:"安源变")
    dest13 = Destination.create!(name:"文山变")
    dest14 = Destination.create!(name:"赣州变")
    dest15 = Destination.create!(name:"雷公山变")


    note1 = Note.create!(name:"消缺")
    note2 = Note.create!(name:"临检")
    note3 = Note.create!(name:"定检")
    note4 = Note.create!(name:"抢修")
    note5 = Note.create!(name:"其它")


    group1 = Group.create!(name:"二次一班")
    group2 = Group.create!(name:"二次二班")
    group3 = Group.create!(name:"二次三班")
    group4 = Group.create!(name:"二次四班")
    group5 = Group.create!(name:"开关一班")
    group6 = Group.create!(name:"开关二班")
    group7 = Group.create!(name:"开关三班")
    group8 = Group.create!(name:"开关四班")
    group9 = Group.create!(name:"变压器班")
    group10 = Group.create!(name:"试验班")
    group11 = Group.create!(name:"辅助一班")
    group12 = Group.create!(name:"辅助二班")
    group13 = Group.create!(name:"检修司机一班")
    group14 = Group.create!(name:"检修司机二班")


    #二次一班

    worker1 = Worker.create!(name:"戴斌",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker2 = Worker.create!(name:"陈武恝",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker3 = Worker.create!(name:"胡平",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker4 = Worker.create!(name:"帅玲玲",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker5 = Worker.create!(name:"吴骅",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker6 = Worker.create!(name:"周东",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker7 = Worker.create!(name:"邹明",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker8 = Worker.create!(name:"曾莹",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker9 = Worker.create!(name:"邓哲林",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)


    #二次二班

    worker10 = Worker.create!(name:"赖志刚",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker11 = Worker.create!(name:"杨杰",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker12 = Worker.create!(name:"韩旭光",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker13 = Worker.create!(name:"李声春",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker14 = Worker.create!(name:"吕阳星",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker15 = Worker.create!(name:"刘颿",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker16 = Worker.create!(name:"王燕",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker17 = Worker.create!(name:"周军波",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker18 = Worker.create!(name:"王元楚",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker19 = Worker.create!(name:"蒙天骐",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)



    #二次三班

    worker20 = Worker.create!(name:"吴珂",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker21 = Worker.create!(name:"蔡明",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker22 = Worker.create!(name:"周盛",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker23 = Worker.create!(name:"周小兵",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker24 = Worker.create!(name:"陈裕云",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker25 = Worker.create!(name:"邓清",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker26 = Worker.create!(name:"肖齐",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker27 = Worker.create!(name:"吴颖",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker28 = Worker.create!(name:"程文星",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)

    #二次四班

    worker29 = Worker.create!(name:"万宇",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker30 = Worker.create!(name:"许广伟",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker31 = Worker.create!(name:"周道城",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker32 = Worker.create!(name:"秦纪平",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker33 = Worker.create!(name:"汪建敏",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker34 = Worker.create!(name:"郑潇",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker35 = Worker.create!(name:"刘剑勇",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker36 = Worker.create!(name:"饶诗琴",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker37 = Worker.create!(name:"严一凡",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)

    #开关一班

    worker38 = Worker.create!(name:"刘军农",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker39 = Worker.create!(name:"杨润根",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker40 = Worker.create!(name:"张敏",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker41 = Worker.create!(name:"朱春良",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker42 = Worker.create!(name:"唐武",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker43 = Worker.create!(name:"杨帆",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker44 = Worker.create!(name:"周鹏杰",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker45 = Worker.create!(name:"吴智超",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)

    #开关二班

    worker46 = Worker.create!(name:"黄斌",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker47 = Worker.create!(name:"万平",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker48 = Worker.create!(name:"周洪刚",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker49 = Worker.create!(name:"戴钦来",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker50 = Worker.create!(name:"黄颖",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker51 = Worker.create!(name:"汪志祥",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker52 = Worker.create!(name:"黄凌超",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker53 = Worker.create!(name:"朱宁",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)

    #开关三班

    worker54 = Worker.create!(name:"陶玉骏",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker55 = Worker.create!(name:"陈义强",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker56 = Worker.create!(name:"杨洪斌",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker57 = Worker.create!(name:"欧宇光",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker58 = Worker.create!(name:"熊华维",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker59 = Worker.create!(name:"顾工川",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker60 = Worker.create!(name:"李昊",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker61 = Worker.create!(name:"张喻",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)

    #开关四班

    worker62 = Worker.create!(name:"薄鲁海",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker63 = Worker.create!(name:"吴建明",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker64 = Worker.create!(name:"彭亦龙",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker65 = Worker.create!(name:"辜玄",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker66 = Worker.create!(name:"张小平",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker67 = Worker.create!(name:"朱擘",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker68 = Worker.create!(name:"曾晗",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker69 = Worker.create!(name:"艾戈韬",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)

    #变压器班

    worker70 = Worker.create!(name:"熊继承",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker71 = Worker.create!(name:"魏风林",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker72 = Worker.create!(name:"刘玉玲",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker73 = Worker.create!(name:"谌军",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker74 = Worker.create!(name:"于怀金",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker75 = Worker.create!(name:"郑杰",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker76 = Worker.create!(name:"杨小平",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker77 = Worker.create!(name:"周银彪",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)

    #试验班

    worker78 = Worker.create!(name:"罗利云",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker79 = Worker.create!(name:"黄小红",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker80 = Worker.create!(name:"贺兆哲",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker81 = Worker.create!(name:"钟文慧",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker82 = Worker.create!(name:"李映含",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker83 = Worker.create!(name:"王宇",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)

    #辅助一班

    worker84 = Worker.create!(name:"熊珂",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker85 = Worker.create!(name:"朱国青",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker86 = Worker.create!(name:"梁波",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker87 = Worker.create!(name:"闵捷",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker88 = Worker.create!(name:"王令",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker89 = Worker.create!(name:"郝琦",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker90 = Worker.create!(name:"付金文",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker91 = Worker.create!(name:"彭枫",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker92 = Worker.create!(name:"章司珍",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker93 = Worker.create!(name:"旷凌云",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker94 = Worker.create!(name:"何晶",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker95 = Worker.create!(name:"倪伟林",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker96 = Worker.create!(name:"何帆",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker97 = Worker.create!(name:"杨意华",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker98 = Worker.create!(name:"朱立军",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker99 = Worker.create!(name:"段世金",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker100 = Worker.create!(name:"吴花",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker101 = Worker.create!(name:"万文娟",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker102 = Worker.create!(name:"肖红为",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker103 = Worker.create!(name:"封智利",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)

    #辅助二班

    worker104 = Worker.create!(name:"刘威",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker105 = Worker.create!(name:"李伟",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker106 = Worker.create!(name:"胡岸武",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker107 = Worker.create!(name:"宗征宇",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker108 = Worker.create!(name:"孙喜华",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker109 = Worker.create!(name:"彭晓英",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker110 = Worker.create!(name:"彭璇",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker111 = Worker.create!(name:"王丽珍",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)




    #检修司机一班

    driver1 = Driver.create!(name:     "余靓",
                             phone:    "663941",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver2 = Driver.create!(name:     "唐振军",
                             phone:    "663984",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver3 = Driver.create!(name:     "钱家意",
                             phone:    "665701",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver4 = Driver.create!(name:     "程鹏",
                             phone:    "668799",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver5 = Driver.create!(name:     "邹睿",
                             phone:    "668346",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver6 = Driver.create!(name:     "黄明辕",
                             phone:    "13970031807",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver7 = Driver.create!(name:     "谢强",
                             phone:    "665840",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver8 = Driver.create!(name:     "章建兵",
                             phone:    "663942",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver9 = Driver.create!(name:     "梁红林",
                             phone:    "660304",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group13.id)
    driver10 = Driver.create!(name:     "李年伟",
                              phone:    "668810",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group13.id)


    #检修司机二班

    driver11 = Driver.create!(name:     "魏群敏",
                              phone:    "668759",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)
    driver12 = Driver.create!(name:     "胡晓俊",
                              phone:    "665643",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)
    driver13 = Driver.create!(name:     "徐志华",
                              phone:    "668812",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)
    driver14 = Driver.create!(name:     "蔡浩",
                              phone:    "660351",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)
    driver15 = Driver.create!(name:     "徐后勤",
                              phone:    "18979128743",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)
    driver16 = Driver.create!(name:     "孟建忠",
                              phone:    "663546",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)
    driver17 = Driver.create!(name:     "谈建军",
                              phone:    "664646",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)
    driver18 = Driver.create!(name:     "周卫东",
                              phone:    "668740",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)
    driver19 = Driver.create!(name:     "张建新",
                              phone:    "668467",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group14.id)



    ds1 = Drivership.create!(car_id:    car1.id,
                             driver_id: driver1.id)
    ds2 = Drivership.create!(car_id:    car2.id,
                             driver_id: driver2.id)
    ds3 = Drivership.create!(car_id:    car3.id,
                             driver_id: driver3.id)
    ds4 = Drivership.create!(car_id:    car4.id,
                             driver_id: driver4.id)
    ds5 = Drivership.create!(car_id:    car5.id,
                             driver_id: driver5.id)
    ds6 = Drivership.create!(car_id:    car6.id,
                             driver_id: driver6.id)
    ds7 = Drivership.create!(car_id:    car7.id,
                             driver_id: driver7.id)


    ds8 = Drivership.create!(car_id:    car8.id,
                             driver_id: driver11.id)
    ds9 = Drivership.create!(car_id:    car9.id,
                             driver_id: driver12.id)
    ds10 = Drivership.create!(car_id:    car10.id,
                             driver_id: driver13.id)
    ds11 = Drivership.create!(car_id:    car11.id,
                             driver_id: driver14.id)
    ds12 = Drivership.create!(car_id:    car12.id,
                             driver_id: driver15.id)
    ds13 = Drivership.create!(car_id:    car13.id,
                             driver_id: driver16.id)
    ds14 = Drivership.create!(car_id:    car14.id,
                             driver_id: driver17.id)
    ds15 = Drivership.create!(car_id:    car15.id,
                             driver_id: driver18.id)
    ds16 = Drivership.create!(car_id:    car16.id,
                             driver_id: driver19.id)


    #测试数据





  end
end