User.create(name: 'Steve', birthdate: '1990-01-01')


Review.create(user_id: 1, beer_id: 1, content: 'This beer sucks', rating: 1)


require 'csv'

CSV.foreach("breweries.utf8.csv", headers: true) {|row| Brewery.create(name: "#{row[1]}")}
CSV.foreach("beer.utf8.csv", headers: true) {|row| Beer.create(name: "#{row[2]}", brewery_id: "#{row[1]}")}
# parsed_csv = File.open('beer.csv').readlines.map{|line| line.split(',')}
# parsed_csv.shift
#
# parsed_csv.each do |line|
#
#
#
#     home_team = Team.find_or_create_by(name: remove_numbers_from(line[2]))
#     away_team = Team.find_or_create_by(name: remove_numbers_from(line[5]))
#     home_team_score = line[3].split('-')[0].to_i
#     away_team_score = line[3].split('-')[1].to_i
#     # binding.pry
#     Match.create(home_team_id: home_team.id, away_team_id: away_team.id,
#         home_team_score: home_team_score, away_team_score: away_team_score)
# end
