# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Loading the initial type of rules...'
RuleType.create( name: 'Specific', description: "Using this rule rule you will set that the winners will be those visitors who subscribe on the specific positions that you just typed")
RuleType.create( name: 'Multiple', description: "Using this type of rule you will set up a winner each time a user reach a number in the subscription order where that number is multiple of the number or numbers you just typed")
RuleType.create( name: 'Probability', description: "Using this type of rule you'll set a specific probability of selection for the winners, the number you input in the numbers text box will be taken as divisor of 1, then your visitors will have one possibility, in that number you just typed of win a prize on the site after they subscribe.")
puts 'Loading the initial prizes...'
Prize.create( name: 'Free Month', description: "Later on you will get a code in your email, with a free of charge month on the monthy fee of the site", quantity: 20)
Prize.create( name: 'Free Tickets', description: "Later on you will get a code in your email, with a free of charge within the country AirLine ticket", quantity: 10)
puts 'Loading the initial rules...'
Rule.create( numbers: "2,4,6,7,8,10", after: 3, before: 7, prize: Prize.find(1), rule_type: RuleType.find(1))
Rule.create( numbers: "2,10", after: 3, before: 25, prize: Prize.find(2), rule_type: RuleType.find(2))
puts 'Loading the default admin account...'
Admin.create(email: 'admin@example.com', password: '12345678')
