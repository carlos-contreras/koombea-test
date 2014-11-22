# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Loading the initial type of rules...'
RuleType.create( name: 'Specific', description: "Using this kind of rule you are inntended to select a winner when she/he subscribe in a specific position, you can specify many numbers")
RuleType.create( name: 'Multiple', description: "Using this kind of rule you are inntended to select a winner when she/he subscribe in a position that is multiple of a number, you can specify just one multiple and you can add the 'after' clause to set a minimun range wich need to be achieve before the first clause will apply")
RuleType.create( name: 'Probability', description: "Using this kind of rule you are inntended to set a specific number of winners within a range but the positions will be randomly selected, you have to use the 'range' clause to set the numbers for the specific range")
puts 'Loading the initial prizes...'
Prize.create( name: 'Free Month', description: "Later on you will get a code in your email, with a free of charge month on the monthy fee of the site", quantity: 20)
Prize.create( name: 'Free Tickets', description: "Later on you will get a code in your email, with a free of charge within the country AirLine ticket", quantity: 10)
puts 'Loading the initial rules...'
Rule.create( numbers: "2,4,6,7,8,10", after: 3, before: 7, prize: Prize.find(1), rule_type: RuleType.find(1))
Rule.create( numbers: "2,10", after: 3, before: 25, prize: Prize.find(2), rule_type: RuleType.find(2))
puts 'Loading the default admin account...'
Admin.create(email: 'admin@example.com', password: '12345678')
