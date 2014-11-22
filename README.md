koombea-test
============

This is a test I developed to apply for a possition at Koombea.

--

About The part_a&b: (Developed using Ruby 2.1.2)

*They both are basically the same algorithm but I changed the output on each one according to the initial statement, so as you can see on the 'ejer_a.rb' file there are and extra function to handle the printing to the screen.
	
--

About the webapp: (Developed using Ruby 2.1.2, Rails 4.1.4, take a look at the Gemfile)

- Because of the way that the framework works I used the MVC pattern to build the web app.

- I included the Observer Pattern on the Subscriber model, to push a prize to be delivered if thats the case for the current subscriber.

- I used the rails_admiin, device, cancan, bootstrap-sass and valid_email gems in order to reach the goal in a timed manner.

- For make sense to the app, I included a Scheduler that will reset all the tickets of the day, that routine will run at 0:00 each day, this was possible thru 'rufus-scheduler' gem.


