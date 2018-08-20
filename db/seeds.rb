require 'faker'
require 'csv'

20.times do
  User.create(name: Faker::FunnyName.name,
    birthdate: Faker::Date.birthday(21, 100)
  )
end

20 .times do
  User.create(name: Faker::FunnyName.two_word_name,
    birthdate: Faker::Date.birthday(21, 100)
  )
end

CSV.foreach("breweries.utf8.csv", headers: true) {|row| Brewery.create(name: "#{row[1]}")}
CSV.foreach("beer.utf8.csv", headers: true) {|row| Beer.create(name: "#{row[2]}", brewery_id: "#{row[1]}")}

reviews = [
  'This beer sucks!',
  'This beer is phenomenal!',
  'This is horrendous',
  'This beer cured my asthma!',
  'It belongs in the garbage',
  'My dog smelled my beer and ran away from home',
  'This is the greatest thing I have ever tasted!',
  'I hate how much I love this beer',
  'Too many hops',
  'Not enough hops',
  'This beer tastes like oranges',
  'Way too expensive',
  'I need a keg of this stuff in my home!'
]

200.times do
  Review.create(user: User.all.sample, beer: Beer.all.sample, content: reviews.sample, rating: 1 + rand(5))
end
