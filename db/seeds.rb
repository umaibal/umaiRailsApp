# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
User.destroy_all
Reservation.destroy_all
Table.destroy_all
Restaurant.destroy_all


# Make a few Users:
u1 = User.new(username: 'foodie27',
  firstName: 'Umai',
  lastName: 'Balendra',
  email: 'umai.balendra@gmail.com',
  address: '123 Toronto Road',
  phoneNum: '6472242305',
  paymentMethod: 'Visa Debit')

  u1.save

  u2 = User.new(username: 'selG',
    firstName: 'Selena',
    lastName: 'Gomez',
    email: 'sel02@hotmail.com',
    address: '50 Hollywood Boulevard',
    phoneNum: '42690908765',
    paymentMethod: 'Mastercard') #with no user name
    u2.save

    u3 = User.new(username: 'bmars',
      firstName: 'Bruno',
      lastName: 'Mars',
      email: 'sars@outlook.com',
      address: '24 Wilcox Avenue',
      phoneNum: '1235678954',
      paymentMethod: 'Mastercard')

      u3.save

      u4 = User.new(username: 'LadyG',
        firstName: 'Lady',
        lastName: 'Gaga',
        email: 'gg@hotmail.com',
        address: '144 Henderson Street',
        phoneNum: '4167980909',
        paymentMethod: 'Visa Credit')

        u4.save

        u5 = User.new(username: 'bats',
          firstName: 'Bruce',
          lastName: 'Wayne',
          email: 'batman@gmail.com',
          address: '98 Gotham Road',
          phoneNum: '3427489367',
          paymentMethod: 'American Express')

          u5.save

          u6 = User.new(username: 'Barb',
            firstName: 'Barbara',
            lastName: 'Gordon',
            email: 'bgordon@gmail.com',
            address: '112 Gotham Road',
            phoneNum: '8362718936',
            paymentMethod: 'American Express')

            u6.save

            # Make a few Restaurants:
            r1 = Restaurant.new(name: 'La Bella Managua',
              address: '872 Bloor St W ',
              email: 'resto24@hotmail.com',
              phoneNum: '6147532523',
              website: 'http://www.labellamanagua.com/',
              review: 5,
              cuisineType: 'Nicaraguanese',
              menu: 'www.labellamanagua.com/menu'
              # table_id: 1
            )

            r1.save
            #
            r2 = Restaurant.new(name: 'Hard Rock Cafe',
              address: '100 Hollywood Boulevard',
              email: 'hrcafe@gmail.com',
              phoneNum: '8007643827',
              website: 'http://www.hardrock.com/cafes/hollywood-on-hollywood-blvd/',
              review: 4,
              cuisineType: 'American',
              menu: 'www.hardrock.com/cafe-menu'
              # table_id: 2
            )

            r2.save

            r3 = Restaurant.new(name: 'Magic Noodle',
              address: '93 Harbord Street',
              email: 'magic@hotmail.com',
              phoneNum: '6473458839',
              website: 'http://www.magicnoodle.ca/magic-noodle.html',
              review: 3,
              cuisineType: 'Chinese',
              menu: 'www.magicnoodle.com/menu'
            )

            r3.save

            r4 = Restaurant.new(name: 'Joons',
              address: '4852 Yonge St',
              email: 'joons@gmail.com',
              phoneNum: '4168400589',
              website: 'https://www.yelp.ca/biz/joons-restaurant-north-york',
              review: 2,
              cuisineType: 'Korean',
              menu: 'www.joons.com/menu'
            )

            r4.save

            r5 = Restaurant.new(name: 'El Rey',
              address: '24 Kensington Ave',
              email: 'elrey@gmail.com',
              phoneNum: '7569336564',
              website: 'http://elreybar.com/',
              review: 2,
              cuisineType: 'Mexican',
              menu: 'www.elrey.com/menu'
            )

            r5.save

            # Make some Tables:
            t1 =  Table.new(seats: 2,
              restaurant_id: r1.id
            )

            t1.save

            t2 =  Table.new(seats: 5,
              restaurant_id: r2.id)

              t2.save

              t3 = Table.new(seats: 8,
                restaurant_id: r1.id)

                t3.save

                t4 = Table.new(seats: 3,
                  restaurant_id: r3.id)

                  t4.save

                  t5 = Table.new(seats: 5,
                    restaurant_id: r4.id)

                    t5.save

                    t6 = Table.new(seats: 8,
                      restaurant_id: r5.id)

                      t6.save

                      # Make some Reservations:
                      s1 = Reservation.new(date:'2018-05-02',
                        time:'11:00:00',
                        table_id: t1.id,
                        user_id: u1.id,
                        num_guests:2)

                        s1.save

                        s2 = Reservation.new(date:'2018-05-08',
                          time:'15:35:00',
                          table_id: t2.id,
                          user_id: u2.id,
                          num_guests:3)

                          s2.save

                          s3 = Reservation.new(date:'2018-04-09',
                            time:'18:00:00',
                            table_id: t3.id,
                            user_id: u3.id,
                            num_guests:6)

                            s3.save

                            s4 = Reservation.new(date:'2018-04-23',
                              time:'13:20:00',
                              table_id: t4.id,
                              user_id: u4.id,
                              num_guests:3)

                              s4.save

                              s5 = Reservation.new(date:'2018-02-28',
                                time:'20:00:00',
                                table_id: t5.id,
                                user_id: u5.id,
                                num_guests:8)

                                s5.save

                                s6 = Reservation.new(date:'2018-03-17',
                                  time:'12:00:00',
                                  table_id: t6.id,
                                  user_id: u6.id,
                                  num_guests:3)

                                  s6.save
