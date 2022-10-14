# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserBook.destroy_all
UserEvent.destroy_all
Review.destroy_all
Book.destroy_all
Event.destroy_all
User.destroy_all

mckenzie = User.create(first_name: "McKenzie", last_name: "Fiege", username: "mckenziefiege", city: "Brooklyn", state: "NY", password: "password", image: "https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/40933841_2137921602886985_329832640561545216_o.jpg?_nc_cat=106&_nc_ht=scontent-lga3-1.xx&oh=2f49f5ffb0e259967b6693ea3a3ad51c&oe=5C7D72E1")

grace_girl = Book.create(title: "Grace Girl", author: "Gillian Flynn", description: "On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth wedding anniversary. Presents are being wrapped and reservations are being made when Nick’s clever and beautiful wife disappears. Husband-of-the-Year Nick isn’t doing himself any favors with cringe-worthy daydreams about the slope and shape of his wife’s head, but passages from Amy's diary reveal the alpha-girl perfectionist could have put anyone dangerously on edge. Under mounting pressure from the police and the media—as well as Amy’s fiercely doting parents—the town golden boy parades an endless series of lies, deceits, and inappropriate behavior. Nick is oddly evasive, and he’s definitely bitter—but is he really a killer?", image: "https://images.gr-assets.com/books/1397056917l/19288043.jpg")

gone_girl_review = Review.create(user: mckenzie, book: gone_girl, rating: 4, content: "It was a really suspensful book! Slightly boring at parts but overall I enjoyed it.", title: "Would recommended this book.")

gone_girl_book_club = Event.create(name: "Gone Girl Book Club!", address: "81 Prospect St", city: "Brooklyn", state: "NY", zipcode: "11201" date: "11/26/18", time: "5:00pm", description: "This is the second meet up for Gone Girl. We will be discussing chapter 4-7. We will have various snacks and drinks. Come prepared to discuss :)", host: mckenzie)

mckenzie_gone_girl = UserBook.create(user: mckenzie, book: gone_girl, status: "read")

