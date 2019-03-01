 

1#./bin/Now_playing this is calling ruby implictly thru bash
 
2#  NowPlaying::CLI.new.call # RUN'S the call instance method 
	2A# The call method will call #welcome method
	2B# Call the #list method 
		Scrape the Movies # calling the #Scraper.new 
		create movie objects with the scraped information
		Puts out a sorted list of movies 
	2C# collect user's input
	2D# use users input to collect information on users choice #Find_by_name
		Puts out new information
	2E# Choice Loop
		give's the user the option to view the list again or end the program 
 
 jen's program flow

1. Call the get_description method AFTER a user has chosen a movie

2. Pass in the movie object (i.e. `@movie_list[index]` ) to the  get_description method as an *argument*

3. In the Scraper’s get_description method allow it to accept an argument of a movie

4.   In the Scraper’s get_description method, use `Nokogiri::HTML(open(movie.url))` to open the html of that movie’s webpage

5.  Save that ^^ as a variable

6.  Call your .css(‘selector’) methods on the html that you saved as a variable to get the description

7. Use the `movie` object that you passed in as an argument and the writer method to set the movie’s description. (i.e. `movie.description=` )