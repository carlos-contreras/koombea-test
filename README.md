koombea-test
============

This is a test I developed to apply for a possition at Koombea.

--

About The part_a&b: (Developed using Ruby 2.1.2)

- They both are basically the same algorithm, I just changed the output to the screen on each one according to the original problem statement, so as you can see on the 'ejer_a.rb' file there are and extra function to handle the printing to the screen.

- First I read line by line of the input file to be able to use the input on runtime.

- The aproach to solve this two problems was to take each word, sort the letters in ascending order, to solve that first part of the problem each word is parsed to become an array where each element is a single letter, then using the function  sort from the Ruby Array Classit get sorted and joined again as string, that string is parsed to a symbol and the symbol is used as key for a Hash, that means that any other word of phrase with the same letters on it will be recognized as an anagram of any one found before and they are being push into an array to track which are anagrams and which are ananagrams.

--

About the webapp: (Developed using Ruby 2.1.2, Rails 4.1.4, take a look at the Gemfile)

- I used the MVC pattern to build the web app wich is the default pattern for the Ruby on Rails framework.

- I included the Observer Pattern on the Subscriber model, I wanted to observe whenever the Subscriber model save a new record or update an old one, if that happen I check all the rules against this new ticket on the system to determine if any rule match and push a prize or prizes to be delivered if that's the case.

- I created three types of rules that the admin can define to let the system know who will win a prize, the first type of rule is 'Specific' which will take a list of Integers separated by commas, and the range and will assign prizes to the subscribers that match against those number if they are inside the range defined by After and Before fields, the second one is 'Multiple', this rule will make that each time a subscriber get a ticket if that number of ticket is multiple of any of the numbers defined in the 'numbers' field that subscriber will win a prize, the last one is 'Probability', this rule define that each user has a 1/number possibility to win a prize and using random generator the app will verify if thats the case, in this last kind of rule just the first number on the numbers field is used.

- Some e.g of rules are: (numbers: "1,4,5,8,10", before: 6, after: 2, rule_type: 1) this will make winners to the subscribers with tickets number 4 and 5 becouse they are within the range definend by [after, before] and they match agains the list of numbers, (numbers: "17, 5", before: 20, after: 6, rule_type: 2) this will make winners the subscriber with tickets 5, 10, 15 and 17, those are multiples even of 17 or 5 and are inside the range, (numbers: "20", before: 200, after: 50, rule_type: 2) this will make winners any subscriber with lucky to get a random number smaller than 0.05 wich represents 5% of probability, so 1 of each 20 subscriber should get a prize in average.

- I decided to set a kind of ticket system where when a visitor subscribe and it's the very first time, the visitor email will be stored along with the ticket number that the system assign him, this ticket number will be valid just for one day, but the email will remain stored even if the subscriber don't try again the next day.

- To handle this ticket system and the overlap of rules, I created a Delivery queue where all prices are pushed using the observer of the Subscriber model, then inside of the controller of the landing page the app can check if there is any pending delivery if that's the case the next prize will be assign to this visitor.

- I used the rails_admiin, device, cancan, bootstrap-sass and valid_email gems in order to reach the goal in a timed manner.

- The administration site is on /admin, and the default user is admin@example.com - password: 12345678.

- In order to run the app, first executle 'bunlde install', then execute rake 'db:migrate', then execute 'rake db:seed' to load the default database and finally use 'rails server', the webapp will be deployed to '127.0.0.1:3000'

- For make sense to the app, I included a Scheduler that will reset all the tickets of the day, that routine will run at 0:00 each day, this was possible thru 'rufus-scheduler' gem.

