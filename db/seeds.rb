User.create(name: 'Steve', birthdate: '1990-01-01')

Brewery.create(name: 'New Brewery')

Beer.create(name: 'New Beer', brewery_id: 1)

Review.create(user_id: 1, beer_id: 1, content: 'This beer sucks', rating: 1)
