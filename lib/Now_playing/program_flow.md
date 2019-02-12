

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
