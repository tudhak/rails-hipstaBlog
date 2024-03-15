# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

Message.destroy_all
Article.destroy_all
User.destroy_all

puts "Destroying messages..."
puts "Destroying articles..."
puts "Destroying users..."

# User seed

puts "Creating users"

user1 = User.create(first_name: "Joachim", last_name: "LeJaune", email: "jlejaune@outlook.fr", password: "abc123")
user1.photo.attach(io: URI.open("https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      filename: "user1.jpg", content_type: "image/jpg")

user2 = User.create(first_name: "Grace", last_name: "DeGrust", email: "gdeg@live.com", password: "abc456")
user2.photo.attach(io: URI.open("https://images.pexels.com/photos/10189405/pexels-photo-10189405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      filename: "user2.jpg", content_type: "image/jpg")

user3 = User.create(first_name: "Joyce", last_name: "Van Leek", email: "jqueenie@gmail.com", password: "abc789")
user3.photo.attach(io: URI.open("https://images.pexels.com/photos/3646160/pexels-photo-3646160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      filename: "user3.jpg", content_type: "image/jpg")

user4 = User.create(first_name: "Otto", last_name: "Fuhlenberg", email: "ottoful@aol.com", password: "def123")
user4.photo.attach(io: URI.open("https://images.pexels.com/photos/634021/pexels-photo-634021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      filename: "user4.jpg", content_type: "image/jpg")

puts "Users successfully created."

# Article seed

puts "Creating articles"

article1 = Article.create(title: "Da goat da dee dee",
                          content: "Uryta ppowof sabbh ipuur. Bhaasappas, mayan fakedem, ozob ? Ifoby uurbam mnofoi klopozite.
                                    Izerouaan njonab apouniek, kiommmapadaubifen isbamuofeb âmojinofoz nabhyzd !",
                          user: user1,
                          date: Date.today
                        )

article1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1588466585717-f8041aec7875?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      filename: "goat.jpg", content_type: "image/jpg")

article2 = Article.create(title: "Beanie dog yaa wawa zvouf",
                          content: "Maaadesh dog awazba zoudem aoda apijo pomsnbeuab, uaiy paozdbui maizydv ! Puabsyn, anbudvyz paopapom.
                                    Zbaboush ayst npoobah xopala raboubouv kassoum podesh. Kastalol fagrut sbouder poderash mouyekom kaboul.",
                          user: user1,
                          date: Date.today
                        )

article2.photo.attach(io: URI.open("https://images.unsplash.com/photo-1517423568366-8b83523034fd?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      filename: "dog.jpg", content_type: "image/jpg")

article3 = Article.create(title: "Fajaal mamash shaavou clen",
                          content: "Despeyrom gaglagalou boounavash poyeb derop moufout vadamesh bonobom zbebem yapouv ganour stomaval.
                                  Besteder Ragouyap ! Moukalash bakesh fagoute youpok komever bodave hustamus souzelek kabbit maggar saddem.",
                          user: user3,
                          date: Date.today
                        )

article3.photo.attach(io: URI.open("https://images.unsplash.com/photo-1599351431202-1e0f0137899a?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      filename: "shave.jpg", content_type: "image/jpg")

article4 = Article.create(title: "Plastika gyem haadaar vog",
                          content: "Fougash habeder moukouvak jadopem iadovork proudem ikouts vashim bavnavan soukanay yavots boush,
                                    sourgavi sleket pouqayas groudav vouksdavoush blouk fouyet plastika brof choufk koudev loft sok.",
                          user: user4,
                          date: Date.today
                        )

article4.photo.attach(io: URI.open("https://images.unsplash.com/photo-1598542480973-51f8456286d4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      filename: "plastika.jpg", content_type: "image/jpg")

article5 = Article.create(title: "Pouftal kyavul stoshur",
                          content: "Byafiin toub foutoufl shabbouts zoukdaboumay lakayavayer shosur, estafoulek skazadamap kouyour ?
                                    Oztacem flakkets kipouf broshdag galayer faguetik poumalouf youbem stuf, elakouere saffuut.
                                    Madiyak kulet !",
                          user: user2,
                          date: Date.today
                        )

article5.photo.attach(io: URI.open("https://images.unsplash.com/photo-1544155815-87a399a4712b?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      filename: "shoos.jpg", content_type: "image/jpg")

article6 = Article.create(title: "Yaviid touf soukoum davish",
                          content: "Zbadesh staprut fuksam xeleb beleyogan kutsum stabedek eflekat pomstouk kun. Heyelev !
                                    Shadaag volsayat gonad touf paverr poumstavash hubuul babel sbit sukur hamoum !",
                          user: user2,
                          date: Date.today
                        )

article6.photo.attach(io: URI.open("https://images.unsplash.com/photo-1596352670192-5a95e357df7b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      filename: "tofu.jpg", content_type: "image/jpg")

article7 = Article.create(title: "Shbouk cremad xoyoz habaf",
                          content: "Egget mayyavi opopof gavav vashut tuvalu moufdayag gaveem ! Buder cremsda fioune sbour.
                                    Shoufem makyouval poyots rouvdolik ukalat bayouve pudran gouvni lokakout voundashyk.
                                    Hertebal poukov moyyat vilett...",
                          user: user4,
                          date: Date.today
                        )

article7.photo.attach(io: URI.open("https://images.unsplash.com/photo-1594178990090-ca641059a506?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    filename: "crema.jpg", content_type: "image/jpg")

article8 = Article.create(title: "Youstel obush zvunem yazout",
                          content: "Budek ablouf ? Shaadav moustav butus aloukam fatil proutshek zdafouf, yallaf.
                                    Hufut zulkudam xoutaprov shoukadan besteyev prust, ouglich zatafouf poulest
                                    bruusht fustani ayoukat sader.",
                          user: user3,
                          date: Date.today
                        )

article8.photo.attach(io: URI.open("https://images.unsplash.com/photo-1542576324495-94ce0a2091e1?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      filename: "brush.jpg", content_type: "image/jpg")

article9 = Article.create(title: "Voustr zoup shouk kavaad",
                          content: "Estoulef galaz tayavut katsu foulej hebadij soggut kluf, yamate agandi fute.
                                    Bradoum pougaraf sbed vulagg oft bure, nugvet frigous haribut shtadaf lefek, nunavut.
                                    Moussel !",
                          user: user2,
                          date: Date.today
                        )

article9.photo.attach(io: URI.open("https://images.unsplash.com/photo-1634463278803-f9f71890e67d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      filename: "belly.jpg", content_type: "image/jpg")

article10 = Article.create(title: "Knaf houlab pyouts ruud",
                           content: "Pepel moustaki bougyem yemenitt foulach, jederob toulof salafoumal.
                                     Kaloust kakawet teglagouche shoudab prunasse ustarak zdouyem prots.
                                     Nikouyer hamem badawir ?",
                           user: user2,
                           date: Date.today
                          )

article10.photo.attach(io: URI.open("https://images.unsplash.com/photo-1579455134319-042f718340a4?q=80&w=2076&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                       filename: "gloves.jpg", content_type: "image/jpg")

puts "Articles successfully created."
