User.create(name: 'Steve', birthdate: '1990-01-01')
User.create(name: 'Molly', birthdate: '1993-05-09')
User.create(name: 'John', birthdate: '1954-12-19')
User.create(name: 'Ann', birthdate: '1997-03-01')

require 'csv'
CSV.foreach("breweries.utf8.csv", headers: true) {|row| Brewery.create(name: "#{row[1]}")}
CSV.foreach("beer.utf8.csv", headers: true) {|row| Beer.create(name: "#{row[2]}", brewery_id: "#{row[1]}")}

Review.create(user_id: 1, beer_id: 1, content: 'This beer sucks', rating: 1)
Review.create(user_id: 3, beer_id: 22, content: 'This beer good', rating: 2)
Review.create(user_id: 2, beer_id: 98, content: 'This beer bad', rating: 2)
Review.create(user_id: 4, beer_id: 42, content: 'This beer ok', rating: 4)
Review.create(user_id: 4, beer_id: 540, content: 'This beer really bad', rating: 3)
